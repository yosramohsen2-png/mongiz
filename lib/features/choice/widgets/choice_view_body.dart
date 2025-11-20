import 'package:flutter/material.dart';
import 'package:mongiz/features/choice/widgets/background_choice_view.dart';

class ChoiceViewBody extends StatelessWidget {
  const ChoiceViewBody({super.key});
  static const String routeName = 'choiceViewBody';
  @override
  Widget build(BuildContext context) {
    return BackgroundChoiceView();
  }
}
