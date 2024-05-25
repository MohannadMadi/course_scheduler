// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:course_scheduler/src/utils/colors.dart';
import 'package:course_scheduler/src/view/reusableWidgets/registration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/course.dart';

class CourseButton extends StatefulWidget {
  Course course;
  CourseButton({
    super.key,
    required this.course,
  });

  @override
  State<CourseButton> createState() => _CourseButtonState();
}

class _CourseButtonState extends State<CourseButton> {
  @override
  Widget build(BuildContext context) {
    const List<String> daysOfWeek = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];

    // Return the name of the day corresponding to the weekday
    // Note: DateTime.weekday returns 1 for Monday, ..., 7 for Sunday

    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => Padding(
                  padding: EdgeInsets.all(20),
                  child: CourseDetailsWidget(
                    course: widget.course,
                  ),
                ));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.midBlack,
            boxShadow: const [
              BoxShadow(
                color: AppColors.mainTextColor,
                blurRadius: 2,
                spreadRadius: .1,
                offset: Offset(0, 0),
              )
            ]),
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
                alignment: Alignment.topLeft,
                child: Text(
                  widget.course.courseName!,
                  style:
                      const TextStyle(fontSize: 25, color: AppColors.mainBlue),
                )),
            Row(
              children: [
                Text(
                  "section: ${widget.course.secNumber!}",
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  " | subtype: ${widget.course.subType!}",
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Duration: ${widget.course.startTime!.month}/${widget.course.startTime!.day}/${widget.course.startTime!.year} - ${widget.course.endTime!.month}/${widget.course.endTime!.day}/${widget.course.endTime!.year}",
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(daysOfWeek[widget.course.startTime!.weekday - 1],
                  style: const TextStyle(fontSize: 30)),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                  "location: Nile university, ${widget.course.location!}",
                  style: const TextStyle(fontSize: 20)),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text("instructor: ${widget.course.instructor!}",
                  style: const TextStyle(fontSize: 20)),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Credits: ${widget.course.numberOfCredits!}",
                  style: const TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: 40,
                ),
                Text(
                  "Remaining seats: ${widget.course.remainingSeats!}",
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
