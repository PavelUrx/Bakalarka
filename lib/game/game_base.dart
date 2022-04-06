import 'dart:ui';
import 'package:bakalarkaflutter/components/basic_block.dart';
import 'package:bakalarkaflutter/game/game_screen.dart';
import 'package:flame/game.dart';

class GameBase extends FlameGame {
  @override
  Color backgroundColor() => const Color.fromARGB(255, 60, 70, 68);
  BasicBlock basicBlock =
      BasicBlock('block.png', 50, Vector2.all(50), 'UP ', 300);
  @override
  Future<void> onLoad() async {
    add(basicBlock);
  }

  @override
  void update(double dt) {
    super.update(dt);
  }
}
