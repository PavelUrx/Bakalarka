import 'package:bakalarkaflutter/nongame/menu.dart';
import 'package:bakalarkaflutter/theme/app_theme.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  setUpApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Game_name',
    theme: AppTheme.lightTheme,
    home: const Menu(),
  ));
}

void setUpApp() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  Flame.device.setOrientation(DeviceOrientation.portraitUp);
}
