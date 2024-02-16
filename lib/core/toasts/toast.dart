import 'package:crypto/core/responsive/responsive.dart';
import 'package:crypto/core/widgets/text/text_primary.dart';
import 'package:crypto/core/theme/colors/crypto_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ToastCrypto {
  static Future<bool?> errorToast(String message,
      {ToastGravity gravity = ToastGravity.BOTTOM}) async {
    return await Fluttertoast.showToast(
      backgroundColor: CryptoColors.primaryColor,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_LONG,
      gravity: gravity,
      msg: message,
    );
  }

  static validationMessageToast(
    String message,
    bool hasError,
    BuildContext context, {
    ToastGravity gravity = ToastGravity.BOTTOM,
    Widget? icon,
  }) async {
    Responsive responsive = Responsive(context);
    FToast fToast = FToast();
    fToast.init(context);

    Widget toast = Container(
        width: responsive.widthPercent(90),
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: CryptoColors.primaryColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null)
              icon
            else
              hasError
                  ? Icon(PhosphorIcons.xCircle(), color: Colors.white)
                  : Icon(PhosphorIcons.checkCircle(PhosphorIconsStyle.fill),
                      color: CryptoColors.primaryColor),
            SizedBox(
              height: responsive.heightPercent(1.5),
            ),
            Flexible(
              child: TextPrimary(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                text: message,
                color: Colors.white,
              ),
            ),
          ],
        ));

    return fToast.showToast(
      gravity: gravity,
      child: toast,
      toastDuration: const Duration(seconds: 5),
      fadeDuration: const Duration(milliseconds: 500),
    );
  }
}
