import 'package:bakalarkaflutter/game/game_base.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

GameBase base = GameBase();
String swipeInfo = 'SWIPE ';
int score = 0;

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
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
                setState(() =>
                    base.paused ? base.resumeEngine() : base.pauseEngine());
              },
            ),
          ],
        ),
        toolbarHeight: 40,
        actions: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(swipeInfo),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('SCORE: $score'),
            ],
          ),
        ],
      ),
      body: Center(
        child: GestureDetector(
          onHorizontalDragEnd: horizontal,
          onVerticalDragEnd: vertical,
          child: GameWidget(game: base),
        ),
      ),
    );
  }

  void horizontal(DragEndDetails details) {
    double speed = details.velocity.pixelsPerSecond.dx;
    if (speed > 0) {
      setState(() => swipeInfo = 'RIGHT ');
      if (base.currentBlock.onGesture(swipeInfo)) {
        setState(() => score++);
      }
    } else if (speed < 0) {
      setState(() => swipeInfo = 'LEFT ');
      if (base.currentBlock.onGesture(swipeInfo)) {
        setState(() => score++);
      }
    }
  }

  void vertical(DragEndDetails details) {
    double speed = details.velocity.pixelsPerSecond.dy;
    if (speed > 0) {
      setState(() => swipeInfo = 'DOWN ');
      if (base.currentBlock.onGesture(swipeInfo)) {
        setState(() => score++);
      }
    } else if (speed < 0) {
      setState(() => swipeInfo = 'UP ');
      if (base.currentBlock.onGesture(swipeInfo)) {
        setState(() => score++);
      }
    }
  }
}
