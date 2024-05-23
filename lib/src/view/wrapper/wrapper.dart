import 'package:course_scheduler/src/view/authintication/loginPage.dart';
import 'package:flutter/cupertino.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return LoginPage();
  }
}
