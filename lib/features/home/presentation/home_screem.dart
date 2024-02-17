import 'package:crypto/core/responsive/responsive.dart';
import 'package:crypto/core/theme/colors/crypto_colors.dart';
import 'package:crypto/core/widgets/searches/searcher.dart';
import 'package:crypto/features/cryptocurrencies/presentation/bloc/cryptocurrencies_bloc.dart';
import 'package:crypto/features/cryptocurrencies/presentation/ui/cryptocurrencies_screen.dart';
import 'package:crypto/features/favorites/presentation/favorites_screen.dart';
import 'package:crypto/features/home/presentation/controller/home_controller.dart';
import 'package:crypto/features/home/presentation/widgets/bottom_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const route = 'home-screen';
  HomeScreen({super.key});
  final HomeController homeController = HomeController();
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CryptocurrenciesBloc>(context)
        .add(const GetCryptocurrencies());
    print('🥶HomeScreen');
    homeController.context = context;
    homeController.listenSearched();
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
              Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.black),
              const FavoritesScreen(),
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
          valueListenable: homeController.showAppBar,
          builder: (context, showAppBar, child) {
            if (!showAppBar) {
              return const SizedBox.shrink();
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
}
