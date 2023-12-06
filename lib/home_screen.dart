import 'package:flutter/material.dart';
import 'package:vanilla/all_course_list_screen.dart';
import 'package:vanilla/model/banner/banner_response.dart';
import 'package:vanilla/model/course/course_response.dart';
import 'package:vanilla/repository/banner/banner_repository.dart';
import 'package:vanilla/repository/course/course_repository.dart';
import 'package:vanilla/widgets/course_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final courseRepository = CourseRepository();
  final bannerRepository = BannerRepository();

  List<CourseData> courseList = [];
  List<BannerData> bannerList = [];

  @override
  void initState() {
    getCourseList();
    getBannerList();
    super.initState();
  }

  void getCourseList() async {
    courseList = await courseRepository.getCourseList();
    setState(() {});
  }

  void getBannerList() async {
    bannerList = await bannerRepository.getBannerList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(''),
              ),
            )
          ],
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hai, Altop',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
              Text('Selamat Datang',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400))
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 147,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: const Color(0xFF3A7FD5),
                        borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.only(left: 20, top: 26),
                    child: Row(children: [
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Mau kerjain\nlatihan soal\napa hari ini?',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Image.asset('assets/img/banner.png'),
                        ),
                      )
                    ])),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Pilih Pelajaran',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllCourseListScreen(
                                      courseList: courseList)));
                        },
                        child: const Text(
                          'Lihat Semua',
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w500),
                        )),
                  ],
                ),
                courseList.isNotEmpty
                    ? ListView.separated(
                        shrinkWrap: true,
                        // itemCount: courseList.length,
                        itemCount: 3,
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 8,
                        ),
                        itemBuilder: (context, index) {
                          return CourseCard(course: courseList[index]);
                        },
                      )
                    : const CircularProgressIndicator(),
                const SizedBox(height: 27),
                const Text(
                  'Terbaru',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                if (bannerList.isNotEmpty)
                  SizedBox(
                    height: 146,
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 8),
                      itemCount: bannerList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: SizedBox(
                              width: 284,
                              height: 146,
                              child: Image.network(bannerList[index].eventImage,
                                  errorBuilder: (context, error, stackTrace) {
                                return const Text(
                                  'No Img',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 10),
                                );
                              })),
                        );
                      },
                    ),
                  )
                else
                  const CircularProgressIndicator()
              ],
            ),
          ),
        ));
  }
}
