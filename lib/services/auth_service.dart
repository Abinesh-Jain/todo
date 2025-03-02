import 'package:hive/hive.dart';

import '../models/user.dart';

class AuthService {
  late Box _userBox;
  late Box _storage;

  /// Initialize Hive Box
  Future<void> init() async {
    _userBox = await Hive.openBox('users');
    _storage = await Hive.openBox('storage');
  }

  /// Sign Up a new user
  Future<String> signUp(
    String email,
    String password,
    String name,
  ) async {
    await init();

    if (_userBox.containsKey(email)) return 'User already exists!';

    final user = {
      'name': name,
      'email': email,
      'password': password,
    };

    await _userBox.put(email, user);
    await _storage.put('user', user);
    return 'success';
  }

  /// Sign In a user with validation
  Future<String> signIn(String email, String password) async {
    await init(); // Ensure the box is opened

    if (!_userBox.containsKey(email)) {
      return 'User not registered! Please sign up.';
    }

    var userData = _userBox.get(email);
    if (userData['password'] != password) {
      return 'Incorrect password! Please try again.';
    }
    _storage.put('user', userData);
    return 'success'; // Login successful
  }

  Future<User?> getUser() async {
    await init();
    final user = _storage.get('user');
    return user != null ? User.fromJSON(user) : null;
  }

  Future<int> logout() async {
    await init();
    return _storage.clear();
  }
}
