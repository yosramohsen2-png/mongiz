import 'package:flutter/material.dart';
import 'package:mongiz/features/signin/widgets/signin_view_body.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});
  static const String routeName = 'signinView';
  @override
  Widget build(BuildContext context) {
    return SigninViewBody();
  }
}
