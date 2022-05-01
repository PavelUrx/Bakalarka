import 'package:bakalarkaflutter/UI/themes/app_theme.dart';
import 'package:bakalarkaflutter/game_assets/game/game_base.dart';
import 'package:bakalarkaflutter/routing/game_routes.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/button_widget.dart';

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
    final GameRoutes gameRoutes = GameRoutes();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GameIconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.home),
            ),
            GameIconButton(
                icon: base.paused
                    ? const Icon(Icons.play_arrow)
                    : const Icon(Icons.pause),
                onPressed: () => gameRoutes.pausePlay(base)),
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
      body: Stack(
        children: <Widget>[
          Center(
            child: GestureDetector(
              onHorizontalDragEnd: base.horizontalDrag,
              onVerticalDragEnd: base.verticalDrag,
              child: GameWidget(game: base),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              provider.eventName,
              style: AppTheme.eventTheme,
            ),
          ),
        ],
      ),
    );
  }
}
