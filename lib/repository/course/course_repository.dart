import 'package:dio/dio.dart';
import 'package:vanilla/constants/constants.dart';
import 'package:vanilla/model/course/course_excercise_response.dart';
import 'package:vanilla/model/course/course_response.dart';

class CourseRepository {
  Future<List<CourseData>> getCourseList([String? majorName]) async {
    try {
      //isi url api
      const url =
          'https://edspert.widyaedu.com/exercise/data_course?major_name=IPA&user_email=testerngbayu@gmail.com';

      final response = await Dio().get(url,
          options: Options(
              headers: {'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a0'}));
      final courseResponse = CourseResponse.fromJson(response.data);
      return courseResponse.data;
    } catch (e) {
      print('error at courseRepository $e');
      rethrow;
    }
  }

  Future<List<CourseExcerciseData>> getCourseExcerciseList(
      String courseId) async {
    try {
      const url = 'https://edspert.widyaedu.com/exercise/data_exercise';

      final response = await Dio().get(url,
          queryParameters: {
            "course_id": courseId,
            "user_email": "testerngbayu@gmail.com"
          },
          options: Options(headers: LearningConstants.headers.toJson()));

      final courseExcerciseData =
          CourseExcrciseResponse.fromJson(response.data);
      return courseExcerciseData.data;
    } catch (e) {
      print('Error at CourseRepository $e');
      rethrow;
    }
  }
}
