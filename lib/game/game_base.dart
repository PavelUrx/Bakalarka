import 'dart:ui';
import 'package:bakalarkaflutter/components/basic_block.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class GameBase extends FlameGame {
  late BasicBlock currentBlock;
  late List<BasicBlock> iterList;
  late Vector2 screenSize;
  @override
  Color backgroundColor() => const Color.fromARGB(255, 60, 70, 68);

  @override
  Future<void> onLoad() async {
    add(generateNext());
  }

  @override
  void onGameResize(Vector2 canvasSize) {
    screenSize = canvasSize;
    super.onGameResize(canvasSize);
  }

  @override
  void update(double dt) {
    if (children.query<BasicBlock>().isNotEmpty &&
        children.query<BasicBlock>().last.position.y > 250 &&
        children.query<BasicBlock>().last.position.y < 260) {
      currentBlock = children.query<BasicBlock>().last;
      add(generateNext());
    }
    super.update(dt);
  }

  BasicBlock generateNext() {
    double speed = 600;
    switch (Random().nextInt(7)) {
      case 0:
        {
          return (BasicBlock('up_green.png', speed, Vector2.all(50), 'UP ', 0));
        }
      case 1:
        {
          return (BasicBlock(
              'down_green.png', speed, Vector2.all(50), 'DOWN ', 0));
        }
      case 2:
        {
          return (BasicBlock(
              'left_green.png', speed, Vector2.all(50), 'LEFT ', 0));
        }
      case 3:
        {
          return (BasicBlock(
              'right_green.png', speed, Vector2.all(50), 'RIGHT ', 0));
        }
      case 4:
        {
          return (BasicBlock('up_red.png', speed, Vector2.all(50), 'DOWN ', 0));
        }
      case 5:
        {
          return (BasicBlock('down_red.png', speed, Vector2.all(50), 'UP ', 0));
        }
      case 6:
        {
          return (BasicBlock(
              'right_red.png', speed, Vector2.all(50), 'LEFT ', 0));
        }
      default:
        {
          return (BasicBlock(
              'left_red.png', speed, Vector2.all(50), 'RIGHT ', 0));
        }
    }
  }
}
