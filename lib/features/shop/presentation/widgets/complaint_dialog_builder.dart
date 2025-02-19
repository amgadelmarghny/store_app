import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:soagmb/features/shop/domain/entities/add_complaint_impl.dart';
import 'package:soagmb/features/shop/presentation/cubit/shop_cubit.dart';
import 'package:soagmb/features/shop/presentation/widgets/complain_dialog_builder_content.dart';
import 'package:soagmb/features/shop/presentation/widgets/complaint_response.dart';
import 'package:soagmb/features/shop/presentation/widgets/custom_show_messages.dart';
import 'package:soagmb/core/global/style/colors.dart';
import 'package:soagmb/core/global/style/themes.dart';
import 'package:soagmb/generated/l10n.dart';

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

    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
        ShopCubit cubit = ShopCubit.get(context);

        if (cubit.complaintModel!.status) {
          Navigator.pop(context);
          showDialog(
              context: context,
              builder: (context) {
                return const ComplaintResponse();
              });
        } else {
          toastShown(
              message: cubit.complaintModel!.message,
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
            title: Text(
              S.of(context).complaint,
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
                  AddComplaintImpl parameter = AddComplaintImpl(
                      name: nameController.text,
                      email: emailController.text,
                      phone: phoneController.text,
                      message: messageController.text);
                  onPress(context, parameter);
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

  void onPress(BuildContext context, AddComplaintImpl parameter) {
    if (formKey.currentState!.validate()) {
      BlocProvider.of<ShopCubit>(context).addComplaint(parameter: parameter);
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }
}
