// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

import '../../../model/course.dart';

class CourseButton extends StatefulWidget {
  Course course;
  CourseButton({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  State<CourseButton> createState() => _CourseButtonState();
}

class _CourseButtonState extends State<CourseButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.course.courseName!),
      ],
    );
  }
}
