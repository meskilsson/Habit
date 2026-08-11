import 'package:flutter/material.dart';
import 'package:habit/views/pages/login_page.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: .center,
          children: [
            FittedBox(
              child: Text(
                'Habit',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50.0,
                  letterSpacing: 50.0,
                ),
              ),
            ),
            Lottie.asset('assets/lotties/welcome.json'),
            FilledButton(
              style: FilledButton.styleFrom(
                minimumSize: Size(double.infinity, 40.0),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginPage();
                    },
                  ),
                );
              },
              child: Text('Get Started'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                minimumSize: Size(double.infinity, 40.0),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginPage();
                    },
                  ),
                );
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
