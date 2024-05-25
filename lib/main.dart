import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_scheduler/firebase_options.dart';
import 'package:course_scheduler/src/model/course.dart';
import 'package:course_scheduler/src/model/user.dart';
import 'package:course_scheduler/src/services/auth.dart';
import 'package:course_scheduler/src/services/database.dart';
import 'package:course_scheduler/src/utils/colors.dart';
import 'package:course_scheduler/src/view/wrapper/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(providers: [
    StreamProvider<List<Course?>?>.value(
      value: DatabaseServices().courses,
      initialData: null,
    ),
    StreamProvider<CustomUser?>.value(
      value: AuthServices().user,
      initialData: null,
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    DatabaseServices();
    return MaterialApp(
      theme: ThemeData.from(
          colorScheme: ColorScheme.dark(background: AppColors.mainBlack)),
      home: SafeArea(
          child:
              Scaffold(backgroundColor: AppColors.mainBlack, body: Wrapper())),
    );
  }
}
