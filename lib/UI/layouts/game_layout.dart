import 'package:bakalarkaflutter/game_assets/game/game_base.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

GameBase base = GameBase();

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);
  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GameBase>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.home),
            ),
            IconButton(
              icon: base.paused
                  ? const Icon(Icons.play_arrow)
                  : const Icon(Icons.pause),
              onPressed: () {
                if (!base.paused) {
                  Fluttertoast.showToast(
                    msg: 'paused',
                    backgroundColor: Colors.teal,
                  );
                }
                setState(
                    () => base.paused ? base.gameUnpause() : base.gamePause());
              },
            ),
          ],
        ),
        toolbarHeight: 40,
        actions: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('SCORE: ${provider.getScore()}'),
            ],
          ),
        ],
      ),
      body: Center(
        child: GestureDetector(
          onHorizontalDragEnd: base.horizontalDrag,
          onVerticalDragEnd: base.verticalDrag,
          child: GameWidget(game: base),
        ),
      ),
    );
  }
}
