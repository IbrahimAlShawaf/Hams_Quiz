import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/screens/login_screen.dart';
import 'package:get/get.dart';

import '../../controller/auth_controller.dart';
import '../widgets/auth_button.dart';
import '../widgets/my_string.dart';
import '../widgets/text_util.dart';
import '../widgets/textformfield.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final fromKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final controller = Get.find<AuthController>();
  //AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        // backgroundColor: context.theme.scaffoldBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
                  child: Form(
                    key: fromKey,
                    child: Column(
                      children: [
                        const TextUtils(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          text: "Create new Account",
                          color: Color(0xff222B45),
                          underLine: TextDecoration.none,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const TextUtils(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          text:
                              "Please type full information below and we can create your account",
                          color: Color(0xff8992A3),
                          underLine: TextDecoration.none,
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        AuthTextFromField(
                          controller: nameController,
                          obscureText: false,
                          validator: (value) {
                            if (value.toString().length <= 2 ||
                                !RegExp(validationName).hasMatch(value)) {
                              return 'Enter valid name';
                            } else {
                              return null;
                            }
                          },
                          // prefixIcon: Image.asset('assets/images/user.png'),
                          // suffixIcon: const Text(""),
                          hintText: 'FullName',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AuthTextFromField(
                          controller: emailController,
                          obscureText: false,
                          validator: (value) {
                            if (!RegExp(validationEmail).hasMatch(value)) {
                              return 'Invalid email';
                            } else {
                              return null;
                            }
                          },
                          // prefixIcon: Image.asset('assets/images/email.png'),
                          // suffixIcon: const Text(""),
                          hintText: 'Your Email',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GetBuilder<AuthController>(
                          builder: (_) {
                            return AuthTextFromField(
                              controller: passwordController,
                              obscureText:
                                  controller.isVisibilty.value ? false : true,
                              validator: (value) {
                                if (value.toString().length < 6) {
                                  return 'Password should be longer or equal to 6 characters'
                                      .tr;
                                } else {
                                  return null;
                                }
                              },
                              // prefixIcon: Image.asset('assets/images/lock.png'),
                              hintText: 'Password',
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controller.visibility();
                                },
                                icon: controller.isVisibilty.value
                                    ? const Icon(
                                        Icons.visibility_off,
                                        color: Colors.black,
                                      )
                                    : const Icon(
                                        Icons.visibility,
                                        color: Colors.black,
                                      ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AuthTextFromField(
                          controller: emailController,
                          obscureText: false,
                          validator: (value) {},
                          suffixIcon: Icon(Icons.date_range_outlined),
                          // suffixIcon: const Text(""),
                          hintText: 'Date Of Birth',
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        GetBuilder<AuthController>(
                          builder: (_) {
                            return AuthButton(
                              onPressed: () {
                                if (fromKey.currentState!.validate()) {
                                  String name = nameController.text.trim();
                                  String email = emailController.text.trim();
                                  String password = passwordController.text;
                                  controller.signUpUsingFirebase(
                                    name: name,
                                    email: email,
                                    password: password,
                                  );

                                  controller.isCheckBox.value = true;
                                }
                              },
                              text: "SIGN UP",
                            );
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const TextUtils(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          text: "Or connect with",
                          color: Colors.black,
                          underLine: TextDecoration.none,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Image.asset(
                                "assets/images/github.png",
                                width: 40,
                                height: 40,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Image.asset(
                                "assets/images/facebook.png",
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Image.asset(
                                "assets/images/google.png",
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
