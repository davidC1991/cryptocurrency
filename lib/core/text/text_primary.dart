import "package:flutter/material.dart";

class TextPrimary extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final Color color;
  final TextDecoration decoration;
  final int? maxLines;
  final double? height;
  final double? letterSpacing;
  final TextOverflow? overflow;

  const TextPrimary({
    Key? key,
    this.text,
    this.fontWeight = FontWeight.w400,
    this.fontSize = 14,
    this.color = Colors.black,
    this.decoration = TextDecoration.none,
    this.textAlign = TextAlign.center,
    this.maxLines = 25,
    this.height = 1.3,
    this.letterSpacing,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      key: UniqueKey(),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: false,
      style: TextStyle(
        letterSpacing: letterSpacing,
        decoration: decoration,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: "Inter",
        height: height,
      ),
    );
  }
}
