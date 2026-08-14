import 'package:flutter/material.dart';
import 'package:habit/data/constants.dart';
import 'package:habit/views/pages/login_page.dart';
import 'package:lottie/lottie.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: .center,
              children: [
                Lottie.asset('assets/lotties/hi.json', height: 400.0),
                SizedBox(height: 20.0),
                Text(
                  'Ooga and booga',
                  style: KTextStyle.descriptionText,
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 20.0),
                FilledButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 40.0),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginPage(title: "Register");
                        },
                      ),
                    );
                  },
                  child: Text('Next'),
                ),
                SizedBox(height: 50.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
