import 'package:flutter/material.dart';
import 'package:mongiz/features/choice/views/choice_view.dart';
import 'dart:async';

import 'package:mongiz/features/splash/presentation/widgets/splash_view_body.dart'; // نحتاج هذه المكتبة لاستخدام Future.delayed

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static const String routeName = 'splashView';
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() {
    Future.delayed(const Duration(seconds: 7), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacementNamed(ChoiceView.routeName);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SplashViewBody());
  }
}
