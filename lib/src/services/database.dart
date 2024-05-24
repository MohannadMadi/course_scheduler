import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_scheduler/src/model/course.dart';
import 'package:course_scheduler/src/model/user.dart';

class DatabaseServices {
  final String? uid;
  DatabaseServices({this.uid});

  final CollectionReference usersColletion =
      FirebaseFirestore.instance.collection("users");
  final CollectionReference coursesColletion =
      FirebaseFirestore.instance.collection("courses");
  Future updateUserData(String name, String email, int maxCredits) async {
    return await usersColletion.doc(uid).set({
      'name': name,
      'email': email,
      'maxCredits': maxCredits,
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
        users: List<CustomUser>.from(data['users'] ?? []),
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
