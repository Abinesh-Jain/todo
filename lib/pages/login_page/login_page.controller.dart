import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../src/routes.dart';
import '../../utils/reg_exps.dart';
import '../../utils/strings.dart';
import 'login_page.variable.dart';

class LoginPageController extends GetxController with LoginPageVariable {
  @override
  onInit() async {
    super.onInit();
    auth.getUser().then((value) {
      if (value != null) {
        name.text = value.name ?? '';
        email.text = value.email ?? '';
        password.text = value.password ?? '';
        signIn();
      }
    });
  }

  String? nameValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return '${Strings.name} ${Strings.isRequired}';
    } else {
      return null;
    }
  }

  String? emailValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return '${Strings.email} ${Strings.isRequired}';
    } else if (!RegExps.email.hasMatch(value)) {
      return Strings.enterValidEmail;
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return '${Strings.password} ${Strings.isRequired}';
    } else if (value.length < 8) {
      return '${Strings.password} ${Strings.mustBe8characters}';
    }
    return null;
  }

  void onSignInSignUpToggle() {
    name.clear();
    email.clear();
    password.clear();
    isSignIn.toggle();
  }

  /// The `onFormSubmitted` function unfocuses the primary focus, validates the form, and either signs in
  /// or signs up based on the validation result.
  void onFormSubmitted() {
    primaryFocus?.unfocus();
    final valid = authForm.currentState?.validate() ?? false;
    if (valid) {
      isSignIn.value ? signIn() : signUp();
    } else {
      Get.snackbar('Validation Error', 'Please correct the errors');
    }
  }

  /// The `signIn` function attempts to sign in a user with the provided email and password, displaying a
  /// success message and navigating to the dashboard upon successful login, or displaying an error
  /// message if the login fails.
  void signIn() async {
    final result = await auth.signIn(
      email.text.trim(),
      password.text.trim(),
    );
    if (result == 'success') {
      Get.offAllNamed(Routes.dashboard);
      Get.snackbar('Login Successful', 'Welcome back!');
    } else {
      Get.snackbar('Login Failed', result);
    }
  }

  /// The `signUp` function handles user sign up process, displaying success or failure messages using
  /// GetX package in Dart.
  void signUp() async {
    final result = await auth.signUp(
      email.text.trim(),
      password.text.trim(),
      name.text.trim(),
    );
    if (result == 'success') {
      Get.offAllNamed(Routes.dashboard);
      Get.snackbar('Login Successful', 'Welcome back!');
    } else {
      Get.snackbar('Login Failed', result);
    }
  }
}
