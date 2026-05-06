import 'package:flutter/material.dart';

class OverviewStyles {
  static const red = Color(0xFFE9153A);
  static const redSoft = Color(0xFFFFEEF1);
  static const yellow = Color(0xFFFFC400);
  static const yellowSoft = Color(0xFFFFFBEA);
  static const purple = Color(0xFFA855F7);
  static const purpleSoft = Color(0xFFF6EDFF);
  static const text = Color(0xFF111827);
  static const muted = Color(0xFF5D6475);
  static const line = Color(0xFFDADDE4);

  static BoxDecoration card([Color border = line]) {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: border),
    );
  }
}
