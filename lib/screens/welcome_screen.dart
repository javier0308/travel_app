import 'package:flutter/material.dart';
import 'package:travel_app/screens/screen.dart';

class WelcomeScreen extends StatelessWidget {
  static const String route = 'welcome';
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            child: Image.asset(
              'assets/welcome.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 150,
            left: 50,
            child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                      text:
                          "Let's start journey, enjoy \n Beatiful Movement of life"),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 55,
            left: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Container(
                width: 300,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: () {
                    Navigator.push(context, _createRoute());
                  },
                  child: const Text(
                    'Start',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 1800),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final curveAnimation =
          CurvedAnimation(parent: animation, curve: Curves.bounceIn);
      return SlideTransition(
        position: Tween<Offset>(begin: const Offset(1, 1), end: Offset.zero)
            .animate(curveAnimation),
        child: child,
      );
    },
    pageBuilder: (context, animation, secondaryAnimation) => const HomeScreen(),
  );
}
