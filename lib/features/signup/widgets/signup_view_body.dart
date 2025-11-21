import 'package:flutter/material.dart';
import 'package:mongiz/features/choice/widgets/background_choice_view.dart';
import 'package:mongiz/features/choice/widgets/custom_buttom.dart';
import 'package:mongiz/features/home/views/home_view.dart';
import 'custom_form_text_field.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // مهم جداً
      body: BackgroundChoiceView(
        content: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'تسجيل حساب جديد',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OmarBold',
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 90),

                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomFormTextField(
                        labelText: 'البريد الإلكترونى',
                        controller: _emailController,
                      ),

                      const SizedBox(height: 20),

                      CustomFormTextField(
                        labelText: 'كلمة المرور',
                        controller: _passwordController,
                        obscureText: true,
                      ),
                      SizedBox(height: 40),
                      CustomButtom(
                        text: 'تسجيل الدخول',
                        onTap: () => Navigator.pushReplacementNamed(
                          context,
                          HomeView.routeName,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
