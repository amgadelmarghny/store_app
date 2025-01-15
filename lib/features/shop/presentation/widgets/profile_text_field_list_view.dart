import 'package:flutter/material.dart';
import 'package:soagmb/models/user_model.dart';
import 'package:soagmb/features/shop/presentation/widgets/text_form_field.dart';

class ProfileTextFieldListView extends StatelessWidget {
  const ProfileTextFieldListView({super.key, required this.userData});
  final UserModel userData;

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    nameController.text = userData.name!;
    emailController.text = userData.email!;
    phoneController.text = userData.phone!;

    final List<CustomTextField> profileTextFieldList = [
      CustomTextField(
        isFirstDesign: false,
        controller: nameController,
        textInputType: TextInputType.name,
      ),
      CustomTextField(
        isFirstDesign: false,
        controller: emailController,
        textInputType: TextInputType.emailAddress,
      ),
      CustomTextField(
        isFirstDesign: false,
        controller: phoneController,
        textInputType: TextInputType.phone,
      ),
    ];
    return SliverList.separated(
      itemCount: profileTextFieldList.length,
      itemBuilder: (context, index) => CustomTextField(
        isFirstDesign: profileTextFieldList[index].isFirstDesign,
        controller: profileTextFieldList[index].controller,
        textInputType: profileTextFieldList[index].textInputType,
      ),
      separatorBuilder: (context, index) => SizedBox(
        height: 30,
      ),
    );
  }
}
