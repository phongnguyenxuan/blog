import 'package:blog/models/user.dart';
import 'package:blog/services/auth_service.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier{
  User? _user;
  final AuthMethods authMethods = AuthMethods();

  User get getUser => _user!;

  Future<void> refreshUser() async {
    User user = await authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}