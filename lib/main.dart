import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/bindings/authBinding.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/routes/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';

import 'controller/auth_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context , child){
             return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'First Method',
      // You can use the library anywhere in the app even in theme
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MyHomeScreen(),
      initialRoute: FirebaseAuth.instance.currentUser != null ||
              GetStorage().read<bool>('auth') == true
          ? Routes.mainscreen
          : AppRoutes.loginscreen,
      initialBinding: AuthBinding(),
      getPages: AppRoutes.routes,
    );
        });
    
  }
}
