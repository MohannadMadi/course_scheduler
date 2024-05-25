import 'dart:async';

import 'package:course_scheduler/src/model/user.dart';
import 'package:course_scheduler/src/providers/userDataProvider.dart';
import 'package:course_scheduler/src/services/auth.dart';
import 'package:course_scheduler/src/services/database.dart';
import 'package:course_scheduler/src/utils/colors.dart';
import 'package:course_scheduler/src/view/authintication/signUpPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  Function toggle;
  LoginPage({super.key, required this.toggle});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool obscure = true;
  final AuthServices _auth = AuthServices();
  final DatabaseServices _db = DatabaseServices();

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text(
        "Sing In",
        style: TextStyle(color: AppColors.mainTextColor, fontSize: 40),
      ),
      const SizedBox(
        height: 70,
      ),
      Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (val) =>
                    val.toString().isEmpty ? "Email cannot be empty" : null,
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 40),
              TextFormField(
                obscureText: obscure,
                validator: (val) => val.toString().length > 6
                    ? null
                    : "Password has to be more than 6 characters",
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
                decoration: InputDecoration(
                  suffix: InkWell(
                      onTap: () {
                        setState(() {
                          obscure = !obscure;
                        });
                      },
                      child: const Icon(
                        Icons.remove_red_eye,
                        color: AppColors.mainBlue,
                      )),
                  labelText: 'Password',
                  border: const OutlineInputBorder(),
                ),
              ),
            ],
          )),
      const SizedBox(
        height: 30,
      ),
      Column(
        children: [
          InkWell(
            onTap: () async {
              if (_formKey.currentState!.validate()) {
                CustomUser? result = await _auth.signIn(email!, password!);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Row(
                      children: [
                        Icon(
                          result == null ? Icons.error_outline : Icons.check,
                          color: result == null
                              ? AppColors.errorRed
                              : AppColors.successGreen,
                        ),
                        Text(
                            result == null
                                ? "  Please use valid credentials"
                                : "Signed In successfully",
                            style: TextStyle(
                                color: result == null
                                    ? AppColors.errorRed
                                    : AppColors.successGreen,
                                fontSize: 15)),
                      ],
                    ),
                    backgroundColor: AppColors.subBlack,
                  ),
                );
              }
            },
            child: Container(
              alignment: Alignment.center,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.mainButtonColor),
              child: const Text(
                "Sing In",
                style: TextStyle(fontSize: 25, color: AppColors.mainTextColor),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "don't have an account?  ",
                style: TextStyle(color: AppColors.mainTextColor),
              ),
              InkWell(
                onTap: () {
                  widget.toggle();
                },
                child: const Text(
                  "Sign Up instead",
                  style: TextStyle(color: AppColors.subTextColor),
                  // style: TextStyle(color: ),
                ),
              )
            ],
          )
        ],
      )
    ]);
  }
}
