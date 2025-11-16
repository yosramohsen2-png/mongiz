import 'package:flutter/material.dart';
import 'dart:async';

import 'package:mongiz/features/splash/presentation/widgets/splash_view_body.dart'; // نحتاج هذه المكتبة لاستخدام Future.delayed

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  // دالة خاصة لعمل التأخير والانتقال
  void _navigateToNextScreen() {
    // الانتقال بعد 5 ثواني تأخير
    Future.delayed(const Duration(seconds: 5), () {
      // نتأكد أن الـ Widget مازال موجود في الـ Widget Tree قبل الانتقال
      if (mounted) {
        // الانتقال لـ ChoiceView
        Navigator.of(context).pushReplacementNamed('/choiceView');
      }
    });
  }

  @override
  void dispose() {
    // بما أننا استخدمنا Future.delayed وليس Timer، فلا نحتاج لعمل dispose محدد.
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
