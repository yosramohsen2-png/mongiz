// // import 'package:flutter/material.dart';
// // import 'package:mongiz/constans.dart';

// // class CustomAppBar extends StatelessWidget {
// //   const CustomAppBar({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       width: double.infinity,
// //       height: 80,
// //       decoration: BoxDecoration(
// //         borderRadius: BorderRadius.only(
// //           bottomLeft: Radius.circular(40),
// //           bottomRight: Radius.circular(40),
// //         ),
// //         gradient: LinearGradient(
// //           colors: kBackgroundChoice,
// //           begin: Alignment.centerLeft, // بالعرض: الغامق شمال
// //           end: Alignment.centerRight,
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:mongiz/constans.dart'; // اتأكدي من المسار ده

// class CustomAppBar extends StatelessWidget {
//   final String? title;
//   final Widget? centerWidget; // ده الجديد: عشان تحطي صورة أو أي ودجت تانية
//   final IconData? icon;
//   final VoidCallback? onIconTap;

//   const CustomAppBar({
//     super.key,
//     this.title,
//     this.centerWidget, // نستقبله هنا
//     this.icon,
//     this.onIconTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 95,
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       decoration: BoxDecoration(
//         borderRadius: const BorderRadius.only(
//           bottomLeft: Radius.circular(40),
//           bottomRight: Radius.circular(40),
//         ),
//         gradient: LinearGradient(
//           colors: kBackgroundChoice, // تأكدي ان المتغير ده معرف عندك
//           begin: Alignment.centerLeft,
//           end: Alignment.centerRight,
//         ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           // LEFT ICON
//           GestureDetector(
//             onTap: onIconTap ?? () => Navigator.of(context).pop(),
//             child: Icon(
//               icon ?? Icons.arrow_back,
//               color: Colors.white,
//               size: 28,
//             ),
//           ),

//           // CENTER CONTENT (ANIMATED)
//           Expanded(
//             child: Center(
//               // الأنيميشن هنا
//               child: TweenAnimationBuilder<double>(
//                 tween: Tween(begin: 0.0, end: 1.0), // يبدأ مخفي ويظهر
//                 duration: const Duration(
//                   milliseconds: 800,
//                 ), // مدة الأنيميشن (متوسط)
//                 curve:
//                     Curves.easeOutBack, // شكل الحركة (فيها نطة خفيفة في الآخر)
//                 builder: (context, value, child) {
//                   return Transform.scale(
//                     scale: value, // يكبر
//                     child: Opacity(
//                       opacity: value, // يظهر
//                       child: child,
//                     ),
//                   );
//                 },
//                 // الأولوية للـ centerWidget (الصورة)، لو مش موجودة يعرض الـ title
//                 child:
//                     centerWidget ??
//                     Text(
//                       title ?? "",
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//               ),
//             ),
//           ),

//           // RIGHT SPACER
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:mongiz/constans.dart';

class CustomAppBar extends StatelessWidget {
  final String? title;
  final Widget? centerWidget;
  final IconData? icon;
  final VoidCallback? onIconTap;
  final bool showIcon; // 1. ضفنا المتغير ده عشان نتحكم في الظهور

  const CustomAppBar({
    super.key,
    this.title,
    this.centerWidget,
    this.icon,
    this.onIconTap,
    this.showIcon =
        true, // 2. القيمة الافتراضية true عشان يظهر في كل الصفحات عادي
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 95,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
        gradient: LinearGradient(
          colors: kBackgroundChoice,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // LEFT ICON AREA
          // 3. هنا بنسأل: لو showIcon بـ true اظهر الايقون، غير كدا حط مكان فاضي
          if (showIcon)
            GestureDetector(
              onTap: onIconTap ?? () => Navigator.of(context).pop(),
              child: Icon(
                icon ?? Icons.arrow_back,
                color: Colors.white,
                size: 28,
              ),
            )
          else
            // بنحط بوكس فاضي بنفس حجم الايقون عشان نضمن ان العنوان يفضل في النص بالظبط
            const SizedBox(width: 28),

          // CENTER CONTENT (ANIMATED)
          Expanded(
            child: Center(
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeOutBack,
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: value,
                    child: Opacity(opacity: value, child: child),
                  );
                },
                child:
                    centerWidget ??
                    Text(
                      title ?? "",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              ),
            ),
          ),

          // RIGHT SPACER (عشان السنترة تكون مظبوطة 100% قصاد الايقونة الشمال)
          const SizedBox(width: 28),
        ],
      ),
    );
  }
}
