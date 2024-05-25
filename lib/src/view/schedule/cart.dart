// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:course_scheduler/src/model/course.dart';
import 'package:flutter/cupertino.dart';

import 'package:course_scheduler/src/view/reusableWidgets/coursesList.dart';

class MyCourses extends StatefulWidget {
  List<Course> courses;
  MyCourses({
    Key? key,
    required this.courses,
  }) : super(key: key);

  @override
  State<MyCourses> createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
  @override
  Widget build(BuildContext context) {
    return CoursesList(courses: widget.courses);
  }
}
