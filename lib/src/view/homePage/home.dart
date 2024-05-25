import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_scheduler/src/model/course.dart';
import 'package:course_scheduler/src/services/auth.dart';
import 'package:course_scheduler/src/services/database.dart';
import 'package:course_scheduler/src/utils/colors.dart';
import 'package:course_scheduler/src/view/homePage/components/bottomBar.dart';
import 'package:course_scheduler/src/view/reusableWidgets/coursesList.dart';
import 'package:course_scheduler/src/view/homePage/components/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final courses = Provider.of<List<Course?>?>(context);
    final _auth = AuthServices();

    return Scaffold(
        backgroundColor: AppColors.mainBlack,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // FloatingActionButton(onPressed: () {
            //   _auth.signOut();
            // }),
            SearchWidget(),
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              child: CoursesList(
                courses: courses,
              ),
            ),
          ],
        ));
  }
}



//!course adding button
              // FloatingActionButton(onPressed: () {
              //   _db.addCourse(Course(
              //     courseName: "CSCI 106",
              //     startTime: DateTime(2024, 12, 1, 12, 0),
              //     endTime: DateTime(2024, 5, 1, 2, 0),
              //     secNumber: "05",
              //     subType: "lecture",
              //     instructor: "Mohannad Madi",
              //     users: [],
              //     location: "Room 108",
              //     description:
              //         'This course is an introduction to computer science and programming using the Python programming language. It covers the fundamentals of programming, including data types, control structures, functions, arrays, and the mechanics of running, testing, and debugging. The course also introduces object-oriented programming, algorithms, and data structures. ',
              //     denied: false,
              //     registered: false,
              //     numberOfCredits: 4,
              //     totalSeats: 60,
              //     remainingSeats: 60,
              //   ));
// })
