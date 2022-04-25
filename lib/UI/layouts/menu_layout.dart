import 'package:bakalarkaflutter/UI/layouts/game_layout.dart';
import 'package:bakalarkaflutter/UI/widgets/button_widget.dart';
import 'package:bakalarkaflutter/routing/menu_routes.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MenuRoutes menuRoutes = MenuRoutes();
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 40,
          actions: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('TOP SCORE: WIP'),
              ],
            ),
          ],
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            MenuButton(
                onPressed: () =>
                    menuRoutes.openGame(context, base, const GameScreen()),
                buttonText: 'PLAY')
          ]),
        ));
  }
}
