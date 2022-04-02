import 'package:flutter/material.dart';
import 'package:neu_weather/routing/routes.dart';
import 'package:provider/provider.dart';
import '../screens/screens_index.dart';
import 'theme/theme_index.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AppThemeConfig>(create: (_) => AppThemeConfig()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appThemeData = Provider.of<AppThemeConfig>(context);
    Routing routing = Routing();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: appThemeData.currentAppTheme,
      initialRoute: '/',
      routes: routing.routes,
    );
  }
}
