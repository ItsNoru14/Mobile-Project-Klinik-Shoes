import 'dart:io'; // Untuk mengelola file
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:klinik_shoes_project/module/camerapage/controller/camerapage_controller.dart'; // Pastikan jalur ini sesuai

class CameraPageView extends StatelessWidget {
  final CameraPageController controller = Get.put(CameraPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAFBF9),
      appBar: AppBar(
        title: Text("Kamera"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Bagian atas: Menampilkan foto
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() {
                    if (controller.imagePath.isNotEmpty) {
                      return Column(
                        children: [
                          Image.file(
                            File(controller.imagePath.value),
                            height: 150,
                            width: 150,
                          ),
                          SizedBox(height: 5),
                          Text("Foto berhasil diambil!"),
                        ],
                      );
                    } else {
                      return Text("Ambil foto untuk ditampilkan.");
                    }
                  }),
                  SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: controller.capturePhoto,
                    icon: Icon(Icons.camera_alt),
                    label: Text("Ambil Foto"),
                  ),
                ],
              ),
            ),
            Divider(thickness: 2), // Garis pembatas
            // Bagian bawah: Menampilkan dan memutar video
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() {
                    if (controller.isVideoLoading.value) {
                      return CircularProgressIndicator();
                    } else if (controller.videoPath.isNotEmpty) {
                      if (controller.videoPlayerController.value != null) {
                        final videoController = controller.videoPlayerController.value!;
                        if (controller.isVideoInitialized.value) {
                          return Column(
                            children: [
                              SizedBox(
                                height: 200, // Batas tinggi video
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: VideoPlayer(videoController),
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton.icon(
                                    onPressed: controller.toggleVideoPlayPause,
                                    icon: Obx(() => Icon(
                                        controller.isVideoPlaying.value ? Icons.pause : Icons.play_arrow)),
                                    label: Obx(() =>
                                        Text(controller.isVideoPlaying.value ? "Pause" : "Play")),
                                  ),
                                ],
                              ),
                            ],
                          );
                        } else {
                          return Column(
                            children: [
                              SizedBox(
                                height: 200, // Placeholder tinggi video
                                child: Center(child: CircularProgressIndicator()),
                              ),
                              SizedBox(height: 10),
                              Text("Menginisialisasi video..."),
                            ],
                          );
                        }
                      } else {
                        return CircularProgressIndicator();
                      }
                    } else {
                      return Text("Ambil video untuk ditampilkan.");
                    }
                  }),
                  SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: controller.captureVideo,
                    icon: Icon(Icons.videocam),
                    label: Text("Ambil Video"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

