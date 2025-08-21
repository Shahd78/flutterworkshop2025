// lib/features/books/book_details.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core.dart/data.dart/books_data.dart';
import 'package:flutter_application_1/core.dart/theme.dart/app_theme.dart';

class BookDetailsScreen extends StatelessWidget {
  final String imagePath;
  final String title;
  final String name;
  final String category;

  const BookDetailsScreen({
    super.key,
    required this.imagePath,
    required this.title,
    required this.name,
    required this.category
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booky", style: const TextStyle(color: Colors.white,fontSize: 30),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(imagePath, height: 250),
              const SizedBox(height: 20),
              Text(
                title,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                " $name",
                style: const TextStyle(fontSize: 15, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              const Text(" Rating :    ⭐ ⭐ ⭐ ⭐ ☆", style: TextStyle(fontSize: 15)),
              const SizedBox(height: 10),
              Text("Genre:       $category        ", style: const TextStyle(fontSize: 15,color:Colors.black,)),
              const SizedBox(height: 20),
               const Text(" Avaliable", style: TextStyle(fontSize: 13,color: AppTheme.primaryColor,)),
                const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  final newBook = {
                    "image": imagePath,
                    "title": title,
                    "name": name,
                  };
                   final alreadyExists = myBooks.any(
                    (book) =>
                        book["title"] == title &&
                        book["name"] == name,
                                  );
                          if (alreadyExists) {
                                 print("already exist");
                                 }else {
                                    myBooks.add(newBook);
                                  
                                  }
                   
                },
             
                label: const Text("Add to My Books"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
