import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vanilla/model/course/course_excercise_response.dart';
import 'package:vanilla/repository/course/course_repository.dart';

part 'course_excercise_event.dart';
part 'course_excercise_state.dart';

class CourseExcerciseBloc
    extends Bloc<CourseExcerciseEvent, CourseExcerciseState> {
  final CourseRepository courseRepository;
  CourseExcerciseBloc({required this.courseRepository})
      : super(CourseExcerciseInitial()) {
    on<CourseExcerciseEvent>((event, emit) async {
      if (event is GetCourseExcerciseEvent) {
        emit(CourseExcerciseLoading());

        final data =
            await courseRepository.getCourseExcerciseList(event.courseId);

        emit(CourseExcerciseSuccess(courseExcerciseList: data));
      }
    });
  }
}
