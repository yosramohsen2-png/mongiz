import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final bool obscureText;

  const CustomFormTextField({
    super.key,
    required this.labelText,
    required this.controller,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Directionality(
        // 🔥 أهم خطوة لعرض الكلام عربي صح
        textDirection: TextDirection.rtl,
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          textAlign: TextAlign.right, // 🔥 النص جوّا الفيلد ييجي يمين
          style: const TextStyle(color: Colors.black),

          onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),

          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'هذا الحقل مطلوب';
            }
            return null;
          },

          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: const TextStyle(color: Colors.grey),

            filled: true,
            fillColor: Colors.white,

            contentPadding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 20,
            ),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey),
            ),
          ),
        ),
      ),
    );
  }
}
