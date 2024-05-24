import 'package:course_scheduler/firebase_options.dart';
import 'package:course_scheduler/src/model/user.dart';
import 'package:course_scheduler/src/services/auth.dart';
import 'package:course_scheduler/src/utils/colors.dart';
import 'package:course_scheduler/src/view/authintication/loginPage.dart';
import 'package:course_scheduler/src/view/wrapper/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    StreamProvider<CustomUser?>.value(
      value: AuthServices().user,
      initialData: null,
      child: MyApp(),
    ),
   );
}

class MyApp extends StatelessWidget {
    MyApp({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(colorScheme: ColorScheme.dark(background: AppColors.mainBlack)) ,
      home: Scaffold(body:Wrapper()),);
  }
}
