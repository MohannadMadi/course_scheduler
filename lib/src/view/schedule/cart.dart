// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:course_scheduler/src/model/course.dart';
import 'package:course_scheduler/src/model/user.dart';
import 'package:course_scheduler/src/services/database.dart';
import 'package:flutter/cupertino.dart';

import 'package:course_scheduler/src/view/reusableWidgets/coursesList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCourses extends StatefulWidget {
  // List<Course> courses;
  MyCourses({
    Key? key,
    // required this.courses,
  }) : super(key: key);

  @override
  State<MyCourses> createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
  final _db = DatabaseServices();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _db.getUserById(context.watch<CustomUser>().uid),
      builder: (BuildContext context, AsyncSnapshot<UserData?> snapshot) {
        return snapshot.hasData
            ? CoursesList(
                courses: snapshot.data!.coursesInCart,
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
