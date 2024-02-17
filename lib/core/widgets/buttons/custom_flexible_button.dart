import 'package:crypto/core/theme/colors/crypto_colors.dart';
import 'package:flutter/material.dart';

class CustomFlexiblePrimaryButton extends StatelessWidget {
  final String? string;
  final double? fontSize;
  final Function()? onPressed;
  final FontWeight fontWeight;
  final List<Widget> content;
  final Color color;
  final Color? borderColor;
  final bool isActive;
  final EdgeInsets padding;

  const CustomFlexiblePrimaryButton({
    Key? key,
    required this.onPressed,
    required this.content,
    this.string = '',
    this.fontSize = 12,
    this.fontWeight = FontWeight.w600,
    this.color = CryptoColors.blue,
    this.borderColor,
    this.isActive = true,
    this.padding = const EdgeInsets.symmetric(vertical: 13),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isActive ? onPressed : null,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double?>(0.0),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled))
              return CryptoColors.grey;
            return color;
          },
        ),
        shape: MaterialStateProperty.resolveWith<RoundedRectangleBorder>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              );
            }
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: states.contains(MaterialState.disabled)
                  ? const BorderSide()
                  : BorderSide(
                      color: borderColor != null ? borderColor! : color,
                    ),
            );
          },
        ),
      ),
      child: Padding(
        padding: padding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: content,
        ),
      ),
    );
  }
}
