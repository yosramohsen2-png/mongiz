import 'package:flutter/material.dart';
import 'package:mongiz/features/splash/presentation/widgets/splash_view_body.dart';
import 'dart:async'; // نحتاج هذه المكتبة لاستخدام Future.delayed

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  // لا نحتاج لـ Timer object، فقط نستخدم Future.delayed
  // مع فحص mounted لضمان عدم حدوث أخطاء بعد الـ dispose

  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  // دالة خاصة لعمل التأخير والانتقال
  void _navigateToHome() {
    // الانتقال بعد 5 ثواني تأخير
    Future.delayed(const Duration(seconds: 5), () {
      // نتأكد أن الـ Widget مازال موجود في الـ Widget Tree قبل الانتقال
      if (mounted) {
        // الانتقال للشاشة الرئيسية (MainScreen) وحذف الـ Splash View من المكدس
        Navigator.of(context).pushReplacementNamed('/main');
      }
    });
  }

  @override
  void dispose() {
    // بما أننا استخدمنا Future.delayed وليس Timer، فلا نحتاج لعمل
    // cancel() هنا، ولكن تركها كـ dispose فارغة هي الممارسة الافتراضية.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // ScaffoldBody هيحتوي على كل الحركة والـ Widgets (رائد الفضاء والجوهرة)
      body: SplashViewBody(),
    );
  }
}
