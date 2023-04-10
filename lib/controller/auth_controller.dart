import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../routes/routes.dart';

class AuthController extends GetxController {
  RxBool isVisibilty = false.obs;
  RxBool isCheckBox = false.obs;
  RxString displayUserName = ''.obs;
  RxString displayUserPhoto = ''.obs;
  RxString displayUserEmail = ''.obs;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  bool get isLogin => auth.currentUser != null;

  // collections
  static const userCollection = "users";

  RxBool isSignedIn = false.obs;
  final GetStorage authBox = GetStorage();

  User? get userProfiloe => auth.currentUser;

  @override
  void onInit() {
    // displayUserName.value =
    //     (userProfiloe != null ? userProfiloe!.displayName : "")!;
    // displayUserPhoto.value =
    //     (userProfiloe != null ? userProfiloe!.photoURL : "")!;
    // displayUserEmail.value = (userProfiloe != null ? userProfiloe!.email : "")!;

    super.onInit();
  }

  void visibility() {
    isVisibilty.value = !isVisibilty.value;

    update();
  }

  // void checkBox() {
  //   isCheckBox.value = !isCheckBox.value;

  //   update();
  // }

// Sign Up Method ::::::::::::::::::::::::::::::::::::::
  void signUpUsingFirebase({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        displayUserName.value = name;
        auth.currentUser!.updateDisplayName(name);
      });

      update();

      Get.offNamed(Routes.myhomescreen);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';

      if (error.code == 'weak-password') {
        message = ' Provided Password is too weak.. ';
      } else if (error.code == 'email-already-in-use') {
        message = ' Account Already exists for that email.. ';
      } else {
        message = error.message.toString();
      }

      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

// Login Method :::::::::::::::::::::::::::::::::
  void logInUsingFirebase({
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .signInWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then((value) =>
              displayUserName.value = auth.currentUser!.displayName!);

      isSignedIn.value = true;
      GetStorage().write("auth", isSignedIn.value);
      // authBox.write("auth", isSignedIn);
      Get.offNamed(Routes.myhomescreen);
      // update();
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';

      if (error.code == 'user-not-found') {
        message =
            ' Account does not exists for that $email.. Create your account by signing up..';
      } else if (error.code == 'wrong-password') {
        message = ' Invalid Password... PLease try again! ';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

// Reset Method ::::::::::::::::::::::::::::::::::::::::

  void resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);

      update();
      Get.back();
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';

      if (error.code == 'user-not-found') {
        message =
            ' Account does not exists for that $email.. Create your account by signing up..';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  // Sign Out Method :::::::::::::::::::::::::::::::::::::::::::

  void signOutFromApp() async {
    try {
      await auth.signOut();

      displayUserName.value = '';
      displayUserPhoto.value = '';
      displayUserEmail.value = '';
      isSignedIn.value = false;
      authBox.remove("auth");
      update();

      Get.offNamed(Routes.loginscreen);
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }
}
