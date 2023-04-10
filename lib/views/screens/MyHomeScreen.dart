import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth_controller.dart';
import '../widgets/logout_widget.dart';

class MyHomeScreen extends StatelessWidget {
   MyHomeScreen({super.key});
 final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Store App'),
        actions: [
          IconButton(
            onPressed: () {
              Get.defaultDialog(
              title: "Logout From App",
              titleStyle: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              middleText: 'Are you sure you need to logout',
              middleTextStyle: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              backgroundColor: Colors.grey,
              radius: 10,
              textCancel: " No ",
              cancelTextColor: Colors.white,
              textConfirm: " YES ",
              confirmTextColor: Colors.white,
              onCancel: () {
                Get.back();
              },
              onConfirm: () {
                controller.signOutFromApp();
              },
              buttonColor: Colors.green,
            );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
