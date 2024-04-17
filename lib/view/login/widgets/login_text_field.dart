import 'package:flutter/material.dart';
class LoginTextField extends StatelessWidget {
  const LoginTextField({
    super.key, required this.controller, required this.isPassword,
  });
  final TextEditingController controller ;
  final bool isPassword ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
              color: Color(0xffD0D5DD), width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Color(0xffD0D5DD), width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: !isPassword?"user@example.com":"Password",
      ),
    );
  }
}