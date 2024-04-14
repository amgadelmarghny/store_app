import 'package:flutter/material.dart';
import 'package:store_2/shared/components/address_feild.dart';

class ComplaintDialogBuilder extends StatelessWidget {
  const ComplaintDialogBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController messageController = TextEditingController();

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      actionsPadding: const EdgeInsets.all(0),
      contentPadding: const EdgeInsets.all(25),
      iconPadding: const EdgeInsets.all(0),
      title: const Text('Complaint'),
      icon: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      content: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            AddressField(
              hintText: 'name',
              messageValidationName: 'name',
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
      actions: [
        TextButton(
            onPressed: () {},
            child: const Text(
              'Send',
              style: TextStyle(fontSize: 20, color: Colors.teal),
            ))
      ],
    );
  }
}
