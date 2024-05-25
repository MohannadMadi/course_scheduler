// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
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
  List<String>? users;
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'courseId': courseId,
      'courseName': courseName,
      'numberOfCredits': numberOfCredits,
      'totalSeats': totalSeats,
      'remainingSeats': remainingSeats,
      'secNumber': secNumber,
      'subType': subType,
      'instructor': instructor,
      'users': users,
      'location': location,
      'description': description,
      'startTime': startTime?.millisecondsSinceEpoch,
      'endTime': endTime?.millisecondsSinceEpoch,
      'registered': registered,
      'denied': denied,
    };
  }

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      courseId: map['courseId'] != null ? map['courseId'] as String : null,
      courseName:
          map['courseName'] != null ? map['courseName'] as String : null,
      numberOfCredits: map['numberOfCredits'] != null
          ? map['numberOfCredits'] as double
          : null,
      totalSeats: map['totalSeats'] != null ? map['totalSeats'] as int : null,
      remainingSeats:
          map['remainingSeats'] != null ? map['remainingSeats'] as int : null,
      secNumber: map['secNumber'] != null ? map['secNumber'] as String : null,
      subType: map['subType'] != null ? map['subType'] as String : null,
      instructor:
          map['instructor'] != null ? map['instructor'] as String : null,
      users: map['users'] != null
          ? List<String>.from((map['users'] as List<String>))
          : null,
      location: map['location'] != null ? map['location'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      startTime: map['startTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['startTime'] as int)
          : null,
      endTime: map['endTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['endTime'] as int)
          : null,
      registered: map['registered'] != null ? map['registered'] as bool : null,
      denied: map['denied'] != null ? map['denied'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Course.fromJson(String source) =>
      Course.fromMap(json.decode(source) as Map<String, dynamic>);
}
