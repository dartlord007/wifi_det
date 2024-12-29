// ignore_for_file: file_names

import 'package:flutter/material.dart';
// import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:wifi_det/controllers/bluetoothController.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wifi_det/views/wifiPage.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  Future<void> requestLocationPermission() async {
    final permission = await Permission.location.request();
    if (permission != PermissionStatus.granted) {
      // Handle permission denied
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<BluetoothController>(
          init: BluetoothController(),
          builder: (controller) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 180,
                    width: double.infinity,
                    color: Colors.blueGrey,
                    child: const Center(
                      child: Text(
                        "Bluetooth Scanner",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: ElevatedButton(
                        onPressed: () async {
                          await requestLocationPermission();
                          controller.scanDevices();
                        },
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blueGrey,
                            minimumSize: const Size(300, 55),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)))),
                        child: const Text(
                          "Scan nearby devices ...",
                          style: TextStyle(fontSize: 16),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  StreamBuilder<List<ScanResult>>(
                      stream: controller.scanResult,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          // ignore: avoid_print
                          print('Error: ${snapshot.error}');
                        }
                        if (snapshot.hasData 
                        && snapshot.data!.isNotEmpty
                        ) {
                          // ignore: avoid_print
                          print('Data: ${snapshot.data}');
                          return SizedBox(
                            height: 300,
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  final data = snapshot.data![index];
                                  return Card(
                                    // elevation: 2,
                                    child: ListTile(
                                      title: Text(data.device.platformName),
                                      subtitle:
                                          Text(data.device.remoteId.toString()),
                                      trailing: Text(data.rssi.toString()),
                                    ),
                                  );
                                }),
                          );
                          // return const Text("Device 1");
                        } else {
                          return const Center(
                            child: Text(
                              "No devices found",
                              style: TextStyle(color: Colors.black),
                            ),
                          );
                        }
                      }),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(const WifiPage());
                    },
                    child: const Text('Go to Wifi Scanner'),
                  )
                ],
              ),
            );
          }),
    );
  }
}
