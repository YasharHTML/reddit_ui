import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:provider/provider.dart';
import 'package:reddit_ui/providers/color_provider.dart';
import 'package:reddit_ui/providers/login_provider.dart';
import 'package:reddit_ui/providers/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySettingsScreen extends StatefulWidget {
  const MySettingsScreen({Key? key}) : super(key: key);

  @override
  State<MySettingsScreen> createState() => _MySettingsScreenState();
}

class _MySettingsScreenState extends State<MySettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Application Settings")),
      body: SettingsContainer(
        children: [
          SettingsGroup(
            title: 'Theme',
            children: [
              SwitchSettingsTile(
                title: "Dark Theme",
                settingKey: "isDark",
                onChange: (value) =>
                    Provider.of<ThemeProvider>(context, listen: false)
                        .changeTheme(value),
              ),
              DropDownSettingsTile<int>(
                title: 'Select Color',
                settingKey: 'themeColor1',
                values: const <int, String>{
                  0: 'Blue',
                  1: 'Red',
                  2: 'Orange',
                  3: 'Green',
                },
                selected: 0,
                onChange: (value) =>
                    Provider.of<ColorProvider>(context, listen: false)
                        .changeColorIndex(value),
              ),
            ],
          ),
          SettingsGroup(
            title: "Log off",
            children: [
              SimpleSettingsTile(
                title: "Log off",
                onTap: () async {
                  SharedPreferences pf = await SharedPreferences.getInstance();
                  pf.setBool("hasLoggedIn", false).then(
                    (value) {
                      Provider.of<LoginProvider>(context, listen: false)
                          .setLoginStatus(false);
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
