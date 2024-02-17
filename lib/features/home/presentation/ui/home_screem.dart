import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/core/responsive/responsive.dart';
import 'package:crypto/core/theme/colors/crypto_colors.dart';
import 'package:crypto/core/widgets/searches/searcher.dart';
import 'package:crypto/core/widgets/texts/text_primary.dart';
import 'package:crypto/features/cryptocurrencies/presentation/bloc/cryptocurrencies_bloc.dart';
import 'package:crypto/features/cryptocurrencies/presentation/ui/cryptocurrencies_screen.dart';
import 'package:crypto/features/comparison/presentation/ui/comparison_screen.dart';
import 'package:crypto/features/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:crypto/features/favorites/presentation/ui/favorites_screen.dart';
import 'package:crypto/features/home/presentation/controller/home_controller.dart';
import 'package:crypto/features/home/presentation/ui/widgets/bottom_navigator.dart';
import 'package:crypto/features/login/presentation/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HomeScreen extends StatelessWidget {
  static const route = 'home-screen';
  HomeScreen({super.key});
  final HomeController homeController = HomeController();
  @override
  Widget build(BuildContext context) {
    final String userId =
        BlocProvider.of<LoginBloc>(context).state.userId ?? '';
    BlocProvider.of<CryptocurrenciesBloc>(context)
        .add(const GetCryptocurrencies());
    BlocProvider.of<FavoritesBloc>(context).add(GetFavorites(userId));
    homeController.context = context;
    homeController.searchListener();
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: CryptoColors.white,
          appBar: _appBar(context),
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: homeController.pageController,
            children: [
              CryptocurrenciesScreen(),
              const FavoritesScreen(),
              const ComparisonScreen(),
            ],
          ),
          bottomNavigationBar: CryptocurrencyBottomNavigator(
            onPressed: (pageIndex) {
              homeController.jumpToPage(pageIndex);
            },
          ),
        ),
      ),
    );
  }

  AppBar? _appBar(BuildContext context) {
    return AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: ValueListenableBuilder(
          valueListenable: homeController.currentIndexNotifier,
          builder: (context, currentIndex, child) {
            if (currentIndex == 1) {
              return titleAndLogOut('Favorites');
            }
            if (currentIndex == 2) {
              return titleAndLogOut('Comparison');
            }
            return Container(
              alignment: Alignment.topLeft,
              width: Responsive.of(context).widthPercent(92),
              height: Responsive.of(context).heightPercent(5),
              child: TextInputWidget(
                controller: homeController.textEditingController,
                hintText: 'Filter by name',
              ),
            );
          },
        ));
  }

  Widget titleAndLogOut(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextPrimary(
          text: text,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: CryptoColors.grey,
        ),
        IconButton(
          onPressed: () => homeController.logOut(),
          icon: Icon(
            PhosphorIcons.signOut(),
            color: CryptoColors.grey,
          ),
        )
      ],
    );
  }
}
