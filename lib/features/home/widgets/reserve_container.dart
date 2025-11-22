import 'package:flutter/material.dart';
import 'package:mongiz/constans.dart';
import 'package:mongiz/features/home/widgets/custom_shaking_image.dart';
import 'package:mongiz/features/home/widgets/shaking_image.dart';

class ReserveContainer extends StatelessWidget {
  final String title;
  final String iconPath;
  final VoidCallback onTap;

  const ReserveContainer({
    super.key,
    required this.title,
    required this.iconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: kBackgroundChoice,
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(0),
            bottomRight: Radius.circular(0), // خليتها 0 زي تعليقك
            topRight: Radius.circular(50),
            bottomLeft: Radius.circular(50),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF7548CF).withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min, // عشان ال Row ياخد مساحة المحتوى بس
          children: [
            // 1. استخدمنا Flexible عشان النص مياخدش مساحة الصورة
            Flexible(
              child: Text(
                title,
                maxLines: 1, // عشان ميبوظش شكل الزرار لو نزل سطرين
                overflow: TextOverflow.ellipsis, // يظهر نقط ... لو الكلام كتير
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OmarBold',
                ),
              ),
            ),
            const SizedBox(width: 20),
            // 2. ظبطنا الصورة
            //
            CustomShakingImage(iconPath: iconPath),
          ],
        ),
      ),
    );
  }
}
