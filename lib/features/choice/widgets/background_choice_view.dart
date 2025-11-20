import 'package:flutter/material.dart';
import 'package:mongiz/core/utils/assets.dart';

class BackgroundChoiceView extends StatelessWidget {
  const BackgroundChoiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // 1. صورة الخلفية الثابتة
        Image.asset(AssetsData.backGround, fit: BoxFit.cover),
      ],
    );
  }
}
