// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:course_scheduler/src/view/homePage/components/courseButton.dart';
import 'package:flutter/cupertino.dart';

import 'package:course_scheduler/src/model/course.dart';

class CoursesList extends StatefulWidget {
  List<Course?>? courses;
  CoursesList({
    super.key,
    required this.courses,
  });

  @override
  State<CoursesList> createState() => _CoursesListState();
}

class _CoursesListState extends State<CoursesList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.courses!.length,
      itemBuilder: (context, index) =>
          CourseButton(course: widget.courses![index]!),
    );
  }
}
