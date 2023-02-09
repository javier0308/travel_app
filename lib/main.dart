import 'package:flutter/material.dart';
import 'package:travel_app/screens/screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel App',
      initialRoute: WelcomeScreen.route,
      routes: {
        WelcomeScreen.route: (_) => const WelcomeScreen(),
        HomeScreen.route: (_) => const HomeScreen(),
        DetailsScreen.route: (_) => const DetailsScreen()
      },
    );
  }
}
