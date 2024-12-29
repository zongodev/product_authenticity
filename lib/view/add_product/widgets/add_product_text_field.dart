import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
class AddProductTextField extends StatelessWidget {
  final String textFieldName;
  final Widget iconPath;
  final TextEditingController controller ;
  final String? Function(String?)? validator;
  const AddProductTextField({
    super.key, required this.textFieldName, required this.iconPath, required this.controller,required this.validator
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        validator: validator,
        maxLines: null,
        keyboardType: TextInputType.multiline,
        controller: controller,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  color: Color(0xff949494), width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
              BorderSide(color: headerColor, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            label: Text(textFieldName),
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            prefixIcon:  Padding(
              padding: const EdgeInsets.all(8.0),
              child: iconPath,
            ),
        ),
      ),
    );
  }
}