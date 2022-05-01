import 'dart:math';
import 'package:bakalarkaflutter/game_assets/components/basic_block_component.dart';
import 'package:flame/game.dart';

class BasicEvent {
  late String eventName;
  late double speed;
  BasicEvent(this.eventName, this.speed);

  String getName() {
    return eventName;
  }

  BasicBlock generateNext() {
    switch (Random().nextInt(7)) {
      case 0:
        {
          return (BasicBlock('up_green.png', speed, Vector2.all(50), 'UP'));
        }
      case 1:
        {
          return (BasicBlock('down_green.png', speed, Vector2.all(50), 'DOWN'));
        }
      case 2:
        {
          return (BasicBlock('left_green.png', speed, Vector2.all(50), 'LEFT'));
        }
      case 3:
        {
          return (BasicBlock(
              'right_green.png', speed, Vector2.all(50), 'RIGHT'));
        }
      case 4:
        {
          return (BasicBlock('up_red.png', speed, Vector2.all(50), 'DOWN'));
        }
      case 5:
        {
          return (BasicBlock('down_red.png', speed, Vector2.all(50), 'UP'));
        }
      case 6:
        {
          return (BasicBlock('right_red.png', speed, Vector2.all(50), 'LEFT'));
        }
      default:
        {
          return (BasicBlock('left_red.png', speed, Vector2.all(50), 'RIGHT'));
        }
    }
  }
}
