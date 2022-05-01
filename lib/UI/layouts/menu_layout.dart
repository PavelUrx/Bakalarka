import 'package:bakalarkaflutter/UI/layouts/game_layout.dart';
import 'package:bakalarkaflutter/UI/widgets/appbar_content_widget.dart';
import 'package:bakalarkaflutter/UI/widgets/appbar_item_widget.dart';
import 'package:bakalarkaflutter/UI/widgets/button_widget.dart';
import 'package:bakalarkaflutter/UI/widgets/scaffold_widget.dart';
import 'package:bakalarkaflutter/routing/menu_routes.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MenuRoutes menuRoutes = MenuRoutes();
    AppBarItem score = const AppBarItem(itemText: 'TOP SCORE: 666');
    AppBarContent content = AppBarContent(appBarItem: score);

    return MenuScaffold(
        appBar: AppBar(
          actions: [content],
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
