import 'package:flutter/material.dart';

class TextInputWidget extends StatelessWidget {
  TextInputWidget({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final OutlineInputBorder settingBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.withOpacity(0.01)),
      borderRadius: BorderRadius.circular(10));

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textAlign: TextAlign.left,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey.withOpacity(0.7)),
        contentPadding: const EdgeInsets.all(1),
        fillColor: Colors.grey.withOpacity(0.3),
        filled: true,
        prefixIcon: const Icon(Icons.search, color: Colors.black),
        border: settingBorder,
        disabledBorder: settingBorder,
        enabledBorder: settingBorder,
        focusedBorder: settingBorder,
      ),
    );
  }
}
