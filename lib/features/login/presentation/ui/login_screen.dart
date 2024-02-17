import 'package:crypto/core/responsive/responsive.dart';
import 'package:crypto/core/theme/colors/crypto_colors.dart';
import 'package:crypto/core/widgets/buttons/button_outline.dart';
import 'package:crypto/core/widgets/input_text_fields/custom_inputText.dart';
import 'package:crypto/core/widgets/texts/text_primary.dart';
import 'package:crypto/features/login/presentation/bloc/login_bloc.dart';
import 'package:crypto/features/login/presentation/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  static const route = 'login-screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController loginController = LoginController();
  @override
  void dispose() {
    loginController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: CryptoColors.white,
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: loginController.keyForm,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Responsive.of(context).spaceSize(20, context),
                    _customText(
                      text: 'Welcome to your cryptocurrency app!',
                      fontSize: 28,
                      color: CryptoColors.grey.withOpacity(0.8),
                      fontWeight: FontWeight.w900,
                    ),
                    Responsive.of(context).spaceSize(3, context),
                    _customText(
                      text: 'Email',
                      fontSize: 16,
                      color: CryptoColors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                    Responsive.of(context).spaceSize(1, context),
                    _mailTextInput(),
                    Responsive.of(context).spaceSize(2, context),
                    _customText(
                      text: 'Contraseña',
                      fontSize: 16,
                      color: CryptoColors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                    Responsive.of(context).spaceSize(1, context),
                    _passwordTextInput(),
                    Responsive.of(context).spaceSize(8, context),
                    _onLoginScreenButton(context),
                    Responsive.of(context).spaceSize(1, context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _customText({
    required String text,
    required double fontSize,
    required FontWeight fontWeight,
    required Color color,
    TextAlign textAlign = TextAlign.left,
    Alignment alignment = Alignment.centerLeft,
  }) {
    return Align(
      alignment: alignment,
      child: TextPrimary(
        text: text,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        textAlign: textAlign,
      ),
    );
  }

  Widget _onLoginScreenButton(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) =>
          loginController.statusLoginHandler(state, context),
      child: ButtonOutlineCustom(
        width: Responsive.of(context).widthPercent(90),
        height: Responsive.of(context).heightPercent(6),
        padding: EdgeInsets.zero,
        enable: true,
        colorBorder: CryptoColors.grey,
        colorText: CryptoColors.blue,
        backgroundColor: CryptoColors.blue,
        border: 5,
        widthBorder: 0.5,
        onPressed: () => loginController.validateFormFields(context),
        widget: _customText(
          alignment: Alignment.center,
          text: 'Sign In',
          fontSize: 16,
          color: CryptoColors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _mailTextInput() {
    return InputTextCustom(
      style: const TextStyle(
        color: CryptoColors.grey,
        fontWeight: FontWeight.w400,
        decoration: TextDecoration.none,
      ),
      controller: loginController.email,
      hintText: 'email@example.com',
      label: '',
      validator: (value) => loginController.validatorEmail(value ?? ''),
    );
  }

  Widget _passwordTextInput() {
    return InputTextCustom(
      style: const TextStyle(
        color: CryptoColors.grey,
        fontWeight: FontWeight.w400,
        decoration: TextDecoration.none,
      ),
      maxLines: 1,
      isPassword: true,
      controller: loginController.password,
      hintText: '••••••••••',
      label: '',
      validator: (value) => loginController.validatorPassword(value ?? ''),
    );
  }
}
