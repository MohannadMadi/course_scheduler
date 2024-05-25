import 'package:course_scheduler/src/model/user.dart';
import 'package:flutter/foundation.dart';

class UserDataProvider extends ChangeNotifier {
  late UserData _userData;
  UserData get userData {
    return _userData;
  }

  void setUserData(UserData userData) {
    _userData = userData;
    notifyListeners();
  }
}
