import 'package:flutter/material.dart';
import 'package:flutter_application_1/core.dart/data.dart/books_data.dart';
import 'package:flutter_application_1/core.dart/theme.dart/app_theme.dart';
import 'package:flutter_application_1/core.dart/widget.dart/book_card.dart';
import 'package:flutter_application_1/sidebar.dart/view.dart/sidebar_screen.dart';
import 'book_details.dart';

class CategoryBooksScreen extends StatelessWidget {
  final String categoryName;
  final String categoryImage;
  final List<Map<String, String>> filteredcat;

  const CategoryBooksScreen({
    super.key,
    required this.categoryName,
    required this.categoryImage,
    required this.filteredcat,
  });

  @override
  Widget build(BuildContext context) {
     
    List<Map<String, String>> categoryBooks = [];
for (var book in filteredcat) {
  if (book["category"]!.toLowerCase() == categoryName.toLowerCase()) {
    categoryBooks.add(book);
  }
}

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Booky",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      drawer: SidebarScreen(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          ClipRRect(
                   borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(150),
                    bottomRight: Radius.circular(150),
                  ),
  child: Stack(
    alignment: Alignment.center, 
    children: [
      Image.asset(categoryImage,width:MediaQuery.of(context).size.width,fit: BoxFit.cover,), 
      Container(
       
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          categoryName,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ],
  ),
),
  const SizedBox(height: 16),
   Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Books (${categoryBooks.length})",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryColor,
                  ),
                ),
              ),
            ),
    const SizedBox(height: 10),

Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16),
  child: categoryBooks.isEmpty
      ? const Center(
          child: Text( "No books found in this category ", ),
        )
      : GridView.builder(
       

          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: categoryBooks.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 0.65,
          ),
          itemBuilder: (context, index) {
            final book = categoryBooks[index];
             final isSaved = myBooks.any((savedBook) => savedBook["title"] == book["title"]);
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookDetailsScreen(
                      imagePath: book["imagePath"]!,
                      title: book["title"]!,
                      name: book["name"]!,
                      category: book["category"]!,
                    ),
                  ),
                );
              },
              child: BookCard(
                imagePath: book["imagePath"]!,
                title: book["title"]!,
                name: book["name"]!,
                textcolor: Colors.black,
                showCheck: isSaved,
                height: 180,
              ),
            );
          },
        ),
),










          ],
        ),
                 
    ),);
  
  }
}
