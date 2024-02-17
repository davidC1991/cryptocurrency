import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final Widget content;
  final Color color;
  final Function()? onPressed;
  final bool isBackgroundActive;
  final OutlinedBorder? shape;
  final double borderWidth;
  final Color? backGroundColor;
  final double elevation;
  final EdgeInsets padding;
  final EdgeInsets externalPadding;
  final MainAxisAlignment contentAlignment;

  const CustomOutlinedButton({
    Key? key,
    required this.content,
    required this.color,
    required this.onPressed,
    this.isBackgroundActive = false,
    this.shape,
    this.borderWidth = 1.5,
    this.backGroundColor,
    this.elevation = 0,
    this.padding = const EdgeInsets.symmetric(vertical: 13),
    this.externalPadding = const EdgeInsets.only(),
    this.contentAlignment = MainAxisAlignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: externalPadding,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shadowColor: color.withOpacity(0.0),
          elevation: elevation,
          foregroundColor: color,
          side: BorderSide(
            width: borderWidth,
            color: borderWidth == 0.0 ? Colors.transparent : color,
          ),
          backgroundColor: isBackgroundActive ? backGroundColor : null,
          shape: (shape == null)
              ? RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                )
              : shape,
        ),
        onPressed: onPressed,
        child: Padding(
          padding: padding,
          child: Row(
            mainAxisAlignment: contentAlignment,
            children: [
              content,
            ],
          ),
        ),
      ),
    );
  }
}
