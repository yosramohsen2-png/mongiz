import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mongiz/features/auth/auth_view_model.dart';
import 'package:mongiz/features/choice/widgets/background_choice_view.dart';
import 'package:mongiz/features/choice/widgets/custom_buttom.dart';
import 'package:mongiz/features/home/views/home_view.dart';
import 'package:mongiz/features/signup/widgets/custom_form_text_field.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
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
    return ChangeNotifierProvider(
      create: (_) => AuthViewModel(),
      child: Consumer<AuthViewModel>(
        builder: (context, authViewModel, child) {
          return Scaffold(
            backgroundColor: Colors.transparent,
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
                              'تسجيل الدخول',
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
                            const SizedBox(height: 40),
                            if (authViewModel.isLoading)
                              const CircularProgressIndicator()
                            else
                              CustomButtom(
                                text: 'تسجيل الدخول',
                                onTap: () async {
                                  if (_formKey.currentState!.validate()) {
                                    final email = _emailController.text.trim();
                                    final password = _passwordController.text.trim();

                                    debugPrint('Attempting Sign In with: $email');

                                    if (email.isEmpty || password.isEmpty) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(content: Text('الرجاء إدخال البيانات')),
                                      );
                                      return;
                                    }

                                    final success = await authViewModel.signIn(
                                      email,
                                      password,
                                    );
                                    
                                    if (success) {
                                      if (context.mounted) {
                                        Navigator.pushReplacementNamed(
                                          context,
                                          HomeView.routeName,
                                        );
                                      }
                                    } else {
                                      if (context.mounted) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                authViewModel.errorMessage ??
                                                    'فشل تسجيل الدخول'),
                                            backgroundColor: Colors.red,
                                          ),
                                        );
                                      }
                                    }
                                  }
                                },
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
        },
      ),
    );
  }
}
