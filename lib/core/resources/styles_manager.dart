import 'package:flutter/material.dart';

import 'colors_manager.dart';

abstract class AppStyles {
  static const TextStyle base16BoldGold = TextStyle(
    fontSize: 16,
    color: ColorsManager.gold,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle base16BoldCreamyYellow = TextStyle(
    fontSize: 16,
    color: ColorsManager.creamyYellow,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle bold24DarkGray = TextStyle(
    fontSize: 24,
    color: ColorsManager.black,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle bold20White = TextStyle(
    fontSize: 20,
    color: Colors.white,
    fontWeight: .w700,
  );
}
