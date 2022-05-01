import 'dart:async';
import 'package:bakalarkaflutter/game_assets/components/basic_block_component.dart';
import 'package:bakalarkaflutter/game_assets/game/game_event.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GameBase extends FlameGame with ChangeNotifier {
  late int lives = 3;
  late BasicBlock currentBlock;
  late Vector2 screenSize;
  late int score = 0;
  double fromWhereToReact = 350;
  EventHandler eventHandler = EventHandler();
  String eventName = '';
  @override
  Color backgroundColor() => const Color.fromARGB(255, 60, 70, 68);

  @override
  Future<void> onLoad() async {
    spawnNext();
    eventHandler.startTimer();
    eventName = eventHandler.getEventName();
  }

  @override
  void onGameResize(Vector2 canvasSize) {
    screenSize = canvasSize;
    super.onGameResize(canvasSize);
  }

  @override
  void update(double dt) {
    if (children.query<BasicBlock>().isNotEmpty &&
        children.query<BasicBlock>().last.position.y >= fromWhereToReact) {
      currentBlock = children.query<BasicBlock>().last;
    }
    updateEventName();
    super.update(dt);
  }

  Timer spawnTimer([int millis = 800]) =>
      Timer(Duration(milliseconds: millis), spawnNext);

  void spawnNext() {
    add(eventHandler.generateNext());
    spawnTimer();
  }

  void getNextBlock() {
    currentBlock = children.query<BasicBlock>().last;
  }

  void gestureHandler(String gesture) {
    if (currentBlock.onGesture(gesture)) {
      score++;
      getNextBlock();
      HapticFeedback.lightImpact();
      notifyListeners();
    } else {
      //gameEnd();
    }
  }

  void verticalDrag(DragEndDetails details) {
    String gesture = 'NONE';
    double speed = details.velocity.pixelsPerSecond.dy;
    if (speed > 0) {
      gesture = 'DOWN';
    } else if (speed < 0) {
      gesture = 'UP';
    }
    gestureHandler(gesture);
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
    removeAll(children);
  }

  void gamePause() {
    //pauseEngine();
    spawnTimer().cancel();
  }

  void gameUnpause() {
    resumeEngine();
  }

  int getScore() {
    return score;
  }

  void updateEventName() {
    if (eventName != eventHandler.getEventName()) {
      eventName = eventHandler.getEventName();
      notifyListeners();
    }
  }
}
