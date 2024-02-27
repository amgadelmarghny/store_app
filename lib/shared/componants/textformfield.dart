import 'package:flutter/material.dart';
import 'package:store_2/shared/style/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.onChange,
    this.obscureText = false,
    this.hintText,
    this.textInputType,
    this.suffixIcon,
    this.suffixOnPressed,
    this.prefixIcon,
    this.labelText,
    this.controller,
    this.isFirstDesign = true,
  });
  // first design that switch detween to design
  final bool isFirstDesign;
  final TextEditingController? controller;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final TextInputType? textInputType;
  final bool obscureText;
  final String? hintText;
  final void Function(String)? onChange;
  final Function()? suffixOnPressed;
  final String? labelText;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: !isFirstDesign
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 10,
                  spreadRadius: 7,
                ),
              ],
            )
          : null,
      child: TextFormField(
        readOnly: isFirstDesign ? false : true,
        maxLines: 1,
        keyboardType: textInputType,
        obscureText: obscureText,
        validator: (data) {
          if (data!.isEmpty) {
            return 'FIELD IS EMPTY';
          }
          return null;
        },
        controller: controller,
        onChanged: onChange,
        decoration: InputDecoration(
          fillColor: defaultColor.withOpacity(0.1),
          filled: isFirstDesign,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          suffixIcon: suffixIcon != null
              ? IconButton(
                  onPressed: suffixOnPressed,
                  icon: Icon(
                    suffixIcon,
                  ),
                )
              : null,
          prefixIcon: prefixIcon != null
              ? Icon(
                  prefixIcon,
                )
              : null,
          hintText: hintText,
          labelText: labelText,
          labelStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: isFirstDesign
                  ? const Color(0xFF000000)
                  : Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
          focusedBorder: isFirstDesign
              ? OutlineInputBorder(
                  borderSide: const BorderSide(color: defaultColor, width: 1.1),
                  borderRadius: BorderRadius.circular(30),
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: isFirstDesign
                  ? const Color(0xFF000000)
                  : Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
        ),
      ),
    );
  }
}
