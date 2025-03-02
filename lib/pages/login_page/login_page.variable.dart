import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/auth_service.dart';

mixin LoginPageVariable {
  GlobalKey<FormState> authForm = GlobalKey<FormState>();
  RxBool isSignIn = false.obs;
  RxBool obscureText = true.obs;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  AuthService auth = AuthService();
}
