// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:course_scheduler/src/model/user.dart';
import 'package:course_scheduler/src/services/database.dart';
import 'package:course_scheduler/src/utils/colors.dart';
import 'package:flutter/material.dart';

import 'package:course_scheduler/src/model/course.dart';
import 'package:provider/provider.dart';

class CourseDetailsWidget extends StatefulWidget {
  Course course;

  CourseDetailsWidget({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  State<CourseDetailsWidget> createState() => _CourseDetailsWidgetState();
}

class _CourseDetailsWidgetState extends State<CourseDetailsWidget> {
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
    final _db = DatabaseServices();
    bool isRegistered = context
        .read<List<Course?>?>()!
        .firstWhere((element) => element!.courseId == widget.course.courseId)!
        .users!
        .contains(context.read<CustomUser>().uid);
    return Card(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.course.courseName!,
                      style: TextStyle(fontSize: 40),
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              widget.course.numberOfCredits.toString(),
                              style: TextStyle(fontSize: 30),
                            ),
                            Text("credits"),
                          ],
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Column(
                          children: [
                            Text(
                              widget.course.totalSeats.toString(),
                              style: TextStyle(fontSize: 30),
                            ),
                            Text("Total Seats"),
                          ],
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Column(
                          children: [
                            Text(
                              widget.course.remainingSeats.toString(),
                              style: TextStyle(fontSize: 30),
                            ),
                            Text("remaining Seats"),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "section: ${widget.course.secNumber!}",
                          style: const TextStyle(fontSize: 15),
                        ),
                        Text(
                          " | subtype: ${widget.course.subType!}",
                          style: const TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text("instructor: ${widget.course.instructor!}",
                          style: const TextStyle(fontSize: 15)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: AppColors.mainBlue)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${widget.course.startTime!.hour}:${widget.course.startTime!.minute}-${widget.course.endTime!.hour}:${widget.course.endTime!.minute}",
                            style: TextStyle(fontSize: 20),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                                daysOfWeek[
                                    widget.course.startTime!.weekday - 1],
                                style: const TextStyle(fontSize: 20)),
                          ),
                          Text("Nile university, ${widget.course.location!}",
                              style: const TextStyle(fontSize: 20))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Course Description",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      widget.course.description!,
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            InkWell(
              onTap: () {
                // print(context.read<CustomUser>().uid);
                if (isRegistered) {
                  _db.removeCourseFromUser(
                      widget.course, context.read<CustomUser>().uid);
                } else {
                  _db.addCourseToUser(
                      widget.course, context.read<CustomUser>().uid);
                }

                setState(() {
                  isRegistered = !isRegistered;
                });
                Navigator.of(context).pop();
              },
              child: Container(
                alignment: Alignment.center,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: isRegistered
                        ? AppColors.errorRed
                        : AppColors.mainButtonColor),
                child: Text(
                  isRegistered ? "Cancel" : "Register",
                  style:
                      TextStyle(fontSize: 25, color: AppColors.mainTextColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
