import 'package:flutter/material.dart';
import 'package:klinik_shoes_project/module/speaker/controller/speaker_notif_controller.dart';
import 'package:klinik_shoes_project/model/speaker/audio_notification_model.dart';

class SpeakerPageView extends StatefulWidget {
  @override
  _SpeakerPageViewState createState() => _SpeakerPageViewState();
}

class _SpeakerPageViewState extends State<SpeakerPageView> {
  late final SpeakerController controller;
  late final AudioNotificationModel model;

  @override
  void initState() {
    super.initState();
    model = AudioNotificationModel();
    controller = SpeakerController(model);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Logout'),
              onTap: () {
                // Tambahkan fungsi logout
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.notifications_active, color: Colors.blue),
              title: const Text('Audio Notification'),
              trailing: Switch(
                value: model.isAudioNotificationEnabled,
                onChanged: (value) {
                  setState(() {
                    controller.toggleAudioNotification();
                  });
                  if (value) {
                    controller.playNotificationSound();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}