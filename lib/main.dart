import 'package:bakalarkaflutter/UI/layouts/menu_layout.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'UI/themes/app_theme.dart';

Future<void> main() async {
  setUpApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'SWIPE',
    theme: AppTheme.lightTheme,
    home: const Menu(),
  ));
}

void setUpApp() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  Flame.device.setOrientation(DeviceOrientation.portraitUp);
}
