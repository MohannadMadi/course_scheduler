import 'package:course_scheduler/src/view/authintication/loginPage.dart';
import 'package:course_scheduler/src/view/authintication/signUpPage.dart';
import 'package:flutter/cupertino.dart';

class Authinticate extends StatefulWidget {
  const Authinticate({super.key});

  @override
  State<Authinticate> createState() => _AuthinticateState();
}

class _AuthinticateState extends State<Authinticate> {
  bool showSignIn=true;
  void toggle(){
    setState(() {
      showSignIn=!showSignIn;
    });
  }
  @override
  Widget build(BuildContext context) {
    return showSignIn?LoginPage(toggle:toggle): SignUpPage(toggle:toggle);
  }
}
