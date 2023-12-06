import 'package:flutter/material.dart';
import 'package:vanilla/model/course/course_response.dart';
import 'package:vanilla/widgets/course_card.dart';

class AllCourseListScreen extends StatelessWidget {
  final List<CourseData> courseList;

  const AllCourseListScreen({super.key, required this.courseList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFF3A7FD5),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          title: const Text(
            'Pilih Pelajaran',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 12,
        ),
        child: ListView.separated(
            shrinkWrap: true,
            itemCount: courseList.length,
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              return CourseCard(course: courseList[index]);
            }),
      ),
    );
  }
}
