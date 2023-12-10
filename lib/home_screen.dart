import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vanilla/all_course_list_screen.dart';
import 'package:vanilla/blocs/banner/banner_bloc.dart';
import 'package:vanilla/blocs/course/course_bloc.dart';
import 'package:vanilla/repository/banner/banner_repository.dart';
import 'package:vanilla/repository/course/course_repository.dart';
import 'package:vanilla/widgets/course_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CourseBloc>(
          create: (context) => CourseBloc(courseRepository: CourseRepository())
            ..add(GetCourseListEvent(majorName: 'IPA')),
        ),
        BlocProvider<BannerBloc>(
          create: (context) => BannerBloc(bannerRepository: BannerRepository())
            ..add(GetBannerListEvent()),
        ),
      ],
      child: Scaffold(
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
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
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
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      BlocBuilder<CourseBloc, CourseState>(
                        builder: (context, state) {
                          if (state is CourseSuccess) {
                            return TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AllCourseListScreen(
                                                  courseList:
                                                      state.courseList)));
                                },
                                child: const Text(
                                  'Lihat Semua',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500),
                                ));
                          }

                          return const TextButton(
                              onPressed: null,
                              child: Text(
                                'Lihat Semua',
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w500),
                              ));
                        },
                      ),
                    ],
                  ),
                  BlocBuilder<CourseBloc, CourseState>(
                      builder: (context, state) {
                    if (state is CourseFailed) {}
                    if (state is CourseSuccess) {
                      return ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        // itemCount: courseList.length,
                        itemCount: 3,
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 8,
                        ),
                        itemBuilder: (context, index) {
                          return CourseCard(course: state.courseList[index]);
                        },
                      );
                    }

                    return const Center(child: CircularProgressIndicator());
                  }),
                  // courseList.isNotEmpty

                  //     : const CircularProgressIndicator(),
                  const SizedBox(height: 27),
                  const Text(
                    'Terbaru',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),

                  BlocBuilder<BannerBloc, BannerState>(
                    builder: (context, state) {
                      if (state is BannerFailed) {}
                      if (state is BannerSuccess) {
                        return SizedBox(
                          height: 146,
                          child: ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 8),
                            itemCount: state.bannerList.length,
                            // itemCount: 3,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: SizedBox(
                                    width: 284,
                                    height: 146,
                                    child: Image.network(
                                        state.bannerList[index].eventImage,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                      return const Text(
                                        'No Img',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 10),
                                      );
                                    })),
                              );
                            },
                          ),
                        );
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  )
                ],
              ),
            ),
          )),
    );
  }
}
