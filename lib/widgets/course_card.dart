import 'package:flutter/material.dart';
import 'package:vanilla/model/course/course_response.dart';

class CourseCard extends StatelessWidget {
  final CourseData course;
  const CourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(vertical: 21, horizontal: 18),
      child: Row(children: [
        Container(
          width: 53,
          height: 53,
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.all(13),
          child: Image.network(course.urlCover,
              width: 28,
              height: 28,
              fit: BoxFit.contain, errorBuilder: (context, error, stackTrace) {
            return const Text(
              'No Img',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10),
            );
          }),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(course.courseName),
              Text('${course.jumlahDone}/${course.jumlahMateri}'
                  'Paket Latihan Soal'),
              const SizedBox(height: 11),
              const LinearProgressIndicator(
                value: 0.5,
              ),
            ],
          ),
        )
      ]),
    );
  }
}
