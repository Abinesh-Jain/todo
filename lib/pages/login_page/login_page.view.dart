import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/strings.dart';
import 'login_page.controller.dart';

class LoginPageView extends GetResponsiveView<LoginPageController> {
  LoginPageView({super.key});

  @override
  Widget? builder() {
    return Scaffold(
      body: Obx(() {
        bool isSignIn = controller.isSignIn.value;

        return Row(
          children: [
            // Left Panel (Branding)
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
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      Strings.welcomeMsg,
                      textAlign: TextAlign.center,
                      style: Get.textTheme.bodyLarge?.copyWith(
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 30),
                    OutlinedButton(
                      onPressed: controller.onSignInSignUpToggle,
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.white),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 60,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        isSignIn
                            ? Strings.createAccount.toUpperCase()
                            : Strings.signin.toUpperCase(),
                        style: Get.textTheme.bodyLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Right Panel (Login / Sign-up)
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.all(70),
                child: Form(
                  key: controller.authForm,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: Column(
                      key: ValueKey(isSignIn),
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Text(
                          isSignIn ? Strings.signin : Strings.createAccount,
                          style: Get.textTheme.headlineLarge?.copyWith(
                            color: Get.theme.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Form Fields
                        if (!isSignIn) ...[
                          TextFormField(
                            controller: controller.name,
                            decoration: InputDecoration(
                              labelText: Strings.name,
                              prefixIcon: Icon(
                                Icons.person_outline,
                                color: Get.theme.primaryColor,
                              ),
                            ),
                            validator: controller.nameValidator,
                          ),
                          const SizedBox(height: 20),
                        ],
                        TextFormField(
                          controller: controller.email,
                          decoration: InputDecoration(
                            labelText: Strings.email,
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Get.theme.primaryColor,
                            ),
                          ),
                          validator: controller.emailValidator,
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: controller.password,
                          obscureText: controller.obscureText.value,
                          decoration: InputDecoration(
                            labelText: Strings.password,
                            prefixIcon: IconButton(
                              onPressed: controller.obscureText.toggle,
                              icon: Icon(
                                controller.obscureText.value
                                    ? Icons.lock_outline
                                    : Icons.lock_open,
                                color: Get.theme.primaryColor,
                              ),
                            ),
                          ),
                          validator: controller.passwordValidator,
                        ),
                        const SizedBox(height: 20),

                        // Submit Button
                        ElevatedButton(
                          onPressed: controller.onFormSubmitted,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Get.theme.primaryColor,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 60,
                              vertical: 15,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            isSignIn
                                ? Strings.signin.toUpperCase()
                                : Strings.signUp.toUpperCase(),
                            style: Get.textTheme.bodyLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
