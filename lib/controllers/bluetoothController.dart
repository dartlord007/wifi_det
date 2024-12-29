// ignore_for_file: file_names

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
// import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';
// import 'package:wifi_scan/wifi_scan.dart';

class BluetoothController extends GetxController {
  // FlutterBlue flutterBlue = FlutterBluePlus.i;

  Future scanDevices() async {
    // Use _flutterBlue here
    FlutterBluePlus.startScan(
        timeout: const Duration(seconds: 300), 
        // androidUsesFineLocation: true
        );
    FlutterBluePlus.stopScan();
  }

  Stream<List<ScanResult>> get scanResult => FlutterBluePlus.scanResults;
}