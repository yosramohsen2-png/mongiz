import 'package:flutter/material.dart';
import 'package:mongiz/constans.dart';

class CustomHomeContainer extends StatelessWidget {
  final String title;
  final String iconPath;
  final VoidCallback onTap;

  const CustomHomeContainer({
    super.key,
    required this.title,
    required this.iconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: kBackgroundChoice,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50),
            bottomRight: Radius.circular(0),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(0),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF7548CF).withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily:
                    'OmarBold', // Assuming Cairo or similar font is used
              ),
            ),
            const SizedBox(width: 20),
            Image.asset(iconPath, height: 40),
          ],
        ),
      ),
    );
  }
}

//     return Container(
//       width: 300,
//       height: 70,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(40),
//           bottomRight: Radius.circular(40),
//         ),
//         gradient: LinearGradient(
//           colors: kBackgroundChoice,
//           begin: Alignment.centerLeft, // بالعرض: الغامق شمال
//           end: Alignment.centerRight,
//         ),
//       ),
//     );
//   }
// }
