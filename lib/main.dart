import 'package:bakalarkaflutter/UI/layouts/menu_layout.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'UI/themes/app_theme.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  setUpApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'SWIPE',
    theme: AppTheme.lightTheme,
    home: const Menu(),
  ));
}

Future<void> setUpApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  Flame.device.setOrientation(DeviceOrientation.portraitUp);
  List<String> testDevices = [];
  testDevices.add('85174FCFDB71FC587E416E96B90339E0');
  RequestConfiguration requestConfiguration =
      RequestConfiguration(testDeviceIds: testDevices);
  MobileAds.instance.updateRequestConfiguration(requestConfiguration);
  MobileAds.instance.initialize();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}
