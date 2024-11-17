import 'package:audioplayers/audioplayers.dart';
import 'package:klinik_shoes_project/model/speaker/audio_notification_model.dart';

class SpeakerController {
  final AudioNotificationModel audioNotificationModel;

  SpeakerController(this.audioNotificationModel);

  void toggleAudioNotification() {
    audioNotificationModel.toggleNotification();
  }

  void playNotificationSound() async {
    if (audioNotificationModel.isAudioNotificationEnabled) {
      final assetsAudioPlayer = AudioPlayer();
      try {
        await assetsAudioPlayer.play(AssetSource('audio/ding.mp3'));
      } catch (e) {
        print("error : $e");
      }
    }
  }
}