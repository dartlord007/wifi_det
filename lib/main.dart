import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:overlay_support/overlay_support.dart';

import 'utils.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'Has Internet?';

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => OverlaySupport(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(primarySwatch: Colors.teal),
          home: const MainPage(title: title),
        ),
      );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({super.key, required this.title});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
 late StreamSubscription<ConnectivityResult> subscription;
  @override
  void initState() {
    super.initState();

    subscription =
        Connectivity().onConnectivityChanged.listen(showConnectivitySnackBar);
  }

  @override
  void dispose() {
    subscription.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(12)),
            child: const Text('Check Connection', style: TextStyle(fontSize: 20)),
            onPressed: () async {
              var connectivityResult = await (Connectivity().checkConnectivity());
              showConnectivitySnackBar(connectivityResult);
            },
          ),
        ),
      );

  void showConnectivitySnackBar(ConnectivityResult result) {
    final hasInternet = result != ConnectivityResult.none;
    final message = hasInternet
        ? 'You have again ${result.toString()}'
        : 'You have no internet';
    final color = hasInternet ? Colors.green : Colors.red;

    Utils.showTopSnackBar(context, message, color);
  }
}