import 'package:flutter/material.dart';
import 'package:mongiz/features/choice/widgets/choice_view_body.dart';

class ChoiceView extends StatelessWidget {
  const ChoiceView({super.key});
  static const String routeName = '/choiceView';
  @override
  Widget build(BuildContext context) {
    return ChoiceViewBody();
  }
}
