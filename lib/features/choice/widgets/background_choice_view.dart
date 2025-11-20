// import 'package:flutter/material.dart';
// import 'package:mongiz/core/utils/assets.dart';
// import 'package:mongiz/features/splash/presentation/widgets/reusable_glow_image.dart';

// const List<Color> kBackgroundChoice = [Color(0xFF18367B), Color(0xFF7548CF)];

// class BackgroundChoiceView extends StatelessWidget {
//   // 💡 المتغير الجديد لاستقبال المحتوى
//   final Widget? content;

//   const BackgroundChoiceView({super.key, this.content});

//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     // الجزء السفلي هيبدأ من 35% من ارتفاع الشاشة
//     final containerTop = screenHeight * 35 / 100;

//     return Stack(
//       fit: StackFit.expand,
//       children: [
//         // 1. الخلفية الأساسية
//         Image.asset(AssetsData.backGround, fit: BoxFit.cover),

//         // 2. العناصر المتحركة (رائد الفضاء، الجوهرة)
//         Positioned(
//           top: 200,
//           left: 90,
//           child: Image.asset(AssetsData.astronautSmall),
//         ),
//         Positioned(
//           top: 220,
//           left: 205,
//           child: ReusableGlowImage(
//             imagePath: AssetsData.diamondSmall,
//             size: 30,
//           ),
//         ),

//         // 3. الكونتينر اللي فيه الجريديانت (القاعدة السفلية)
//         Positioned(
//           top: containerTop, // يبدأ من النقطة دي
//           bottom: 0,
//           left: 0,
//           right: 0,
//           child: Container(
//             decoration: const BoxDecoration(
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(40),
//                 topRight: Radius.circular(40),
//               ),
//               gradient: LinearGradient(
//                 colors: kBackgroundChoice,
//                 begin: Alignment.centerLeft,
//                 end: Alignment.centerRight,
//               ),
//             ),
//             child: Stack(
//               fit: StackFit.expand,
//               children: [
//                 // 1. الصورة الثابتة الأولى (كوكب صغير كمثال)
//                 Positioned(
//                   bottom: -20, // خارج الحدود شوية
//                   right: -20,
//                   // ⚠️ يجب التأكد من وجود AssetsData.planetSmall في ملف الأصول
//                   child: Image.asset(AssetsData.diamondbg, height: 100),
//                 ),

//                 // 2. الصورة الثابتة الثانية (نجم أو عنصر زخرفي آخر)
//                 Positioned(
//                   top: 50,
//                   left: 50,
//                   // ⚠️ يجب التأكد من وجود AssetsData.starBig في ملف الأصول
//                   child: Image.asset(AssetsData.cloud, height: 60),
//                 ),
//               ],
//             ),
//           ),

//         // 4. المحتوى اللي جاي من بره (content)
//         // بنحطه جوه Positioned عشان يتحط في مكان معين فوق الكونتينر
//         if (content != null)
//           Positioned(
//             // ممكن تظبط الـtop/bottom/left/right حسب المحتوى بتاعك
//             // هنا أنا بخليه يبدأ من نفس النقطة اللي بيبدأ منها الكونتينر
//             top: containerTop,
//             bottom: 0,
//             left: 0,
//             right: 0,
//             // ممكن نستخدم Padding أو Align جوه عشان نظبط مكان الـcontent
//             child: content!,
//           ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:mongiz/core/utils/assets.dart';
import 'package:mongiz/features/splash/presentation/widgets/reusable_glow_image.dart';

// تعريف الثوابت
const List<Color> kBackgroundChoice = [Color(0xFF18367B), Color(0xFF7548CF)];

class BackgroundChoiceView extends StatelessWidget {
  // 💡 المتغير الجديد لاستقبال المحتوى
  final Widget? content;

  const BackgroundChoiceView({super.key, this.content});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    // الجزء السفلي هيبدأ من 35% من ارتفاع الشاشة (تم الحفاظ على القيمة اللي تم تحديدها مؤخراً)
    final containerTop = screenHeight * 35 / 100;

    return Stack(
      fit: StackFit.expand,
      children: [
        // 1. الخلفية الأساسية (صورة تملأ الشاشة)
        Image.asset(AssetsData.backGround, fit: BoxFit.cover),

        // 2. العناصر الثابتة في الجزء العلوي (رائد الفضاء، الجوهرة)
        Positioned(
          top: 200,
          left: 90,
          child: Image.asset(AssetsData.astronautSmall),
        ),
        Positioned(
          top: 220,
          left: 205,
          child: ReusableGlowImage(
            imagePath: AssetsData.diamondSmall,
            size: 30,
          ),
        ),

        // 🎯 3. الكونتينر اللي فيه الجريديانت (القاعدة السفلية)
        Positioned(
          top: containerTop, // يبدأ من النقطة المحددة
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              gradient: LinearGradient(
                colors: kBackgroundChoice,
                begin: Alignment.centerLeft, // بالعرض: الغامق شمال
                end: Alignment.centerRight, // بالعرض: الفاتح يمين
              ),
            ),

            // 💡 المحتوى: نستخدم Stack داخلي لترتيب الصور الثابتة والمحتوى القادم
            child: Stack(
              fit: StackFit.expand,
              children: [
                // 1. الصورة الثابتة الأولى (كوكب صغير كمثال)
                Positioned(
                  bottom: -20, // خارج الحدود شوية
                  right: -20,
                  // تم تعديل AssetsData.planetSmall إلى AssetsData.diamondbg حسب آخر تعديل عندك
                  child: Image.asset(AssetsData.diamondbg, height: 100),
                ),

                // 2. الصورة الثابتة الثانية (نجم أو عنصر زخرفي آخر)
                Positioned(
                  top: 50,
                  left: 50,
                  // تم تعديل AssetsData.starBig إلى AssetsData.cloud حسب آخر تعديل عندك
                  child: Image.asset(AssetsData.cloud, height: 60),
                ),

                // 3. المحتوى الأساسي القادم من بره (content)
                // المحتوى ده هيتحط فوق كل العناصر اللي قبله
                // 🛑 تم نقل هذا الجزء إلى هنا ليعمل الـ Composition بشكل صحيح.
                if (content != null) content!,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
