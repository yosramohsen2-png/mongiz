import 'package:flutter/material.dart';
import 'package:mongiz/features/auth/auth_view_model.dart';
import 'package:mongiz/features/choice/views/choice_view.dart';
import 'package:mongiz/features/home/views/home_view.dart';
import 'dart:async';

import 'package:mongiz/features/splash/presentation/widgets/splash_view_body.dart';

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
    _checkAuthAndNavigate();
  }

  Future<void> _checkAuthAndNavigate() async {
    // Ensure splash is visible for at least 3 seconds
    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;

    final authViewModel = AuthViewModel();
    final isLoggedIn = await authViewModel.checkAuthStatus();

    if (!mounted) return;

    if (isLoggedIn) {
      Navigator.of(context).pushReplacementNamed(HomeView.routeName);
    } else {
      Navigator.of(context).pushReplacementNamed(ChoiceView.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SplashViewBody());
  }
}
