import 'package:flutter/material.dart';

class AddressField extends StatelessWidget {
  const AddressField({super.key, required this.messageValidationName, this.hintText});
  final String messageValidationName;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return '$messageValidationName' 'is required';
        }
        return null;
      },
      decoration: InputDecoration(
        
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        hintText: hintText,
        labelStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
