import '../screens/screens_index.dart';

class Routing {
  final routes = {
    '/': (context) => const SplashScreen(),
    '/home': (context) => const HomeScreen(),
    'forecast_report': (context) => const ForecastReport(),
  };
}
