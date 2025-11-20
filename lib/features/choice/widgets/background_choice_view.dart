import 'package:flutter/material.dart';
import 'package:mongiz/constans.dart';
import 'package:mongiz/core/utils/assets.dart';
import 'package:mongiz/features/splash/presentation/widgets/reusable_glow_image.dart';

// تعريف الثوابت

class BackgroundChoiceView extends StatelessWidget {
  final Widget? content;

  const BackgroundChoiceView({super.key, this.content});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final containerTop = screenHeight * 35 / 100;

    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(AssetsData.backGround, fit: BoxFit.cover),

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
                  child: Image.asset(AssetsData.bronze, height: 100),
                ),

                // 2. الصورة الثابتة الثانية (نجم أو عنصر زخرفي آخر)
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  // تم تعديل AssetsData.starBig إلى AssetsData.cloud حسب آخر تعديل عندك
                  child: Image.asset(AssetsData.cloud, fit: BoxFit.fitWidth),
                ),
                Positioned(
                  bottom: 250,
                  right: 0,
                  left: 0,
                  // تم تعديل AssetsData.starBig إلى AssetsData.cloud حسب آخر تعديل عندك
                  child: Image.asset(
                    AssetsData.diamondbg,
                    fit: BoxFit.fitWidth,
                  ),
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
