import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reddit_ui/providers/color_provider.dart';
import 'package:reddit_ui/providers/login_provider.dart';
import 'package:reddit_ui/providers/theme_provider.dart';
import 'package:reddit_ui/wrapper.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pf = await SharedPreferences.getInstance();
  bool? themeData = pf.getBool("isDark");
  int? themeColor = pf.getInt("themeColor1");
  bool? hasLoggedIn = pf.getBool("hasLoggedIn");

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(isDark: themeData ?? false),
        ),
        ChangeNotifierProvider(
          create: (_) => ColorProvider(colorIndex: themeColor ?? 0),
        ),
        ChangeNotifierProvider(
          create: (_) => LoginProvider(isLoggedIn: hasLoggedIn ?? false),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

List<MaterialColor> color = [
  Colors.blue,
  Colors.red,
  Colors.orange,
  Colors.green,
];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeProvider>(context).isDark
          ? ThemeData.dark()
          : ThemeData(
              primarySwatch:
                  color[Provider.of<ColorProvider>(context).colorIndex],
            ),
      home: const Wrapper(),
    );
  }
}
