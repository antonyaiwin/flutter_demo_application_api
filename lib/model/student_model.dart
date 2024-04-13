// To parse this JSON data, do
//
//     final studentResModel = studentResModelFromJson(jsonString);

import 'dart:convert';

StudentResModel studentResModelFromJson(String str) =>
    StudentResModel.fromJson(json.decode(str));

String studentResModelToJson(StudentResModel data) =>
    json.encode(data.toJson());

class StudentResModel {
  List<StudentModel> studentModel;

  StudentResModel({
    required this.studentModel,
  });

  factory StudentResModel.fromJson(Map<String, dynamic> json) =>
      StudentResModel(
        studentModel: List<StudentModel>.from(
            json["studentModel"].map((x) => StudentModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "studentModel": List<dynamic>.from(studentModel.map((x) => x.toJson())),
      };
}

class StudentModel {
  String name;
  String place;
  int age;
  String ph;
  String batch;

  StudentModel({
    required this.name,
    required this.place,
    required this.age,
    required this.ph,
    required this.batch,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
        name: json["name"],
        place: json["place"],
        age: json["age"],
        ph: json["ph"],
        batch: json["batch"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "place": place,
        "age": age,
        "ph": ph,
        "batch": batch,
      };
}
