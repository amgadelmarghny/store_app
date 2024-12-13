import 'package:flutter/material.dart';
import 'package:soagmb/shared/style/colors.dart';
import 'package:soagmb/shared/style/themes.dart';

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
    this.onFieldSubmitted,
    this.radius = 30,
    this.focusNode,
  });
  // first design that switch between to design
  // the first design  is for sign in & sign up page
  // and second one is for profile view
  final bool isFirstDesign;
  final TextEditingController? controller;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final TextInputType? textInputType;
  final bool obscureText;
  final String? hintText;
  final void Function(String)? onChange;
  final void Function(String)? onFieldSubmitted;
  final Function()? suffixOnPressed;
  final String? labelText;
  final double radius;
  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: !isFirstDesign
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.2),
                  blurRadius: 10,
                  spreadRadius: 7,
                ),
              ],
            )
          : null,
      child: TextFormField(
        focusNode: focusNode,
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
        onFieldSubmitted: onFieldSubmitted,
        decoration: InputDecoration(
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
          labelStyle: TextStyle(
            fontSize: getResponsiveFontSize(fontSize: 18),
            fontWeight: FontWeight.w500,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
                color: isFirstDesign
                    ? Theme.of(context).textTheme.bodyLarge!.color!
                    : Theme.of(context).scaffoldBackgroundColor,
                width: 0.7),
          ),
          focusedBorder: isFirstDesign
              ? OutlineInputBorder(
                  borderSide: const BorderSide(color: defaultColor, width: 0.7),
                  borderRadius: BorderRadius.circular(radius),
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
                color: isFirstDesign
                    ? Theme.of(context).textTheme.bodyLarge!.color!
                    : Theme.of(context).scaffoldBackgroundColor,
                width: 0.7),
          ),
        ),
      ),
    );
  }
}
