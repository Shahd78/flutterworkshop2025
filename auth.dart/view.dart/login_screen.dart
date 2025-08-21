
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core.dart/data.dart/user_data.dart';
import 'package:flutter_application_1/core.dart/theme.dart/app_theme.dart';
import 'package:flutter_application_1/core.dart/widget.dart/custom_button.dart';
import 'package:flutter_application_1/screens.dart/home.dart/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

 
  void login() {
    String username = usernameController.text;
  String password = passwordController.text;
     bool userFound = users.any(
    (user) => user.username == username && user.password == password,
  );
   if (userFound) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppTheme.primaryColor,
        title: const Text(
          "booky",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 100),
              SizedBox(
                height: 50,
                width: 300,
                child: TextField(
                  controller: usernameController, 
                  decoration: InputDecoration(
                    labelText: "Username",
                    prefixIcon: const Icon(Icons.person, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 50,
                width: 300,
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: const Icon(Icons.lock, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                "Forget your password?",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              const SizedBox(height: 70),
              CustomButton(
                label: "Login",
                onPressed: login, 
                isSelected: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
