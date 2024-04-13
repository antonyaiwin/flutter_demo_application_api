import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_api/model/response_model.dart';
import 'package:flutter_application_api/model/student_model.dart';
import 'package:http/http.dart' as http;

class HomeScreenController with ChangeNotifier {
  ResponseModel? responseModel;
  bool isLoading = false;
  Map<String, dynamic> studentMap = {
    'name': 'aiwin',
    'place': 'eloor',
    'age': 25,
    'ph': '1234567890',
    'batch': 'jan',
  };
  Map<String, dynamic> studentListMap = {
    "studentModel": [
      {
        "name": "asdfgh",
        "place": "123456789",
        "age": 3,
        "ph": "23456789",
        "batch": "cvbnm,",
      },
      {
        "name": "John Doe",
        "place": "987654321",
        "age": 20,
        "ph": "9876543210",
        "batch": "xyz",
      },
      {
        "name": "Jane Smith",
        "place": "456789123",
        "age": 25,
        "ph": "1234567890",
        "batch": "abc",
      },
      // Add more data here as needed
    ]
  };
  // late StudentModel stuModel;
  late List<StudentModel> stuModelList;

  void convertToModel() {
    // stuModel = StudentModel.fromMap(studentMap);

    stuModelList = StudentResModel.fromJson(studentListMap).studentModel;
    notifyListeners();
  }

  Future getData() async {
    isLoading = true;
    notifyListeners();
    var uri = Uri.parse('https://reqres.in/api/users?page=2');
    var res = await http.get(uri);
    if (res.statusCode == 200) {
      log(res.body);
      responseModel = responseModelFromJson(res.body);
    } else {
      log('failed');
    }
    isLoading = false;
    notifyListeners();
  }
}
