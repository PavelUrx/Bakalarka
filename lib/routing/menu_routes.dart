import 'package:bakalarkaflutter/UI/layouts/game_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../game_assets/game/game_base.dart';

class MenuRoutes {
  int score = 0;

  void openGame(BuildContext context, GameBase base, GameScreen gameScreen) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider<GameBase>.value(
                  value: base,
                  child: gameScreen,
                )));
  }

  Future<int?> getTopScore() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('topScore');
  }

  void getScore() async {
    score = (await getTopScore())!;
  }
}
