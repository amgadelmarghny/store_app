import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:soagmb/layout/shop/drawer_components/complaint_components/complain_dialog_builder_content.dart';
import 'package:soagmb/layout/shop/drawer_components/complaint_components/complaint_response.dart';
import 'package:soagmb/shared/bloc/app_cubit/app_cubit.dart';
import 'package:soagmb/shared/components/custom_show_messages.dart';
import 'package:soagmb/core/global/style/colors.dart';
import 'package:soagmb/core/global/style/themes.dart';

class ComplaintDialogBuilder extends StatefulWidget {
  const ComplaintDialogBuilder({
    super.key,
  });

  @override
  State<ComplaintDialogBuilder> createState() => _ComplaintDialogBuilderState();
}

class _ComplaintDialogBuilderState extends State<ComplaintDialogBuilder> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController messageController = TextEditingController();

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (BlocProvider.of<AppCubit>(context).complaintModel!.status) {
          Navigator.pop(context);
          showDialog(
              context: context,
              builder: (context) {
                return const ComplaintResponse();
              });
        } else {
          toastShown(
              message:
                  BlocProvider.of<AppCubit>(context).complaintModel!.message,
              state: ToastState.error,
              context: context);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is AddComplainLoading,
          child: AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            actionsPadding: const EdgeInsets.only(right: 25, bottom: 10),
            contentPadding: const EdgeInsets.all(25),
            iconPadding: const EdgeInsets.all(0),
            title: const Text(
              'Complaint',
              style: TextStyle(fontSize: 22),
            ),
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
            content: ComplaintDialogContent(
              nameController: nameController,
              emailController: emailController,
              phoneController: phoneController,
              messageController: messageController,
              autovalidateMode: autovalidateMode,
              formKey: formKey,
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  onPress(
                    context,
                    nameController,
                    emailController,
                    phoneController,
                    messageController,
                  );
                },
                child: Text(
                  'Send',
                  style: TextStyle(
                      fontSize: getResponsiveFontSize(fontSize: 18),
                      color: defaultColor),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void onPress(
      BuildContext context,
      TextEditingController nameController,
      TextEditingController emailController,
      TextEditingController phoneController,
      TextEditingController messageController) {
    if (formKey.currentState!.validate()) {
      BlocProvider.of<AppCubit>(context).addComplaint(
          name: nameController.text,
          email: emailController.text,
          phone: phoneController.text,
          message: messageController.text);
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }
}
