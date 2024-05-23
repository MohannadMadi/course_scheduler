import 'package:course_scheduler/firebase_options.dart';
import 'package:course_scheduler/src/view/authintication/loginPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(  MyApp());
}

class MyApp extends StatelessWidget {
    MyApp({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark() ,
      home: Scaffold(body:LoginPage()),);
  }
}
