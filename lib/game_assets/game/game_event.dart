import 'dart:async';
import 'dart:math';
import 'package:bakalarkaflutter/game_assets/components/basic_block_component.dart';

import '../events/basic_event.dart';
import '../events/reversed_event.dart';

class EventHandler {
  BasicEvent currentEvent = BasicEvent('', 650);
  Timer eventTimer([int millis = 15000]) =>
      Timer(Duration(milliseconds: millis), getNewEvent);
  Timer noEventTimer([int millis = 5000]) =>
      Timer(Duration(milliseconds: millis), setBasicEvent);

  EventHandler();

  void getNewEvent() {
    noEventTimer();
    switch (Random().nextInt(1)) {
      case 0:
        {
          currentEvent = ReversedEvent('REVERSED', 650);
        }
        break;
      default:
        {
          currentEvent = BasicEvent('', 650);
        }
    }
  }

  String getEventName() {
    return currentEvent.getName();
  }

  BasicBlock generateNext() {
    return currentEvent.generateNext();
  }

  void setBasicEvent() {
    currentEvent = BasicEvent('', 550);
    eventTimer();
  }

  void startTimer() {
    noEventTimer();
  }
}
