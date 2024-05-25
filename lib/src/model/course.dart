// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:core';

import 'package:course_scheduler/src/model/user.dart';

class Course {
  String? courseId;
  String? courseName;
  double? numberOfCredits;
  int? totalSeats;
  int? remainingSeats;

  String? secNumber;
  String? subType;
  String? instructor;
  List<CustomUser>? users;
  String? location;
  String? description;
  DateTime? startTime;
  DateTime? endTime;
  bool? registered;
  bool? denied;
  // String?dayOfWeek=DateTime.wednesday.;
  Course({
    this.courseId,
    this.courseName,
    this.numberOfCredits,
    this.totalSeats,
    this.remainingSeats,
    this.secNumber,
    this.subType,
    this.instructor,
    this.users,
    this.location,
    this.description,
    this.startTime,
    this.endTime,
    this.registered,
    this.denied,
  });
}
