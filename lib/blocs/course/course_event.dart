part of 'course_bloc.dart';

@immutable
sealed class CourseEvent {}

class GetCourseListEvent extends CourseEvent {
  final String majorName;

  GetCourseListEvent({required this.majorName});
}

class GetCourseExcerciseEvent extends CourseEvent {
  final String courseId;

  GetCourseExcerciseEvent({required this.courseId});
}
