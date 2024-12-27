import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';

class BluetoothController extends GetxController {
  final FlutterBluePlus flutterBlue = FlutterBluePlus();

  Future scanDevices() async {
    // Use _flutterBlue here
    FlutterBluePlus.startScan(timeout:const Duration(seconds: 10));
    FlutterBluePlus.stopScan();
  }
  Stream<List<ScanResult>> get scanResult => FlutterBluePlus.scanResults;
}