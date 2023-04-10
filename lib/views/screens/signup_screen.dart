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
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        backgroundColor: context.theme.scaffoldBackgroundColor,
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
                        Row(
                          children: const [
                            TextUtils(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              text: "SIGN",
                              color: Colors.black,
                              underLine: TextDecoration.none,
                            ),
                             SizedBox(
                              width: 3,
                            ),
                            TextUtils(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              text: "UP",
                              color: Colors.green,
                              underLine: TextDecoration.none,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
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
                          prefixIcon: Image.asset('assets/images/user.png'),
                          suffixIcon: const Text(""),
                          hintText: 'User Name',
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
                          prefixIcon: Image.asset('assets/images/email.png'),
                          suffixIcon: const Text(""),
                          hintText: 'Email',
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
                              prefixIcon: Image.asset('assets/images/lock.png'),
                              hintText: 'Password'.tr,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const TextUtils(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              text: "Already have an Account? ",
                              color: Colors.black,
                              underLine: TextDecoration.none,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(() => LoginScreen());
                              },
                              child: const TextUtils(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                text: "Log In",
                                color: Colors.blue,
                                underLine: TextDecoration.none,
                              ),
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
