import 'package:flutter/material.dart';
// تأكدي من استيراد كل الثوابت
import 'package:mongiz/constans.dart';
import 'package:mongiz/features/choice/views/choice_view.dart';
import 'package:mongiz/features/splash/presentation/view/splash_view.dart';
// استيراد شاشة الـ Onboarding

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData.dark().copyWith(
        // 1. استخدام اللون الداكن للخلفية (Scaffold)
        scaffoldBackgroundColor: kScaffoldDarkColor,

        // 2. تخصيص الـ ColorScheme باستخدام لون الجريدينت الأساسي
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
              // يمكنك تخصيص أي نص آخر هنا
            ),
      ),

      initialRoute: '/',
      routes: {
        '/': (context) => const SplashView(),
        '/choiceView': (context) => const ChoiceView(),
      },
    );
  }
}
