import 'package:get/get.dart';
import '../controller/connectivity_controller.dart'; // Sesuaikan dengan path yang benar

class ConnectivityBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ConnectivityController>(ConnectivityController(), permanent: true); 
  }
}
