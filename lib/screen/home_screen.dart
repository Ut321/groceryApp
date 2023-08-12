import 'package:flutter/material.dart';
import 'package:groceryapp/provider/dark_theme_provider.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final themeState = Provider.of<DarkThemeProvider>(context);   //use Dark theme Provider class 

    return Scaffold(
      body: Center(
          child: SwitchListTile(
        title: Text('Theme'),
        secondary: Icon(themeState.getDarkTheme
            ? Icons.dark_mode_outlined
            : Icons.light_mode_outlined),
        onChanged: (bool value) {
          themeState.setDarkTheme = value;
        },
        value: themeState.getDarkTheme,
      )),
    );
  }
}
