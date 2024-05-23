import 'package:course_scheduler/src/services/auth.dart';
import 'package:course_scheduler/src/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool obscure = true;
  final AuthServices _auth = AuthServices();
  String error='';
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text(
        "Sing In",
        style: TextStyle(color: AppColors.mainWhite, fontSize: 40),
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
              const SizedBox(height: 20),
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
      error==""?const SizedBox():Text(error,style: const TextStyle(color: Colors.redAccent,fontSize: 15),),
      TextButton(
          onPressed: () async{
            if (_formKey.currentState!.validate()) {
              dynamic result = await _auth.signIn(email!, password!);
              if (result == null) {
                error="Please use valid credentials";
              }else{
                error='';
              }
            }
          },
          child: const Column(
            children: [
              Text(
                "Sing In",
                style: TextStyle(fontSize: 25),
              ),Row(
                children: [
                  Text("don't have an account? ",style: TextStyle(color: AppColors.mainWhite),),
                ],
              )
            ],
          ))
    ]);
  }
}
