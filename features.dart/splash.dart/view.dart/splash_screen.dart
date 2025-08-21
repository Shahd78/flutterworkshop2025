import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth.dart/view.dart/login_sign_screen.dart';
import 'package:flutter_application_1/core.dart/theme.dart/app_theme.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 150),
            const Text(
              "booky",
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginSignScreen()),
                  );
                },
                child: Image.asset("image/image-removebg-preview.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
