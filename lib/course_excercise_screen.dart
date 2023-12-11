import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vanilla/blocs/course_excercise/course_excercise_bloc.dart';
import 'package:vanilla/repository/course/course_repository.dart';

class CourseExcerciseScreen extends StatelessWidget {
  final String courseTitle;
  const CourseExcerciseScreen({super.key, required this.courseTitle});

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
          title: Text(
            courseTitle,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
          )),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<CourseExcerciseBloc, CourseExcerciseState>(
          builder: (context, state) {
            if (state is CourseExcerciseSuccess) {
              return GridView.builder(
                shrinkWrap: true,
                itemCount: state.courseExcerciseList.length,
                itemBuilder: (context, index) {
                  final excercise = state.courseExcerciseList[index];
                  return Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 36,
                            width: 36,
                            padding: const EdgeInsets.all(11),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade100,
                            ),
                            child: Image.network(excercise.icon,
                                errorBuilder: (context, error, stackTrace) {
                              return const Text(
                                'No Img',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 10),
                              );
                            }),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            excercise.exerciseTitle,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            '${excercise.jumlahDone}/${excercise.jumlahSoal} Soal',
                            style: const TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF8E8E8E)),
                          ),
                        ],
                      ));
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.4,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
              );
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
