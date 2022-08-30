import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reddit_ui/providers/login_provider.dart';
import 'package:reddit_ui/screens/home_screen.dart';
import 'package:reddit_ui/screens/login_screen.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);
  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Provider.of<LoginProvider>(context).isLoggedIn == false
        ? const LoginScreen()
        : const HomeScreen();
  }
}
