import 'package:flutter/material.dart';
import 'package:flutter_application_1/core.dart/theme.dart/app_theme.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isSelected;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color backColor = isSelected ? AppTheme.primaryColor : Colors.white;
    final Color textColor = isSelected ? Colors.white : AppTheme.primaryColor;

    return Container(
      width: 200,
      height: 50,
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppTheme.primaryColor),
        boxShadow: const [
          BoxShadow(color: AppTheme.primaryColor, spreadRadius: 2, blurRadius: 2),
        ],
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(shape: const RoundedRectangleBorder()),
        child: Text(
          label,
          style: TextStyle(fontSize: 16, color: textColor),
        ),
      ),
    );
  }
}
