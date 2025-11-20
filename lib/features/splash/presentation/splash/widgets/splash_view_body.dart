import 'package:flutter/material.dart';
import 'package:mongiz/core/utils/assets.dart';
import 'package:mongiz/features/splash/presentation/widgets/reusable_glow_image.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});
  static const String routeName = 'splashViewBody';
  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  bool _isAstronautUp = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        setState(() {
          _isAstronautUp = true; // بدء حركة رائد الفضاء
        });
      }
    });

    // بدء الانتقال إلى الشاشة التالية بعد التأخير
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacementNamed('/nextScreen');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // 💎 إحداثيات الجوهرة (ثابتة)
    const double diamondTopFactor = 0.25;
    const double diamondLeftFactor = 0.30;

    // 🚀 إحداثيات نهاية حركة رائد الفضاء (مستقلة الآن)
    // موضع النهاية لرائد الفضاء (عشان يمسك الجوهرة)
    const double astronautEndLeftFactor = 0.40; // موضع أفقي ثابت
    const double astronautEndBottomFactor = 0.50; // موضع رأسي ثابت

    // حجم رائد الفضاء
    final double astronautHeight = size.height * 0.25;

    return Stack(
      fit: StackFit.expand,
      children: [
        // 1. صورة الخلفية الثابتة
        Image.asset(AssetsData.backGround, fit: BoxFit.cover),

        // 2. رائد الفضاء المتحرك (الطبقة السفلية)
        AnimatedPositioned(
          duration: const Duration(seconds: 3),
          curve: Curves.easeInOutCubic,

          // X-Axis (Left): يبدأ من 0.1 وينتهي عند قيمة ثابتة (0.32)
          left: _isAstronautUp
              ? size.width * astronautEndLeftFactor
              : size.width * 0.1,

          // Y-Axis (Bottom): يبدأ من 0.05 وينتهي عند قيمة ثابتة (0.65)
          bottom: _isAstronautUp
              ? size.height * astronautEndBottomFactor
              : size.height * 0.05,

          child: Image.asset(
            AssetsData.astronaut,
            height: astronautHeight,
            fit: BoxFit.contain,
          ),
        ),

        // 3. الجوهرة (الطبقة العلوية)
        Positioned(
          // الجوهرة الآن مستقلة تماماً عن حركة رائد الفضاء
          top: size.height * diamondTopFactor,
          left: size.width * diamondLeftFactor,
          child: ReusableGlowImage(
            imagePath: AssetsData.diamondLight,
            size: 60,
            duration: const Duration(seconds: 1),
            maxGlowIntensity: 1.5,
          ),
        ),
      ],
    );
  }
}
