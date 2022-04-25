import 'package:bakalarkaflutter/UI/layouts/game_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../game_assets/game/game_base.dart';

class MenuRoutes {
  void openGame(BuildContext context, GameBase base, GameScreen gameScreen) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider<GameBase>.value(
                  value: base,
                  child: gameScreen,
                )));
  }
}
