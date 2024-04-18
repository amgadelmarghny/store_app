import 'package:flutter/material.dart';
import 'package:store_2/shared/components/address_feild.dart';

class ComplaintDialogContent extends StatelessWidget {
  const ComplaintDialogContent({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.messageController,
    required this.autovalidateMode,
    required this.formKey,
  });
  final AutovalidateMode autovalidateMode;
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController messageController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            AddressField(
              hintText: 'name',
              messageValidationName: 'name',
              keyboardType: TextInputType.name,
              textEditingController: nameController,
            ),
            const SizedBox(
              height: 8,
            ),
            AddressField(
              hintText: 'email',
              messageValidationName: 'email',
              textEditingController: emailController,
            ),
            const SizedBox(
              height: 8,
            ),
            AddressField(
              hintText: 'phone number',
              keyboardType: TextInputType.phone,
              messageValidationName: 'phone number',
              textEditingController: phoneController,
            ),
            const SizedBox(
              height: 8,
            ),
            AddressField(
              hintText: 'message',
              maxLine: 4,
              messageValidationName: 'message',
              textEditingController: messageController,
            ),
          ],
        ),
      ),
    );
  }
}
