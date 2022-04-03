import 'package:flutter/cupertino.dart';

class AppRouter {
  final BuildContext context;

  AppRouter({required this.context});

  void pushNamedAndRemoveUntil(String name) {
    Navigator.pushNamedAndRemoveUntil(
        context, name, (Route<dynamic> route) => false);
  }

  void pushNamed(String name) {
    Navigator.pushNamed(context, name);
  }
}
