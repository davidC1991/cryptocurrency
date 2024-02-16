import 'package:crypto/core/theme/colors/crypto_colors.dart';
import 'package:flutter/material.dart';

class ContainerDecorations {
  static BoxDecoration cryptoCardDecoration({
    Color borderColor = CryptoColors.primaryColor,
    backgroundColor = Colors.transparent,
    double borderRadius = 4.0,
    List<BoxShadow>? boxShadow,
    LinearGradient? gradient,
    double widthBorder = 1,
  }) =>
      BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor, width: widthBorder),
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: boxShadow,
        gradient: gradient,
      );
}
