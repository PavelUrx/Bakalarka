import 'dart:async';
import 'package:bakalarkaflutter/game_assets/components/basic_block_component.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/services.dart';

class GameBase extends FlameGame {
  late int lives = 3;
  late BasicBlock currentBlock;
  late Vector2 screenSize;
  late int score = 0;
  double fromWhereToReact = 350;
  @override
  Color backgroundColor() => const Color.fromARGB(255, 60, 70, 68);

  @override
  Future<void> onLoad() async {
    spawnNext();
  }

  @override
  void onGameResize(Vector2 canvasSize) {
    screenSize = canvasSize;
    super.onGameResize(canvasSize);
  }

  @override
  void update(double dt) {
    /*if (currentBlock.position.y > screenSize.y) {
      gameEnd();
    }
    */
    if (children.query<BasicBlock>().isNotEmpty &&
        children.query<BasicBlock>().last.position.y >= fromWhereToReact) {
      currentBlock = children.query<BasicBlock>().last;
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

  void gestureHandler(String gesture) {
    if (currentBlock.onGesture(gesture)) {
      score++;
      getNextBlock();
      HapticFeedback.vibrate();
    } else {
      //gameEnd();
    }
    //print(gesture);
    //update game stats in game_layout
  }

  void verticalDrag(DragEndDetails details) {
    String gesture = 'NONE';
    double speed = details.velocity.pixelsPerSecond.dy;
    if (speed > 0) {
      gesture = 'DOWN';
    } else if (speed < 0) {
      gesture = 'UP';
    }
    gestureHandler(
        gesture); // prooooooooooooooooooooooooooooooooooooooč nebere gesto
  }

  void horizontalDrag(DragEndDetails details) {
    String gesture = 'NONE';
    double speed = details.velocity.pixelsPerSecond.dx;
    if (speed > 0) {
      gesture = 'RIGHT';
    } else if (speed < 0) {
      gesture = 'LEFT';
    }
    gestureHandler(gesture);
  }

  void gameEnd() {
    pauseEngine();
    spawnTimer().cancel();
    //todo
  }

  void gamePause() {
    pauseEngine();
    spawnTimer().cancel();
  }

  void gameUnpause() {
    resumeEngine();
    //spawnTimer();
  }

  BasicBlock generateNext() {
    double speed = 800;
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
