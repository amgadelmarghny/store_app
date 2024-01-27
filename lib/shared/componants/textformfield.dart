import 'package:flutter/material.dart';
import 'package:store_2/shared/style/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.onChange,
    this.obscureText = false,
    required this.hintText,
    required this.textInputType,
    this.suffixIcon,
    this.suffixOnPressed,
    this.prefixIcon,
  });
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final TextInputType textInputType;
  final bool obscureText;
  final String hintText;
  final void Function(String) onChange;
  final Function()? suffixOnPressed;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      keyboardType: textInputType,
      obscureText: obscureText,
      validator: (data) {
        if (data!.isEmpty) {
          return 'FIELD IS EMPTY';
        }
        return null;
      },
      onChanged: onChange,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        suffixIcon: suffixIcon != null
            ? IconButton(
                onPressed: suffixOnPressed,
                icon: Icon(
                  suffixIcon,
                  size: 30,
                ),
              )
            : null,
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
              )
            : null,
        hintText: hintText,
        labelText: hintText,
        labelStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: defaultColor, width: 1.5),
          borderRadius: BorderRadius.circular(30),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
