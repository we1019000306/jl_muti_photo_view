import 'package:flutter/gestures.dart';
class AllowMultipleGestureRecognizer extends LongPressGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    acceptGesture(pointer);
    print('!@#!@#');
  }

}
