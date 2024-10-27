import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart'; // Add this import
import 'package:klinik_shoes_project/Routes/routes.dart';
import 'package:klinik_shoes_project/core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
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
      home: SignupPageView(),
      // initialRoute: AppRoutes.getHomeRoute(),
      // getPages: AppRoutes.routes
    );
  }
}
