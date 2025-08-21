import 'package:flutter/material.dart';
import 'package:flutter_application_1/core.dart/theme.dart/app_theme.dart';

class BookCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String name;
  final Color textcolor;
  final bool showCheck;
  final double height;

  const BookCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.name,
    required this.textcolor,
    this.showCheck = false,
    this.height = 180,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height - 30,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    imagePath, 
                    height: height,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: height,
                        width: double.infinity,
                        color: Colors.grey[300],
                        child: const Icon(Icons.broken_image, size: 40, color: Colors.grey),
                      );
                    },
                  ),
                ),
                if (showCheck)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child:  Icon(
                        showCheck ? Icons.check : Icons.save,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 6),
          Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 12,
                color: textcolor,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 3),
          Center(
            child: Text(
              name,
              style: TextStyle(
                fontSize: 10,
                color: textcolor,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
