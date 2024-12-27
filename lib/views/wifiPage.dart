// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wifi_det/views/homePage.dart';

class WifiPage extends StatelessWidget {
  const WifiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 180,
            width: double.infinity,
            color: Colors.blueGrey,
            child: const Center(
              child: Text(
                "Wifi Scanner",
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
                onPressed: () async {},
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blueGrey,
                    minimumSize: const Size(300, 55),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)))),
                child: const Text(
                  "Scan nearby devices ...",
                  style: TextStyle(fontSize: 16),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          // StreamBuilder<List<ScanResult>>(
          //     stream: controller.scanResult,
          //     builder: (context, snapshot) {
          //       if (snapshot.hasData) {
          //         print('Data: ${snapshot.data}');
          //         return SizedBox(
          //           height: 300,
          //           child: ListView.builder(
          //               shrinkWrap: true,
          //               itemCount: snapshot.data!.length,
          //               itemBuilder: (context, index) {
          //                 final data = snapshot.data![index];
          //                 return Card(
          //                   // elevation: 2,
          //                   child: ListTile(
          //                     title: Text(data.device.platformName),
          //                     subtitle: Text(data.device.remoteId.toString()),
          //                     trailing: Text(data.rssi.toString()),
          //                   ),
          //                 );
          //               }),
          //         );
          //         // return const Text("Device 1");
          //       } else {
          //         return const Center(
          //           child: Text(
          //             "No devices found",
          //             style: TextStyle(color: Colors.black),
          //           ),
          //         );
          //       }
          //     }),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(const Homepage());
            },
            child: const Text('Go to Bluetooth Scanner'),
          )
        ],
      ),
    );
  }
}
