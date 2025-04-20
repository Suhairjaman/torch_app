import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:torch_light/torch_light.dart';

class MyTorchController extends GetxController {
  var isTorchOn = false.obs;

  @override
  void onInit() {
    _loadTorchState();
    super.onInit();
  }

  void _loadTorchState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    isTorchOn.value = false;
    await prefs.setBool('torchState', false);
  }

  void toggleTorch() async {
    try {
      if (isTorchOn.value) {
        await TorchLight.disableTorch();
      } else {
        await TorchLight.enableTorch();
      }

      isTorchOn.value = !isTorchOn.value;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('torchState', isTorchOn.value);
    } catch (e) {
      print("Error toggling flashlight: $e");
    }
  }
}
