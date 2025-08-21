import 'package:flutter/material.dart';
import 'package:flutter_application_1/core.dart/data.dart/books_data.dart';
import 'package:flutter_application_1/core.dart/theme.dart/app_theme.dart';
import 'package:flutter_application_1/core.dart/widget.dart/book_card.dart';
import 'package:flutter_application_1/core.dart/widget.dart/category_card.dart';
import 'package:flutter_application_1/screens.dart/home.dart/category.dart';
import 'package:flutter_application_1/sidebar.dart/view.dart/sidebar_screen.dart';
import 'book_details.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
         
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(150),
                bottomRight: Radius.circular(150),
              ),
              child: Container(
                height: 300,
                color: AppTheme.primaryColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Recently added",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 220,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: books.length,
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          itemBuilder: (context, index) {
                            double topMargin = index.isEven ? 0 : 10;
                            final book = books[index];
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
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: index == 0 ? 20 : 10,
                                  right: index == books.length - 1 ? 20 : 0,
                                  top: topMargin,
                                ),
                                child: BookCard(
                                  imagePath: book["imagePath"]!,
                                  title: book["title"]!,
                                  name: book["name"]!,
                                  textcolor: Colors.white,
                                  showCheck: false,
                                  height: 180,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 13),
        
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "My books (${myBooks.length})",
                style: TextStyle(
                  fontSize: 22,
                  color: AppTheme.primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: myBooks.length,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  final myBook = myBooks[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookDetailsScreen(
                            imagePath: myBook["imagePath"]!,
                            title: myBook["title"]!,
                            name: myBook["name"]!,
                           category: myBook["category"]!,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      child: BookCard(
                        imagePath: myBook["imagePath"]!,
                        title: myBook["title"]!,
                        name: myBook["name"]!,
                        textcolor: Colors.black,
                        showCheck: true,
                        height: 180,
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 3),
      
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Categories",
                style: TextStyle(
                  fontSize: 22,
                  color: AppTheme.primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryBooksScreen(
                              categoryName: category["title"]!,
                              categoryImage: category["imagePath"]!,
                              filteredcat: books,
                          ),
                       
                          ),
                        
                      );
                    },
                    child: CategoryCard(
                      title: category["title"]!,
                      imagePath: category["imagePath"]!,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
