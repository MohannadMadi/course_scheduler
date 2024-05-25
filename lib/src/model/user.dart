// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:course_scheduler/src/model/course.dart';

class CustomUser {
  String uid;

  CustomUser({
    required this.uid,
  });
}

class UserData {
  String name;
  String email;
  List<Course> coursesInCart;
  int maxCredits;
  int takenCredits;
  UserData({
    required this.name,
    required this.email,
    required this.coursesInCart,
    required this.maxCredits,
    required this.takenCredits,
  });
}
