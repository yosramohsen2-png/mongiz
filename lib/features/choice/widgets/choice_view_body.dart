import 'package:flutter/material.dart';
import 'package:mongiz/core/utils/assets.dart';
import 'package:mongiz/features/choice/widgets/background_choice_view.dart';
import 'package:mongiz/features/choice/widgets/custom_buttom.dart';
import 'package:mongiz/features/signin/views/signin_view.dart';
import 'package:mongiz/features/signup/views/signup_view.dart';

class ChoiceViewBody extends StatelessWidget {
  const ChoiceViewBody({super.key});
  static const String routeName = 'choiceViewBody';
  @override
  Widget build(BuildContext context) {
    return BackgroundChoiceView(
      content: Column(
        mainAxisSize: MainAxisSize.min,

        children: [
          SizedBox(height: 60),
          Image.asset(AssetsData.logoBig, height: 100),
          SizedBox(height: 45),
          CustomButtom(
            text: 'تسجيل الدخول',
            onTap: () => Navigator.of(context).pushNamed(SigninView.routeName),
          ),
          SizedBox(height: 30),
          CustomButtom(
            text: 'حساب جديد',
            onTap: () => Navigator.of(context).pushNamed(SignupView.routeName),
          ),
        ],
      ),
    );
  }
}
