import 'package:flutter/material.dart';
import 'package:soagmb/core/global/style/colors.dart';

class AddressField extends StatelessWidget {
  const AddressField({
    super.key,
    this.messageValidationName,
    this.hintText,
    this.maxLine = 1,
    this.width = double.infinity,
    this.isRequired = true,
    this.textEditingController,
    this.isOrderView = false,
    this.readOnly = false,
    this.keyboardType,
    this.label,
  });
  final String? messageValidationName;
  final String? label;
  final String? hintText;
  final int maxLine;
  final double width;
  final bool isRequired;
  final bool isOrderView;
  final bool readOnly;
  final TextEditingController? textEditingController;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Stack(
        children: [
          if (!isOrderView)
            if (isRequired)
              const Icon(
                Icons.star,
                color: Colors.red,
                size: 10.0,
              ),
          TextFormField(
          
            keyboardType: keyboardType,
            readOnly: readOnly,
            style: const TextStyle(fontSize: 18),
            cursorColor: defaultColor,
            maxLines: maxLine,
            controller: textEditingController,
            validator: !isOrderView
                ? isRequired
                    ? (value) {
                        if (value?.isEmpty ?? true) {
                          return '$messageValidationName' ' is required';
                        }
                        return null;
                      }
                    : null
                : null,
            decoration: InputDecoration(
            
              label: label != null ? Text(label!) : null,
              hintText: hintText,
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: defaultColor, width: 0),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: !isOrderView
                        ? Theme.of(context).textTheme.bodyLarge!.color!
                        : Theme.of(context).scaffoldBackgroundColor,
                    width: 0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
