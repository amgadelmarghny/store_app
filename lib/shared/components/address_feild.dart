import 'package:flutter/material.dart';
import 'package:store_2/shared/style/colors.dart';

class AddressField extends StatelessWidget {
  const AddressField(
      {super.key,
      required this.messageValidationName,
      this.hintText,
      this.maxLine = 1,
      this.width = double.infinity,
      this.isRequired = true,
      required this.textEditingController});
  final String messageValidationName;
  final String? hintText;
  final int maxLine;
  final double width;
  final bool isRequired;
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Stack(
        children: [
          if (isRequired)
            const Icon(
              Icons.star,
              color: Colors.red,
              size: 10.0,
            ),
          TextFormField(
            style: const TextStyle(fontSize: 18),
            cursorColor: defaultColor,
            maxLines: maxLine,
            controller: textEditingController,
            validator: isRequired
                ? (value) {
                    if (value?.isEmpty ?? true) {
                      return '$messageValidationName' ' is required';
                    }
                    return null;
                  }
                : null,
            decoration: InputDecoration(
              hintText: hintText,
              focusedBorder: isRequired
                  ? const UnderlineInputBorder(
                      borderSide: BorderSide(color: defaultColor, width: 1.5),
                    )
                  : const OutlineInputBorder(
                      borderSide: BorderSide(color: defaultColor, width: 1.5),
                    ),
              enabledBorder: isRequired
                  ? const UnderlineInputBorder(
                      borderSide: BorderSide(),
                    )
                  : const OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
