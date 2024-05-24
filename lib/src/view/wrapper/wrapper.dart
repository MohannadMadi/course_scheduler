import 'package:course_scheduler/src/providers/userProvider.dart';
import 'package:course_scheduler/src/view/authintication/authinticate.dart';
import 'package:course_scheduler/src/view/authintication/loginPage.dart';
import 'package:course_scheduler/src/view/homePage/home.dart';
import 'package:flutter/cupertino.dart';
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
    final user =Provider.of<CustomUser?>(context);

    return user==null?Authinticate():HomePage();
  }
}
