import 'package:flutter/material.dart';
import 'package:flutter_application_1/core.dart/data.dart/user_data.dart';
import 'package:flutter_application_1/core.dart/theme.dart/app_theme.dart';

import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void signup() {
    String username = usernameController.text;
    String password = passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields")),
      );
      return;
    }

    
    users.add(User(username: username, password: password));

    
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
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
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
                width: 300,
                child: TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(labelText: "Username"),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 50,
                width: 300,
                child: TextField(
                  decoration: const InputDecoration(labelText: "Email"),
                ),
              ),
               const SizedBox(height: 16),
              SizedBox(
                height: 50,
                width: 300,
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  obscuringCharacter: "*",
                  decoration: const InputDecoration(labelText: "Password"),
                ),
              ),
               const SizedBox(height: 16),
              SizedBox(
                height: 50,
                width: 300,
                child: TextField(
                  obscureText: true,
                  obscuringCharacter: "*",
                  decoration: const InputDecoration(labelText: "Confirm Password"),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: signup,
                child: const Text("Sign Up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
