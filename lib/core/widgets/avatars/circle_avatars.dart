import 'package:crypto/core/responsive/responsive.dart';
import 'package:flutter/material.dart';

class Avatars {
  static CircleAvatar circle(BuildContext context, String url) {
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 25,
      backgroundImage: NetworkImage(url),
    );
  }
}
