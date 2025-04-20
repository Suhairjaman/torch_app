import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:torch_app/controller/torch_controller.dart';

class TorchScreen extends StatefulWidget {
  const TorchScreen({super.key});

  @override
  State<TorchScreen> createState() => _TorchScreenState();
}

class _TorchScreenState extends State<TorchScreen> {
  final MyTorchController torchController = Get.put(MyTorchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Dark screen
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'My Torch App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.power_settings_new,
                size: 100,
                color:
                    torchController.isTorchOn.value
                        ? Colors.orange
                        : Colors.grey,
              ),
              SizedBox(height: 20),
              Text(
                torchController.isTorchOn.value
                    ? "Flashlight is ON"
                    : "Flashlight is OFF",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 40),
              Switch(
                value: torchController.isTorchOn.value,
                onChanged: (bool value) {
                  if (value) {
                    torchController.toggleTorch();
                  } else {
                    torchController.toggleTorch();
                  }
                },

                activeColor: Colors.orange,
                inactiveThumbColor: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
