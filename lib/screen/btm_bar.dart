import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:groceryapp/screen/cart.dart';
import 'package:groceryapp/screen/categories.dart';
import 'package:groceryapp/screen/home_screen.dart';
import 'package:groceryapp/screen/user.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';

class ButtomBarScreen extends StatefulWidget {
  const ButtomBarScreen({super.key});

  @override
  State<ButtomBarScreen> createState() => _ButtomBarScreenState();
}

class _ButtomBarScreenState extends State<ButtomBarScreen> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _pages = [
    {'page': const HomeScreen(), 'title': 'Home Screen'},
    {'page': const CategoriesScreen(), 'title': 'Categories Screen'},
    {'page': const CartScreen(), 'title': 'Cart Screen'},
    {'page': const UserScreen(), 'title': 'User Screen'},
  ];

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool _isDark = themeState.getDarkTheme;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(_pages[_selectedIndex]['title']),
      // ),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: _isDark ? Colors.white10 : Colors.black,
          selectedItemColor:
              _isDark ? Colors.lightBlue.shade200 : Colors.black87,
          showSelectedLabels: false,
          backgroundColor: _isDark ? Theme.of(context).cardColor : Colors.white,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _selectedPage,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                  _selectedIndex == 0 ? IconlyBold.home : IconlyLight.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 1
                  ? IconlyBold.category
                  : IconlyLight.category),
              label: "Categories",
            ),
            BottomNavigationBarItem(
              icon:
                  Icon(_selectedIndex == 2 ? IconlyBold.buy : IconlyLight.buy),
              label: "Buy",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                  _selectedIndex == 3 ? IconlyBold.home : IconlyLight.user2),
              label: "User",
            ),
          ]),
    );
  }
}
