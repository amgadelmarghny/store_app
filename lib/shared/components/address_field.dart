import 'package:flutter/material.dart';
import 'package:soagmb/shared/style/colors.dart';

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
    this.keyboardType,
  });
  final String? messageValidationName;
  final String? hintText;
  final int maxLine;
  final double width;
  final bool isRequired;
  final bool isOrderView;
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
            readOnly: isOrderView,
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
              hintText: hintText,
              focusedBorder: isRequired
                  ? const UnderlineInputBorder(
                      borderSide: BorderSide(color: defaultColor, width: 1.5),
                    )
                  : const OutlineInputBorder(
                      borderSide: BorderSide(color: defaultColor, width: 1.5),
                    ),
              enabledBorder: isRequired
                  ? UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).textTheme.bodyLarge!.color!,
                      ),
                    )
                  : OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).textTheme.bodyLarge!.color!,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
