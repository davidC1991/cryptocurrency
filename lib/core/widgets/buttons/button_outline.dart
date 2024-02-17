import 'package:crypto/core/theme/colors/crypto_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonOutlineCustom extends StatelessWidget {
  final bool enable;
  final Function()? onPressed;
  EdgeInsets padding;
  final double height;
  final double width;
  final double border;
  final double widthBorder;
  final Color colorBorder;
  final Color colorText;
  final Color backgroundColor;
  final Widget widget;

  ButtonOutlineCustom({
    Key? key,
    this.padding = const EdgeInsets.all(16),
    required this.onPressed,
    this.enable = false,
    this.height = 40,
    this.width = 200,
    this.colorBorder = CryptoColors.blue,
    this.border = 10,
    this.widthBorder = 3,
    this.colorText = CryptoColors.white,
    this.backgroundColor = CryptoColors.white,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateColor.resolveWith((states) => backgroundColor),
          minimumSize: MaterialStateProperty.all(Size(width, height)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(border),
              side: BorderSide(
                color: enable ? colorBorder : CryptoColors.grey,
                width: widthBorder,
              ),
            ),
          ),
        ),
        onPressed: enable ? onPressed : null,
        child: widget,
      ),
    );
  }
}
