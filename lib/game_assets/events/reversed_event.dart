import 'dart:math';
import 'package:bakalarkaflutter/game_assets/components/basic_block_component.dart';
import 'package:bakalarkaflutter/game_assets/events/basic_event.dart';
import 'package:flame/game.dart';

class ReversedEvent extends BasicEvent {
  ReversedEvent(String eventName, double speed) : super(eventName, speed);

  @override
  BasicBlock generateNext() {
    double speed = 800;
    switch (Random().nextInt(7)) {
      case 0:
        {
          return (BasicBlock('up_green.png', speed, Vector2.all(50), 'DOWN'));
        }
      case 1:
        {
          return (BasicBlock('down_green.png', speed, Vector2.all(50), 'UP'));
        }
      case 2:
        {
          return (BasicBlock(
              'left_green.png', speed, Vector2.all(50), 'RIGHT'));
        }
      case 3:
        {
          return (BasicBlock(
              'right_green.png', speed, Vector2.all(50), 'LEFT'));
        }
      case 4:
        {
          return (BasicBlock('up_red.png', speed, Vector2.all(50), 'UP'));
        }
      case 5:
        {
          return (BasicBlock('down_red.png', speed, Vector2.all(50), 'DOWN'));
        }
      case 6:
        {
          return (BasicBlock('right_red.png', speed, Vector2.all(50), 'RIGHT'));
        }
      default:
        {
          return (BasicBlock('left_red.png', speed, Vector2.all(50), 'LEFT'));
        }
    }
  }
}
