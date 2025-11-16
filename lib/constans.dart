// import 'package:flutter/material.dart';

// const List<Color> kPrimaryGradientColors = [
//   Color(0xFF5391ED),
//   Color(0xFFC4B0FF),
// ];
// const List<Color> kCardGradientColors = [Color(0xFF18367B), Color(0xFF7548CF)];
// const List<Color> kButtomGradientColors = [
//   Color(0xFF501794),
//   Color(0xFF3E70A1),
// ];
import 'package:flutter/material.dart';

// 1. الألوان الثابتة المطلوبة للـ Dark Theme
// ------------------------------------------------------------------

// اللون الأساسي الداكن للخلفية (Scaffold) ليتناسب مع الـ Dark Theme
// هذا اللون يمثل 'Black' Theme
const Color kScaffoldDarkColor = Color(0xFF100B20);

// اللون الأساسي للتطبيق (Primary Color) الذي سيستخدم في الـ Theme
// تم اختياره كأول لون في الـ Gradient ليكون لون هوية التطبيق
const Color kAppPrimaryColor = Color(0xFF5391ED);

// 2. تدرجات الألوان (الـ Gradients) التي طلبها المستخدم
// ------------------------------------------------------------------

const List<Color> kPrimaryGradientColors = [
  Color(0xFF5391ED),
  Color(0xFFC4B0FF),
];

const List<Color> kCardGradientColors = [Color(0xFF18367B), Color(0xFF7548CF)];

const List<Color> kButtomGradientColors = [
  Color(0xFF501794),
  Color(0xFF3E70A1),
];
