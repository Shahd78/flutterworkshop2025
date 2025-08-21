import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth.dart/view.dart/login_screen.dart';
import 'package:flutter_application_1/auth.dart/view.dart/signup_screen.dart';
import 'package:flutter_application_1/core.dart/theme.dart/app_theme.dart';
import 'package:flutter_application_1/core.dart/widget.dart/custom_button.dart';


class LoginSignScreen extends StatefulWidget {
  const LoginSignScreen({super.key});

  @override
  State<LoginSignScreen> createState() => _LoginSignScreenState();
}

class _LoginSignScreenState extends State<LoginSignScreen> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "booky",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primaryColor,
                ),
              ),
              const SizedBox(height: 60),
              const Text(
                "Your book library at the office",
                style: TextStyle(color: Colors.black, fontSize: 30),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              CustomButton(
                label: "Login",
                isSelected: isLogin,
                onPressed: () {
                  setState(() {
                    isLogin = true;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              CustomButton(
                label: "Sign up",
                isSelected: !isLogin,
                onPressed: () {
                  setState(() {
                    isLogin = false;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignupScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 200,
                child: Image.asset("image/Group 2.jpg"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
