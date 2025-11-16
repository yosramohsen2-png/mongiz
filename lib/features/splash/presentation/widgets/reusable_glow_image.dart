import 'package:flutter/material.dart';

class ReusableGlowImage extends StatefulWidget {
  // 1. مسار الصورة المطلوب عمل تأثير الإضاءة عليها
  final String imagePath;
  // 2. حجم الـ Widget (الجوهرة أو غيرها)
  final double size;
  // 3. مدة دورة الوميض الكاملة
  final Duration duration;
  // 4. أقصى درجة إضاءة (الـ Tween هيتراوح بين 0.5 والقيمة دي)
  final double maxGlowIntensity;

  const ReusableGlowImage({
    super.key,
    required this.imagePath,
    this.size = 80.0, // قيمة افتراضية مناسبة للجوهرة
    this.duration = const Duration(seconds: 2), // قيمة افتراضية
    this.maxGlowIntensity = 1.0, // قيمة افتراضية (إضاءة كاملة)
  });

  @override
  State<ReusableGlowImage> createState() => _ReusableGlowImageState();
}

class _ReusableGlowImageState extends State<ReusableGlowImage>
    with SingleTickerProviderStateMixin {
  
  late AnimationController _controller;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      duration: widget.duration, // بنستخدم المدة اللي تحدديها
      vsync: this,
    )..repeat(reverse: true); // يتكرر للأبد ويعكس الحركة

    // الـ Tween هيبدأ من 0.5 وينتهي عند القيمة اللي تحدديها للـ maxGlowIntensity
    _glowAnimation = Tween<double>(begin: 0.5, end: widget.maxGlowIntensity).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _glowAnimation,
        builder: (context, child) {
          // قيمة الوميض الحالية
          final glowValue = _glowAnimation.value;
          
          return ColorFiltered(
            // ColorFilter.matrix هو اللي بيعمل تأثير الإضاءة (Brightness)
            colorFilter: ColorFilter.matrix(<double>[
              // R  G  B  A  Const
              glowValue, 0, 0, 0, 0,  // Red channel
              0, glowValue, 0, 0, 0,  // Green channel
              0, 0, glowValue, 0, 0,  // Blue channel
              0, 0, 0, 1, 0,        // Alpha channel
            ]),
            child: Image.asset(
              widget.imagePath, // مسار الصورة هيتغير حسب اللي بتمرريه
              fit: BoxFit.contain,
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
