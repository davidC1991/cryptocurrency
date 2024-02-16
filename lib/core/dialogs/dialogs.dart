import 'package:crypto/core/responsive/responsive.dart';
import 'package:crypto/core/theme/colors/crypto_colors.dart';
import 'package:flutter/material.dart';

import '../widgets/text/text_primary.dart';

class DialogCrypto {
  static Future<void> showLoadingDialog(
    BuildContext context,
    GlobalKey key, {
    String? message,
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: SimpleDialog(
            insetPadding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            backgroundColor: CryptoColors.primaryColor,
            alignment: Alignment.bottomCenter,
            key: key,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(45),
                alignment: Alignment.centerLeft,
                height: Responsive.of(context).heightPercent(20),
                width: Responsive.of(context).widthPercent(95),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(
                      color: CryptoColors.primaryColor,
                    ),
                    const SizedBox(width: 25),
                    Flexible(
                      child: Text(
                        message ?? "Espera un momento...",
                        maxLines: 3,
                        style: const TextStyle(
                            color: CryptoColors.primaryColor, fontSize: 16),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  static showLoadingDialogSync(BuildContext context, GlobalKey key) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SimpleDialog(
        key: key,
        children: const <Widget>[
          Center(
            child: Column(
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Cargando....",
                  style: TextStyle(color: Colors.blue),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  static showErrorDialog(BuildContext context, String message) {
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: const Text("Error"),
      content: Text(message),
      actions: [
        okButton,
      ],
    );

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static showInfoDialog(BuildContext context, String title, String message) {
    Widget okButton = TextButton(
      child: const TextPrimary(
        text: "OK",
        color: CryptoColors.primaryColor,
        fontWeight: FontWeight.w800,
      ),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      backgroundColor: CryptoColors.primaryColor,
      title: Text(title),
      content: TextPrimary(
        text: message,
        textAlign: TextAlign.justify,
        color: CryptoColors.primaryColor,
      ),
      actions: [
        okButton,
      ],
    );

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
