import 'package:crypto/core/responsive/responsive.dart';
import 'package:crypto/core/theme/colors/crypto_colors.dart';
import 'package:crypto/core/widgets/texts/text_primary.dart';
import 'package:flutter/material.dart';

class Toggle extends StatefulWidget {
  Toggle({required this.data, required this.onPressed, super.key});
  Function(String) onPressed;
  Map<String, bool> data;

  @override
  State<Toggle> createState() => _ToggleState();
}

class _ToggleState extends State<Toggle> {
  List<bool> options = [];

  @override
  void initState() {
    super.initState();

    options = widget.data.values.toList();
  }

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
        direction: Axis.vertical,
        constraints: BoxConstraints(
          maxWidth: Responsive.of(context).widthPercent(25),
        ),
        fillColor: CryptoColors.grey,
        borderColor: CryptoColors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8.0),
        onPressed: (index) {
          for (var i = 0; i < widget.data.values.length; i++) {
            options[i] = false;
          }
          options[index] = true;
          final String selectedKey = widget.data.keys.toList()[index];
          widget.onPressed(selectedKey);
          setState(() {});
        },
        isSelected: options,
        children: List.generate(
          options.length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: TextPrimary(
              text: widget.data.keys.toList()[index],
              fontSize: 18,
              color: options[index] ? CryptoColors.white : CryptoColors.grey,
              fontWeight: FontWeight.w800,
            ),
          ),
        ));
  }
}
