import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/strings.dart';
import 'login_page.controller.dart';

class LoginPageView extends GetResponsiveView<LoginPageController> {
  LoginPageView({super.key});

  @override
  Widget? builder() {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                padding: const EdgeInsets.all(50),
                color: Get.theme.primaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Strings.welcomeBack,
                      style: Get.textTheme.headlineLarge?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      Strings.welcomeMsg,
                      textAlign: TextAlign.center,
                      style: Get.textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.white),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 60,
                          vertical: 15,
                        ),
                      ),
                      child: Text(
                        Strings.signin.toUpperCase(),
                        style: Get.textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.all(70),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Strings.createAccount,
                      style: Get.textTheme.headlineLarge?.copyWith(
                        color: Get.theme.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      Strings.alternateSignIn,
                      style: Get.textTheme.bodyMedium?.copyWith(
                        color: Get.theme.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                        labelText: Strings.name,
                        prefixIcon: Icon(
                          Icons.person_outline,
                          color: Get.theme.primaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                        labelText: Strings.email,
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Get.theme.primaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                        labelText: Strings.password,
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: Get.theme.primaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Get.theme.primaryColor,
                        side: BorderSide(color: Get.theme.primaryColor),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 60,
                          vertical: 15,
                        ),
                      ),
                      child: Text(
                        Strings.signUp.toUpperCase(),
                        style: Get.textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
