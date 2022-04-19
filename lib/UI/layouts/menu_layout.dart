import 'package:bakalarkaflutter/UI/layouts/game_layout.dart';
import 'package:bakalarkaflutter/game_assets/game/game_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 40,
          actions: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('TOP SCORE: 420'),
              ],
            ),
          ],
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ChangeNotifierProvider<GameBase>.value(
                                  value: base,
                                  child: const GameScreen(),
                                )));
                  },
                  child: const Text('PLAY!')),
            ),
            TextButton(
                onPressed: () {
                  HapticFeedback.vibrate();
                },
                child: const Text('SETTINGS')),
          ]),
        ));
  }
}
