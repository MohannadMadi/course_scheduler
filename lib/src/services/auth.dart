import 'dart:async';

import 'package:course_scheduler/src/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../model/user.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseServices _db = DatabaseServices();
  //auth change listener
  //create user obj
  _userFromFirebaseUser(User? user) {
    return user != null ? CustomUser(uid: user.uid) : null;
  }

  //signIn
  Future signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _userFromFirebaseUser(result.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided.');
      }
      return null;
    }
  }

  //signUp
  Future signUp(String userName, String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _db.updateUserData(userName, email, 18, [], 0, result.user!.uid);
      return _userFromFirebaseUser(result.user);
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Stream<CustomUser?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => user != null ? CustomUser(uid: user!.uid) : null);
  }

  // Sign out
  Future signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
