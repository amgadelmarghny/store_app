import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hintText, this.onChange, this.inputType});
 final String hintText;
  final TextInputType? inputType;
 final Function(String)? onChange;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      onChanged: onChange,
      validator: (data) {
        if (data!.isEmpty) {
          return 'field is empty';
        }
        return null;
      },
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 25, horizontal: 14),
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(9)),
      ),
    );
  }
}
