import 'package:flutter/material.dart';
import 'package:mongiz/features/choice/views/choice_view.dart';
import 'package:mongiz/features/splash/presentation/view/splash_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case ChoiceView.routeName:
      return MaterialPageRoute(builder: (_) => const ChoiceView());

    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(child: Text('No route defined for ${settings.name}')),
        ),
      );
  }
}
