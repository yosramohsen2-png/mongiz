import 'package:flutter/material.dart';
// تأكدي من استيراد كل الثوابت
import 'package:mongiz/constans.dart';
import 'package:mongiz/core/helper_functions/on_generate_routes.dart';
import 'package:mongiz/features/splash/presentation/view/splash_view.dart';
// استيراد شاشة الـ Onboarding

void main() {
  runApp(const Mongiz());
}

class Mongiz extends StatelessWidget {
  const Mongiz({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kScaffoldDarkColor,

        colorScheme: ColorScheme.fromSeed(
          seedColor: kAppPrimaryColor,
          brightness: Brightness.dark,
          primary: kAppPrimaryColor,
        ),

        textTheme: ThemeData.dark().textTheme
            .apply(fontFamily: 'OmarRegular')
            .copyWith(
              titleLarge: ThemeData.dark().textTheme.titleLarge?.copyWith(
                fontFamily: 'OmarBold',
              ),
            ),
      ),

      onGenerateRoute: onGenerateRoutes,
      initialRoute: SplashView.routeName,
    );
  }
}
