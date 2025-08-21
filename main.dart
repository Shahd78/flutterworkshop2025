import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core.dart/data.dart/books_data.dart';
import 'package:flutter_application_1/core.dart/theme.dart/app_theme.dart';
import 'package:flutter_application_1/screens.dart/home.dart/book_details.dart';
import 'package:flutter_application_1/screens.dart/home.dart/category.dart';
import 'package:flutter_application_1/screens.dart/home.dart/home_screen.dart';
import 'package:flutter_application_1/screens.dart/home.dart/my_book.dart';
import 'package:flutter_application_1/sidebar.dart/view.dart/sidebar_screen.dart';
import 'package:flutter_application_1/auth.dart/view.dart/login_screen.dart';
import 'package:flutter_application_1/auth.dart/view.dart/login_sign_screen.dart';
import 'package:flutter_application_1/features.dart/splash.dart/view.dart/splash_screen.dart';

void main(){
  runApp( BookyApp());
}

class BookyApp extends StatelessWidget{

const BookyApp({super.key});


        @override
          Widget build(BuildContext context) {
          return MaterialApp(
        title: "Booky",
        debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
          home:  SplashScreen(),


   );






  }


}









