import 'package:crypto/core/theme/colors/crypto_colors.dart';
import 'package:crypto/core/widgets/texts/text_primary.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CryptocurrencyBottomNavigator extends StatefulWidget {
  const CryptocurrencyBottomNavigator({
    required this.onPressed,
    super.key,
  });
  final Function(int) onPressed;

  @override
  State<CryptocurrencyBottomNavigator> createState() =>
      _CryptocurrencyBottomNavigatorState();
}

class _CryptocurrencyBottomNavigatorState
    extends State<CryptocurrencyBottomNavigator> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: (value) {
          currentIndex = value;
          widget.onPressed(value);
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: PhosphorIcon(
              PhosphorIcons.list(currentIndex == 0
                  ? PhosphorIconsStyle.fill
                  : PhosphorIconsStyle.thin),
              color: currentIndex == 0 ? CryptoColors.blue : CryptoColors.grey,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: PhosphorIcon(
              PhosphorIcons.star(currentIndex == 1
                  ? PhosphorIconsStyle.fill
                  : PhosphorIconsStyle.thin),
              color: currentIndex == 1 ? CryptoColors.blue : CryptoColors.grey,
            ),
          ),
          BottomNavigationBarItem(
              label: '',
              icon: TextPrimary(
                fontSize: 18,
                text: 'VS',
                fontWeight:
                    currentIndex == 2 ? FontWeight.w800 : FontWeight.w400,
                color:
                    currentIndex == 2 ? CryptoColors.blue : CryptoColors.grey,
              )),
        ]);
  }
}
