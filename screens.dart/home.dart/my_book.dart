import 'package:flutter/material.dart';
import 'package:flutter_application_1/core.dart/data.dart/books_data.dart';
import 'package:flutter_application_1/core.dart/theme.dart/app_theme.dart';
import 'package:flutter_application_1/core.dart/widget.dart/book_card.dart';


class MyBooksPage extends StatelessWidget {
 
  MyBooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Books",
          style: TextStyle(color:  Colors.white),
        ),
        backgroundColor: AppTheme.primaryColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: myBooks.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, 
            childAspectRatio: 0.6, 
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final book = myBooks[index];
                              return BookCard(
                      imagePath: book["imagePath"]!,
                      title: book["title"] !,
                      name: book["name"] !,
                      textcolor: Colors.black,
                      showCheck: true,
                      height: 230,
                    );

          },
        ),
      ),
    );
  }
}
