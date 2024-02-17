import 'package:crypto/core/dialogs/dialogs.dart';
import 'package:crypto/core/enums/enums_state.dart';
import 'package:crypto/core/form_validators.dart/form_validator.dart';
import 'package:crypto/core/toasts/toast.dart';
import 'package:crypto/features/home/presentation/ui/home_screem.dart';
import 'package:crypto/features/login/presentation/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginController {
  late BuildContext context;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  final FormValidator _formValidator = FormValidator();
  void dispose() {
    email.dispose();
    password.dispose();
  }

  void statusLoginHandler(LoginState state, BuildContext context) {
    final GlobalKey<State> dialogKey = GlobalKey<State>();

    if (state.blocStatus == BlocStatus.submissionInProgress) {
      DialogCrypto.showLoadingDialog(context, dialogKey);
      return;
    }
    if (state.blocStatus == BlocStatus.submissionFailure) {
      Navigator.pop(context, dialogKey);
      ToastCrypto.errorToast(state.error ?? '');
      BlocProvider.of<LoginBloc>(context).add(const ResetLogin());
      return;
    }
    if (state.blocStatus == BlocStatus.submissionSuccess) {
      Navigator.pop(context, dialogKey);
      Navigator.pushReplacementNamed(context, HomeScreen.route);
      return;
    }
  }

  void validateFormFields(BuildContext context) async {
    if (keyForm.currentState?.validate() ?? false) {
      BlocProvider.of<LoginBloc>(context).add(OnLogin(
        email: email.text.trim(),
        password: password.text.trim(),
      ));

      // ignore: use_build_context_synchronously
      FocusScope.of(context).requestFocus(FocusNode());
    } else {
      ToastCrypto.errorToast('Complete all fields');
    }
  }

  String? validatorEmail(String value) {
    return _formValidator.validateEmail(value.trim());
  }

  String? validatorPassword(String value) {
    return _formValidator.passwordValidator(value);
  }
}
