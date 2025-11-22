import 'package:flutter/material.dart';
import 'package:mongiz/features/choice/views/choice_view.dart';
import 'package:mongiz/features/home/views/home_view.dart';
import 'package:mongiz/features/note/presentation/views/note_view.dart';
import 'package:mongiz/features/signin/views/signin_view.dart';
import 'package:mongiz/features/signup/views/signup_view.dart';
import 'package:mongiz/features/splash/presentation/view/splash_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case ChoiceView.routeName:
      return MaterialPageRoute(builder: (_) => const ChoiceView());

    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());
    case SigninView.routeName:
      return MaterialPageRoute(builder: (_) => const SigninView());
    case SignupView.routeName:
      return MaterialPageRoute(builder: (_) => const SignupView());
    case HomeView.routeName:
      return MaterialPageRoute(builder: (_) => const HomeView());
    case NoteView.routeName:
      return MaterialPageRoute(builder: (_) => const NoteView());
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(child: Text('No route defined for ${settings.name}')),
        ),
      );
  }
}
