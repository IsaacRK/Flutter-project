part of 'course_excercise_bloc.dart';

@immutable
sealed class CourseExcerciseEvent {}

class GetCourseExcerciseEvent extends CourseExcerciseEvent {
  final String courseId;

  GetCourseExcerciseEvent({required this.courseId});
}
