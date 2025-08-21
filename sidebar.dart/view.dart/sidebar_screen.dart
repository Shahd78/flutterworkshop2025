import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth.dart/view.dart/login_sign_screen.dart';
import 'package:flutter_application_1/core.dart/data.dart/books_data.dart';
import 'package:flutter_application_1/core.dart/theme.dart/app_theme.dart';
import 'package:flutter_application_1/screens.dart/home.dart/my_book.dart';

class SidebarScreen extends StatelessWidget {
  const SidebarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
         width: 250,
        color: Colors.white,
        child:  ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16.0, bottom: 12.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Welcome, book_nerd!",
                  style: TextStyle(color: AppTheme.primaryColor, fontSize: 20),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> MyBooksPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.menu_book),
              title: const Text('Catalog'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('Friends'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.group),
              title: const Text('Groups'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.event),
              title: const Text('Events'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Sign Out'),
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginSignScreen()));
              },
            ),
          ],
        ),
    );
  }
}
