import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klinik_shoes_project/core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Inisialisasi FCMService
  final fcmService = FCMService();
  fcmService.init();
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Klinik Shoes Project',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: CameraPageView()
      // initialRoute: AppRoutes.getHomeRoute(),
      // getPages: AppRoutes.routes,
    );
  }
}
