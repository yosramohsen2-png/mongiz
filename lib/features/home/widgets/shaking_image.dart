import 'package:flutter/material.dart';

class ShakingImage extends StatefulWidget {
  final String iconPath;
  final double height; // عشان لو عايزة تتحكمي في ارتفاعه من بره

  const ShakingImage({
    super.key,
    required this.iconPath,
    this.height = 40, // قيمة افتراضية
  });

  @override
  State<ShakingImage> createState() => _ShakingImageState();
}

class _ShakingImageState extends State<ShakingImage>
    with SingleTickerProviderStateMixin {
  // Controller: بيتحكم في مدة وعدد مرات الحركة
  late final AnimationController _controller;

  // Animation: بيحدد قيمة الحركة (من -3 لـ +3)
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1000,
      ), // سرعة اهتزاز عالية (150 مللي ثانية)
    );

    _animation = Tween<double>(
      begin: -3.0,
      end: 3.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

    // بنخليه يكرر الحركة باستمرار ويعكسها عشان يعمل اهتزاز
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose(); // لازم نتخلص من الكونترولر عشان ميستهلكش موارد
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // AnimatedBuilder: عشان نعيد بناء الـ Widget في كل مرحلة من مراحل الحركة
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        // Transform.translate: هو اللي بيعمل الحركة الأفقية (الاهتزاز)
        return Transform.translate(
          offset: Offset(
            _animation.value,
            0,
          ), // بيغير قيمة الـ X (أفقي) حسب قيمة الأنيميشن
          child: Image.asset(
            widget.iconPath,
            height: widget.height,
            fit: BoxFit.contain,
          ),
        );
      },
    );
  }
}
