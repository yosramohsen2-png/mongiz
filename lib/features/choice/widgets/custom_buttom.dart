import 'package:flutter/material.dart';
import 'package:mongiz/constans.dart';

class CustomButtom extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const CustomButtom({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    // بنستخدم GestureDetector عشان نخلي الـ Container قابل للنقر
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150, // زودت العرض شوية عشان يكون شكله أحسن كزرار رئيسي
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          // تطبيق الـ Gradient بالعرض
          gradient: const LinearGradient(
            colors: kButtomGradientColors,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: kButtomGradientColors.last.withOpacity(0.5),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
