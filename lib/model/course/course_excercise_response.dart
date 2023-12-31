// To parse this JSON data, do
//
//     final excrciseResponse = excrciseResponseFromJson(jsonString);

import 'dart:convert';

CourseExcrciseResponse excrciseResponseFromJson(String str) =>
    CourseExcrciseResponse.fromJson(json.decode(str));

String excrciseResponseToJson(CourseExcrciseResponse data) =>
    json.encode(data.toJson());

class CourseExcrciseResponse {
  int status;
  String message;
  List<CourseExcerciseData> data;

  CourseExcrciseResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CourseExcrciseResponse.fromJson(Map<String, dynamic> json) =>
      CourseExcrciseResponse(
        status: json["status"],
        message: json["message"],
        data: List<CourseExcerciseData>.from(
            json["data"].map((x) => CourseExcerciseData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CourseExcerciseData {
  String exerciseId;
  String exerciseTitle;
  String accessType;
  String icon;
  String exerciseUserStatus;
  String jumlahSoal;
  int jumlahDone;

  CourseExcerciseData({
    required this.exerciseId,
    required this.exerciseTitle,
    required this.accessType,
    required this.icon,
    required this.exerciseUserStatus,
    required this.jumlahSoal,
    required this.jumlahDone,
  });

  factory CourseExcerciseData.fromJson(Map<String, dynamic> json) =>
      CourseExcerciseData(
        exerciseId: json["exercise_id"],
        exerciseTitle: json["exercise_title"],
        accessType: json["access_type"],
        icon: json["icon"],
        exerciseUserStatus: json["exercise_user_status"],
        jumlahSoal: json["jumlah_soal"],
        jumlahDone: json["jumlah_done"],
      );

  Map<String, dynamic> toJson() => {
        "exercise_id": exerciseId,
        "exercise_title": exerciseTitle,
        "access_type": accessType,
        "icon": icon,
        "exercise_user_status": exerciseUserStatus,
        "jumlah_soal": jumlahSoal,
        "jumlah_done": jumlahDone,
      };
}
