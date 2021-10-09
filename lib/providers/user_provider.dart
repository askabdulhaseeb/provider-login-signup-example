import 'package:flutter/material.dart';
import 'package:provider_example/models/app_user.dart';

class UserProvider extends ChangeNotifier {
  final List<AppUser> _user = <AppUser>[];
  AppUser? selectedUser;
  void addUser(AppUser user) {
    _user.add(user);
    notifyListeners();
  }

  bool login(String email, String password) {
    int index = _user.indexWhere((element) => element.email == email);
    if (index == -1) return false;
    selectedUser = _user.firstWhere((element) => element.email == email);
    if (selectedUser!.password == password) {
      notifyListeners();
      return true;
    } else {
      selectedUser = null;
      notifyListeners();
      return false;
    }
  }
}
