part of 'course_bloc.dart';

@immutable
sealed class CourseState {}

final class CourseInitial extends CourseState {}

final class CourseLoading extends CourseState {}

final class CourseSuccess extends CourseState {
  final List<CourseData> courseList;

  CourseSuccess({required this.courseList});
}

final class CourseFailed extends CourseState {
  final String errorMessage;

  CourseFailed({required this.errorMessage});
}

final class CourseExcerciseLoading extends CourseState {}

final class CourseExcerciseSuccess extends CourseState {
  final List<CourseData> courseList;

  CourseExcerciseSuccess({required this.courseList});
}

final class CourseExcerciseFailed extends CourseState {
  final String errorMessage;

  CourseExcerciseFailed({required this.errorMessage});
}
