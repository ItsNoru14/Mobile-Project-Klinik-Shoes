// lib/views/settings_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:klinik_shoes_project/module/welcome_page/view/welcome_page_view.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  // Fungsi untuk logout dan kembali ke LandingPage
  Future<void> _logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => WelcomePage()); // Navigasi ke halaman landing page setelah logout
    } catch (e) {
      Get.snackbar('Logout Failed', 'Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Color(0xFF29D6C8),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: Icon(Icons.logout, color: Colors.teal),
            title: Text('Logout'),
            onTap: _logout,
          ),
        ],
      ),
    );
  }
}
