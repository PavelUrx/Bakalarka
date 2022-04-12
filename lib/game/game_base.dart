import 'dart:async';
import 'dart:ui';
import 'package:bakalarkaflutter/components/basic_block.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class GameBase extends FlameGame {
  late BasicBlock currentBlock;
  late Vector2 screenSize;
  @override
  Color backgroundColor() => const Color.fromARGB(255, 60, 70, 68);

  @override
  Future<void> onLoad() async {
    spawnTimer(800);
  }

  @override
  void onGameResize(Vector2 canvasSize) {
    screenSize = canvasSize;
    super.onGameResize(canvasSize);
  }

  @override
  void update(double dt) {
    if (children.query<BasicBlock>().isNotEmpty &&
        children.query<BasicBlock>().last.position.y >= 350) {
      currentBlock = children.query<BasicBlock>().last;
    }
    if (paused) {
      spawnTimer().cancel();
    }
    super.update(dt);
  }

  Timer spawnTimer([int millis = 800]) =>
      Timer(Duration(milliseconds: millis), spawnNext);

  void spawnNext() {
    add(generateNext());
    spawnTimer();
  }

  void getNextBlock() {
    currentBlock = currentBlock = children.query<BasicBlock>().last;
  }

  BasicBlock generateNext() {
    double speed = 800;
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
