import 'dart:async';

import 'package:course_scheduler/src/services/auth.dart';
import 'package:course_scheduler/src/utils/colors.dart';
import 'package:course_scheduler/src/view/authintication/signUpPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  Function toggle;

  SignUpPage({super.key, required this.toggle});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? userName;

  bool obscure = true;
  final AuthServices _auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text(
        "Sing Up",
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
                    val.toString().isEmpty ? "UserName cannot be empty" : null,
                onChanged: (val) {
                  setState(() {
                    userName = val;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'UserName',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 40),
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
                dynamic result =
                    await _auth.signUp(userName!, email!, password!);

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
                "Sing Up",
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
                "Already have an account?  ",
                style: TextStyle(color: AppColors.mainTextColor),
              ),
              InkWell(
                onTap: () {
                  widget.toggle();
                },
                child: const Text(
                  "Sign In instead",
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
