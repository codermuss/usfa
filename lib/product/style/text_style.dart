import 'package:flutter/material.dart';

class StyleText extends TextStyle {
  TextStyle get textStyleUserDetailSubtitle => const TextStyle(fontSize: 18);
  TextStyle get textStyleUserDetailTitle =>
      const TextStyle(fontSize: 25, fontWeight: FontWeight.bold);
  TextStyle get textStyleUserDetailEmail => const TextStyle(
      fontSize: 18, decoration: TextDecoration.underline, color: Colors.black);
  TextStyle get textStyle18ColorBlack =>
      const TextStyle(fontSize: 18, color: Colors.black);
}
