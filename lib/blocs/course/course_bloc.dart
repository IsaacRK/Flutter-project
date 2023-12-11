import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vanilla/model/course/course_excercise_response.dart';
import 'package:vanilla/model/course/course_response.dart';
import 'package:meta/meta.dart';
import 'package:vanilla/repository/course/course_repository.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final CourseRepository courseRepository;

  CourseBloc({required this.courseRepository}) : super(CourseInitial()) {
    on<CourseEvent>((event, emit) async {
      if (event is GetCourseListEvent) {
        emit(CourseLoading());
        final data = await courseRepository.getCourseList(event.majorName);

        emit(CourseSuccess(courseList: data));
      }
    });
  }
}
