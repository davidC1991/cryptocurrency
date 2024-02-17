import 'package:crypto/core/responsive/responsive.dart';
import 'package:crypto/core/theme/colors/crypto_colors.dart';
import 'package:crypto/core/widgets/avatars/circle_avatars.dart';
import 'package:crypto/core/widgets/buttons/custom_flexible_button.dart';
import 'package:crypto/core/widgets/texts/text_primary.dart';
import 'package:crypto/features/cryptocurrencies/presentation/enums/compare_enum.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CryptocurrencyCard extends StatelessWidget {
  const CryptocurrencyCard({
    required this.name,
    required this.image,
    required this.price,
    required this.coin,
    this.isFavorite,
    this.onPressedCompare,
    this.onPressedFavorite,
    this.compareStatus,
    super.key,
  });
  final String name;
  final String image;
  final String price;
  final String coin;
  final bool? isFavorite;
  final String? compareStatus;
  final Function()? onPressedCompare;
  final Function()? onPressedFavorite;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: _isComparingStatus()
          ? CryptoColors.grey.withOpacity(0.1)
          : CryptoColors.white,
      child: ListTile(
        horizontalTitleGap: 10,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        leading: Avatars.circle(context, image),
        title: TextPrimary(
          text: name,
          fontWeight: FontWeight.w600,
          fontSize: 18,
          textAlign: TextAlign.left,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FittedBox(
              child: TextPrimary(
                text: '$price $coin',
                fontSize: 18,
                textAlign: TextAlign.left,
              ),
            ),
            if (onPressedCompare != null) ...[
              const SizedBox(height: 5),
              SizedBox(
                width: Responsive.of(context).widthPercent(30),
                height: Responsive.of(context).heightPercent(3),
                child: CustomFlexiblePrimaryButton(
                  padding: EdgeInsets.zero,
                  color: CryptoColors.blue.withOpacity(0.2),
                  onPressed: onPressedCompare,
                  content: [
                    TextPrimary(
                      text: compareStatus,
                      color: CryptoColors.grey,
                      textAlign: TextAlign.left,
                      fontWeight: _isComparingStatus()
                          ? FontWeight.w800
                          : FontWeight.w400,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
            ]
          ],
        ),
        trailing: onPressedFavorite != null
            ? IconButton(
                onPressed: onPressedFavorite,
                icon: PhosphorIcon(
                  PhosphorIcons.star((isFavorite ?? false)
                      ? PhosphorIconsStyle.fill
                      : PhosphorIconsStyle.regular),
                  color: (isFavorite ?? false)
                      ? CryptoColors.yellow
                      : CryptoColors.grey,
                ),
              )
            : null,
      ),
    );
  }

  bool _isComparingStatus() =>
      StatusComparingCryptocurrencyEnum.fromString(compareStatus ??
          StatusComparingCryptocurrencyEnum.ToCompare.status) ==
      StatusComparingCryptocurrencyEnum.Comparing;
}
