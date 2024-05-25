import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_scheduler/src/model/course.dart';
import 'package:course_scheduler/src/model/user.dart';

class DatabaseServices {
  DatabaseServices() {}

  final CollectionReference usersColletion =
      FirebaseFirestore.instance.collection("users");
  final CollectionReference coursesColletion =
      FirebaseFirestore.instance.collection("courses");

  Future updateUserData(String name, String email, int maxCredits,
      List<Course> coursesInCart, int takenCredits, String uid) async {
    return await usersColletion.doc(uid).set({
      'name': name,
      'email': email,
      'maxCredits': maxCredits,
      'coursesInCart': coursesInCart,
      'takenCredits': takenCredits,
    });
  }

  Future addCourseToUser(Course course, String uid) async {
    await usersColletion.doc(uid).update({
      'coursesInCart': FieldValue.arrayUnion([course.toMap()]),
    });
    await usersColletion.doc(uid).update({
      'takenCredits': FieldValue.increment(course.numberOfCredits!),
    });

    await addUserToCourse(course.courseId!, uid);
  }

  Future removeCourseFromUser(Course course, String uid) async {
    await usersColletion.doc(uid).update({
      'coursesInCart': FieldValue.arrayRemove([course.toMap()]),
    });
    await usersColletion.doc(uid).update({
      'takenCredits': FieldValue.increment(-course.numberOfCredits!),
    });
    await removeUserFromCourse(course.courseId!, uid);
  }

  Future addUserToCourse(String courseId, String uid) async {
    await coursesColletion.doc(courseId).update({
      'users': FieldValue.arrayUnion([uid]),
    });
    coursesColletion.doc(courseId).update({
      'remainingSeats': FieldValue.increment(-1),
    });
  }

  Future removeUserFromCourse(String courseId, String uid) async {
    await coursesColletion.doc(courseId).update({
      'users': FieldValue.arrayRemove([uid]),
    });
    coursesColletion.doc(courseId).update({
      'remainingSeats': FieldValue.increment(1),
    });
  }

  Future updateCourseData(Course course) async {
    return await coursesColletion.doc("5PWQn8gIO6gqy0HFCmGL").set({
      'courseId': course.courseId,
      'courseName': course.courseName,
      'numberOfCredits': course.numberOfCredits,
      'totalSeats': course.totalSeats,
      'remainingSeats': course.remainingSeats,
      'secNumber': course.secNumber,
      'subType': course.subType,
      'instructor': course.instructor,
      'users': course.users,
      'location': course.location,
      'description': course.description,
      'startTime': course.startTime,
      'endTime': course.endTime,
      'registered': course.registered,
      'denied': course.denied,
    });
  }

  Future addCourse(Course course) async {
    return await coursesColletion.add({
      'courseName': course.courseName,
      'numberOfCredits': course.numberOfCredits,
      'totalSeats': course.totalSeats,
      'remainingSeats': course.remainingSeats,
      'secNumber': course.secNumber,
      'subType': course.subType,
      'instructor': course.instructor,
      'users': course.users,
      'location': course.location,
      'description': course.description,
      'startTime': course.startTime,
      'endTime': course.endTime,
      'registered': course.registered,
      'denied': course.denied,
    });
  }

  List<Course> _courseListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>? ?? {};
      return Course(
        courseId: doc.id,
        courseName: data['courseName'] ?? '',
        numberOfCredits: data['numberOfCredits'] ?? 0,
        totalSeats: data['totalSeats'] ?? 0,
        remainingSeats: data['remainingSeats'] ?? 0,
        secNumber: data['secNumber'] ?? '',
        subType: data['subType'] ?? '',
        instructor: data['instructor'] ?? '',
        users: List<String>.from(data['users'] ?? []),
        location: data['location'] ?? '',
        description: data['description'] ?? '',
        startTime:
            (data['startTime'] as Timestamp?)?.toDate() ?? DateTime.now(),
        endTime: (data['endTime'] as Timestamp?)?.toDate() ?? DateTime.now(),
        registered: data['registered'] ?? false,
        denied: data['denied'] ?? false,
      );
    }).toList();
  }

  Stream<List<Course>> get courses {
    return coursesColletion.snapshots().map(_courseListFromSnapshot);
  }
}
