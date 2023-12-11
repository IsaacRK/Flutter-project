part of 'course_excercise_bloc.dart';

@immutable
sealed class CourseExcerciseState {}

final class CourseExcerciseInitial extends CourseExcerciseState {}

final class CourseExcerciseLoading extends CourseExcerciseState {}

final class CourseExcerciseSuccess extends CourseExcerciseState {
  final List<CourseExcerciseData> courseExcerciseList;

  CourseExcerciseSuccess({required this.courseExcerciseList});
}

final class CourseExcerciseFailed extends CourseExcerciseState {
  final String errorMessage;

  CourseExcerciseFailed({required this.errorMessage});
}
