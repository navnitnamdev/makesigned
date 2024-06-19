import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'User.dart';
import 'UserRepository.dart';


class UserViewModel extends ChangeNotifier {
  final UserRepository userRepository;

  UserViewModel({required this.userRepository});

  List<User> _users = [];
  bool _loading = false;
  String _errorMessage = '';

  List<User> get users => _users;
  bool get loading => _loading;
  String get errorMessage => _errorMessage;

  Future<void> fetchUsers() async {
    _loading = true;
    _errorMessage = '';

    try {
      _users = await userRepository.getUsers();

    } catch (e) {
      // If an exception occurs during the API call, set the error message to display the error.
      _errorMessage = 'Failed to fetch users';
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}