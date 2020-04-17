import 'package:flutter/material.dart';

class UIText {
  static const String FONT_FAMILY_GOOGLE = 'Google';

  static textPrimary(String data, {double fontSize}) {
    return Text(
      data,
      style: TextStyle(
        fontFamily: UIText.FONT_FAMILY_GOOGLE,
        fontSize: fontSize ?? 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
