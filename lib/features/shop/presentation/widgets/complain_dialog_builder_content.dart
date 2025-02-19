import 'package:flutter/material.dart';
import 'package:soagmb/features/address/presentation/widgets/address_field.dart';
import 'package:soagmb/generated/l10n.dart';

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
              hintText: S.of(context).name,
              messageValidationName: S.of(context).name,
              keyboardType: TextInputType.name,
              textEditingController: nameController,
            ),
            const SizedBox(
              height: 8,
            ),
            AddressField(
              hintText: S.of(context).email,
              keyboardType: TextInputType.emailAddress,
              messageValidationName: S.of(context).email,
              textEditingController: emailController,
            ),
            const SizedBox(
              height: 8,
            ),
            AddressField(
              hintText: S.of(context).phone,
              keyboardType: TextInputType.phone,
              messageValidationName: S.of(context).phone,
              textEditingController: phoneController,
            ),
            const SizedBox(
              height: 8,
            ),
            AddressField(
              hintText: S.of(context).message,
              maxLine: 4,
              messageValidationName: S.of(context).message,
              textEditingController: messageController,
            ),
          ],
        ),
      ),
    );
  }
}
