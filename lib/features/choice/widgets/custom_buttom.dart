import 'package:flutter/material.dart';
import 'package:mongiz/constans.dart';
import 'package:mongiz/core/utils/styles.dart';

class CustomButtom extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const CustomButtom({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
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
          style: Styles.textStyle16.copyWith(
            color: Colors.white,
            decoration: TextDecoration.none,
            fontFamily: 'OmarBold',
          ),
        ),
      ),
    );
  }
}
