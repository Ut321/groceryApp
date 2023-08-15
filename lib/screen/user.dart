import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../Widgets/text_widget.dart';
import '../provider/dark_theme_provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                    text: TextSpan(
                        text: 'Hi,  ',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.cyan,
                            fontSize: 27),
                        children: <TextSpan>[
                      TextSpan(
                          text: "My Name",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: color,
                              fontSize: 25))
                    ])),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 20,
                ),
                _listTile(
                    title: 'Address',
                    subtitle: '123 Main St',
                    icons: IconlyLight.profile,
                    onPressed: () {},
                    color: color),
                _listTile(
                    title: 'Orders',
                    icons: IconlyLight.bag2,
                    onPressed: () {},
                    color: color),
                _listTile(
                    title: 'WishList',
                    icons: IconlyLight.heart,
                    onPressed: () {},
                    color: color),
                _listTile(
                    title: 'Viewed Iteam',
                    icons: IconlyLight.show,
                    onPressed: () {},
                    color: color),
                _listTile(
                    title: 'Change Password',
                    icons: IconlyLight.unlock,
                    onPressed: () {},
                    color: color),
                SwitchListTile(
                  title: const Text('Theme'),
                  secondary: Icon(themeState.getDarkTheme
                      ? Icons.dark_mode_outlined
                      : Icons.light_mode_outlined),
                  onChanged: (bool value) {
                    themeState.setDarkTheme = value;
                  },
                  value: themeState.getDarkTheme,
                ),
                _listTile(
                  title: 'Logout',
                  icons: IconlyLight.logout,
                  onPressed: () {},
                  color: color,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _listTile({
  required String title,
  String? subtitle,
  required IconData icons,
  required Function onPressed,
  required Color color,
}) {
  return ListTile(
    title: TextWidget(
      color: color,
      text: title,
      textSize: 22,
      // isTitle: true,
    ),
    subtitle: TextWidget(
      color: color,
      text: subtitle == null ? "" : subtitle,
      textSize: 18,
    ),
    leading: Icon(icons),
    trailing: const Icon(IconlyLight.arrowRight2),
    onTap: () {
      onPressed();
    },
  );
}
