import 'package:crypto/core/responsive/responsive.dart';
import 'package:crypto/core/theme/colors/crypto_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputTextCustom extends StatefulWidget {
  final GlobalKey<FormFieldState>? formKey;
  final TextEditingController? controller;

  final Function()? onTapInputText;
  final Function()? onFocusAction;
  String? Function(String?)? validator;
  final FocusNode? myFocusNode;
  String? messageSuffixIcon;
  String? errorMessage;
  String? successMessage;
  String? label;
  bool readOnly;
  final List<TextInputFormatter>? formatters;
  TextAlign textAlign;
  TextStyle? style;
  TextInputType keyBoardType;
  TextCapitalization textCapitalization;
  final bool isPassword;
  IconData? icon;
  final String? hintText;
  bool isValidatedData = false;
  final int? maxLines;
  final bool enableCounter;
  final Color borderColor;
  final int? maxLength;

  InputTextCustom({
    Key? key,
    this.formKey,
    this.controller,
    this.readOnly = false,
    this.messageSuffixIcon,
    this.myFocusNode,
    this.validator,
    this.formatters,
    this.errorMessage,
    this.successMessage = '¡Se mira bien!',
    this.textAlign = TextAlign.left,
    this.label,
    this.keyBoardType = TextInputType.text,
    this.style,
    this.onTapInputText,
    this.hintText,
    this.isPassword = false,
    this.icon,
    this.textCapitalization = TextCapitalization.sentences,
    this.maxLines,
    this.enableCounter = false,
    this.onFocusAction,
    this.borderColor = CryptoColors.grey,
    this.maxLength,
  }) : super(key: key);

  @override
  State<InputTextCustom> createState() => _InputTextCustomState();
}

class _InputTextCustomState extends State<InputTextCustom> {
  bool isError = false;

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);

    return TextFormField(
      maxLength: widget.maxLength,
      enableInteractiveSelection: true,
      maxLines: widget.enableCounter ? null : 1,
      minLines: widget.enableCounter ? null : 1,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: widget.isPassword,
      keyboardType: widget.keyBoardType,
      style: widget.style,
      textAlign: widget.textAlign,
      textCapitalization: widget.textCapitalization,
      autofocus: false,
      focusNode: widget.myFocusNode,
      key: widget.formKey,
      readOnly: widget.readOnly,
      controller: widget.controller,
      onTap: widget.onTapInputText,
      validator: widget.validator,
      cursorColor: CryptoColors.blue,
      onChanged: (value) {
        if (widget.onFocusAction != null) {
          widget.onFocusAction!();
        }

        if (widget.validator != null) {
          final a = widget.validator!(value);

          if (a != null) {
            widget.isValidatedData = false;
          } else {
            widget.isValidatedData = true;
          }

          setState(() {});
        }
      },
      inputFormatters: widget.formatters,
      autocorrect: false,
      enableSuggestions: false,
      decoration: InputDecoration(
        counterStyle: TextStyle(
          fontSize: 10,
          decoration: TextDecoration.none,
          color: widget.isValidatedData
              ? CryptoColors.success
              : CryptoColors.white,
        ),
        errorText: widget.isValidatedData ? widget.successMessage : null,
        enabled: true,
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: CryptoColors.grey,
          fontWeight: FontWeight.w200,
          decoration: TextDecoration.none,
        ),
        errorStyle: TextStyle(
          fontSize: 10,
          decoration: TextDecoration.none,
          color: widget.isValidatedData
              ? CryptoColors.success
              : CryptoColors.error,
        ),
        constraints: BoxConstraints(
          maxHeight: responsive.heightPercent(7.5),
        ),
        suffixIcon: null,
        contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: 0.5,
              color: widget.isValidatedData
                  ? CryptoColors.success
                  : CryptoColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: 0.5,
              color: widget.isValidatedData
                  ? CryptoColors.success
                  : CryptoColors.error),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(width: 0.5, color: CryptoColors.grey),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: 0.5,
              color: widget.readOnly ? CryptoColors.error : CryptoColors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.5,
            color: widget.readOnly
                ? CryptoColors.white
                : widget.enableCounter
                    ? CryptoColors.blue
                    : widget.borderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.5,
            color: widget.readOnly
                ? CryptoColors.white
                : widget.enableCounter
                    ? CryptoColors.blue
                    : widget.borderColor,
          ),
        ),
      ),
    );
  }
}
