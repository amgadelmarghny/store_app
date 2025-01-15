import 'package:flutter/material.dart';

class ChangePasswordField extends StatelessWidget {
  const ChangePasswordField({
    super.key,
    required this.validationMessage,
    required this.prefixIcon,
    required this.hintText,
    required this.textInputControl,
  });
  final String validationMessage;
  final IconData prefixIcon;
  final String hintText;
  final TextEditingController textInputControl;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Please enter your $validationMessage";
        }
        return null;
      },
      controller: textInputControl,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 0.3),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 0.3),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(width: 0.3),
        ),
        hintText: hintText,
      ),
    );
  }
}
