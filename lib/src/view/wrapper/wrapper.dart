import 'package:course_scheduler/src/providers/navbarProvider.dart';
import 'package:course_scheduler/src/providers/userDataProvider.dart';
import 'package:course_scheduler/src/services/auth.dart';
import 'package:course_scheduler/src/services/database.dart';
import 'package:course_scheduler/src/view/authintication/authinticate.dart';
import 'package:course_scheduler/src/view/authintication/loginPage.dart';
import 'package:course_scheduler/src/view/homePage/components/bottomBar.dart';
import 'package:course_scheduler/src/view/homePage/home.dart';
import 'package:course_scheduler/src/view/schedule/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/user.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser?>(context);
    final _db = DatabaseServices();
    final _auth = AuthServices();
    List pages = [
      HomePage(),
      // MyCourses(
      //   courses: context.read<UserDataProvider>().userData.coursesInCart,
      // )
    ];
    if (user != null) {}
    return user == null
        ? Authinticate()
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FloatingActionButton(onPressed: () async {
                await _auth.signOut();
                // print(
                // context.read<UserDataProvider>().userData,
                // );
              }),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.9,
                child: pages[context.watch<NavbarProvider>().currentIndex],
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: CustomBottomBar()),
            ],
          );
  }
}
