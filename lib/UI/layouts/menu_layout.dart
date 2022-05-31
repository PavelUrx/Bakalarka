import 'package:bakalarkaflutter/UI/layouts/game_layout.dart';
import 'package:bakalarkaflutter/UI/widgets/appbar_content_widget.dart';
import 'package:bakalarkaflutter/UI/widgets/appbar_item_widget.dart';
import 'package:bakalarkaflutter/UI/widgets/button_widget.dart';
import 'package:bakalarkaflutter/UI/widgets/scaffold_widget.dart';
import 'package:bakalarkaflutter/routing/menu_routes.dart';
import 'package:flutter/material.dart';
import 'package:games_services/games_services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final BannerAd myBanner = BannerAd(
    adUnitId: 'ca-app-pub-3940256099942544/6300978111',
    size: AdSize.banner,
    request: const AdRequest(),
    listener: const BannerAdListener(),
  );

  @override
  void initState() {
    super.initState();
    myBanner.load();
  }

  @override
  Widget build(BuildContext context) {
    MenuRoutes menuRoutes = MenuRoutes();
    AppBarItem score = const AppBarItem(itemText: 'TOP SCORE: 666');
    AppBarContent content = AppBarContent(appBarItem: score);
    return MenuScaffold(
      appBar: AppBar(
        actions: [content],
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  MenuButton(
                      onPressed: () => menuRoutes.openGame(
                          context, base, const GameScreen()),
                      buttonText: 'PLAY'),
                ]),
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  MenuButton(
                      onPressed: () =>
                          GamesServices.isSignedIn == Future<bool>.value(true)
                              ? GamesServices.showLeaderboards()
                              : GamesServices.signIn(),
                      buttonText: 'SIGN IN'),
                ]),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: 320.0,
              height: 50,
              child: AdWidget(ad: myBanner),
            ),
          )
        ],
      ),
    );
  }
}
