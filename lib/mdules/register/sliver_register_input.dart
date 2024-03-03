import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/layout/shop/shop_view.dart';
import 'package:store_2/mdules/register/form_input.dart';
import 'package:store_2/shared/bloc/auth_cubit/auth_cubit.dart';
import 'package:store_2/shared/components/custom_show_messeges.dart';
import 'package:store_2/shared/components/navigation.dart';
import 'package:store_2/shared/network/lockal/key_const.dart';
import 'package:store_2/shared/network/lockal/shared_helper.dart';

class SliverRegisterInfo extends StatelessWidget {
  const SliverRegisterInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) async {
        if (state is RegisterFailureState) {
          snacKBar(context, state.err);
        }
        if (state is RegisterSuccessState) {
          if (state.registermodel.status) {
            await CashHelper.setData(
                    key: tOKENCONST, value: state.registermodel.data!.token)
                .then(
              (value) {
                toastShown(
                  messege: state.registermodel.message,
                  state: ToastState.success,
                  context: context,
                );
                navigatorPushAndRemove(
                  context,
                  ShopView.id,
                );
              },
            );
          } else {
            toastShown(
              messege: state.registermodel.message,
              state: ToastState.error,
              context: context,
            );
          }
        }
      },
      builder: (context, state) {
        return SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 5,
              left: 20,
              right: 20,
            ),
            child: registerFormInput(formKey, context, state),
          ),
        );
      },
    );
  }
}
