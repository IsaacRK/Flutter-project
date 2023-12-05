import 'package:flutter/material.dart';
import 'package:vanilla/model/course/course_response.dart';
import 'package:vanilla/repository/course/course_repository.dart';
import 'package:vanilla/widgets/custom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final courseRepository = CourseRepository();
  List<CourseData> courseList = [];

  @override
  // void initState() {
  //   getCourseList();
  //   super.initState();
  // }

  // void getCourseList() async {
  //   courseList = await courseRepository.getCourseList();
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Center(
        child: LoginButton(
          buttonColor: Colors.red,
          buttonTitle: 'Keluar',
          textColor: Colors.white,
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return const AlertDialog(
                      title: Text('keluar?'),
                      content: Row(
                        children: [Text('Iya'), Text('tidak')],
                      ));
                });
          },
        ),
      ),
    );
  }
}
