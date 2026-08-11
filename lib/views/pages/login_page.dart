import 'package:flutter/material.dart';
import 'package:habit/views/widget_tree.dart';
import 'package:habit/views/widgets/hero_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  String confirmedEmail = '123';
  String confirmedPassword = '456';
  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            HeroWidget(
              title: 'Login',
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: controllerEmail,
              decoration: InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              onEditingComplete: () {
                setState(() {});
              },
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: controllerPassword,
              decoration: InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              onEditingComplete: () {
                setState(() {});
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 40.0),
              ),
              onPressed: () {
                onLoginPressed();
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

  void onLoginPressed() {
    if (confirmedEmail == controllerEmail.text &&
        confirmedPassword == controllerPassword.text) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return WidgetTree();
          },
        ),
      );
    }
  }
}
