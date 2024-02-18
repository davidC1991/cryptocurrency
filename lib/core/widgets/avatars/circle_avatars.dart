import 'package:crypto/core/const%20/test_helper.dart';
import 'package:flutter/material.dart';

class Avatars {
  static Widget circle(BuildContext context, String url) {
    if (isTest) return const SizedBox.shrink();
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 25,
      backgroundImage: NetworkImage(url),
    );
  }
}
