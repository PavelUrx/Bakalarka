import '../game_assets/game/game_base.dart';

class GameRoutes {
  void pausePlay(GameBase base) {
    if (base.paused) {
      base.resumeEngine();
    } else {
      base.pauseEngine();
    }
  }
}
