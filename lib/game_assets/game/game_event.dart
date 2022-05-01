import 'dart:async';
import 'dart:math';
import 'package:bakalarkaflutter/game_assets/components/basic_block_component.dart';

import '../events/basic_event.dart';
import '../events/reversed_event.dart';

class EventHandler {
  EventHandler();

  BasicEvent currentEvent = BasicEvent('', 800);
  void getNewEvent() {
    noEventTimer();
    switch (Random().nextInt(1)) {
      case 0:
        {
          currentEvent = ReversedEvent('REVERSED', 800);
        }
        break;
      default:
        {
          currentEvent = BasicEvent('', 800);
        }
    }
  }

  String getEventName() {
    return currentEvent.getName();
  }

  BasicBlock generateNext() {
    return currentEvent.generateNext();
  }

  setBasicEvent() {
    currentEvent = BasicEvent('', 800);
    eventTimer();
  }

  Timer eventTimer([int millis = 3000]) =>
      Timer(Duration(milliseconds: millis), getNewEvent);

  Timer noEventTimer([int millis = 3000]) =>
      Timer(Duration(milliseconds: millis), setBasicEvent);

  void startTimer() {
    noEventTimer();
  }
}
