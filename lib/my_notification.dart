import 'dart:ffi';

import 'package:flutter/material.dart';

class MyNotification extends Notification {
  MyNotification(this.rotation,this.position);
  final double rotation;
  final Offset position;
}