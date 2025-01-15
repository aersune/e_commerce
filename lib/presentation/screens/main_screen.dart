import 'package:e_commerce/presentation/screens/browse_screen/browse_screen.dart';
import 'package:e_commerce/presentation/screens/cart_screen.dart';
import 'package:e_commerce/presentation/screens/favorites_screen/favorites_screen.dart';
import 'package:e_commerce/presentation/screens/home_screen.dart';
import 'package:e_commerce/presentation/screens/settings_screen.dart';
import 'package:e_commerce/presentation/widgets/bottom_navbar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/bloc/products_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var index = 0;
  List<Widget> pages = [
    HomeScreen(),
    BrowseScreen(),
    FavoritesScreen(),
    CartScreen(),
    SettingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
          body: pages[index],
          bottomNavigationBar: BottomNavbarWidget(setIndex: (val){
            val == 1 ? context.read<ProductsBloc>().add(ProductCategoryEvent()) : null;
            setState(() {
              index = val;
            });
            // pageController.animateToPage(val, duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
          },),
      ),
    );
  }
}
