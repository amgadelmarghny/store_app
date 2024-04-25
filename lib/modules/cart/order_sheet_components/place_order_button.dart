import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/shared/bloc/address_cubit/address_cubit.dart';
import 'package:store_2/shared/components/custom_buttomt.dart';
import 'package:store_2/shared/components/custom_show_messeges.dart';
import 'package:store_2/shared/feature/checkout/data/models/payment_intent_input_model.dart';
import 'package:store_2/shared/feature/checkout/data/presentation/manager/cubit/payment_cubit.dart';
import 'package:store_2/shared/network/local/shared_helper.dart';

import '../../../shared/network/local/key_const.dart';

class PlaceOrderButton extends StatelessWidget {
  const PlaceOrderButton({
    super.key,
    required this.addressCubit,
    required this.addressState,
    this.amount,
  });

  final AddressCubit addressCubit;
  final AddressState addressState;
  final dynamic amount;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentFailur) {
          toastShown(
            messege: 'The payment method has not been completed yet',
            state: ToastState.error,
            context: context,
          );
        }
        if (state is PaymentSuccess) {
          // TODO : write what UI action will u make after payment success
          addressCubit.addNewOrder(
            addressId:
                BlocProvider.of<AddressCubit>(context).addressModel != null
                    ? BlocProvider.of<AddressCubit>(context).addressModel!.id
                    : BlocProvider.of<AddressCubit>(context)
                        .getAddressesModel!
                        .data!
                        .addressModelsList[0]
                        .id,
            paymentMethod: addressCubit.selectedValue,
            usePoints: false,
          );
        }
      },
      builder: (context, state) {
        return CustomButton(
          text: 'Place Order',
          isLoading: addressState is AddOrderLoading || state is PaymentLoading,
          onTap: () {
            // if the payment method is cash  on delivery
            //then the  user can place order directly
            if (addressCubit.selectedValue == 1) {
              addressCubit.addNewOrder(
                addressId:
                    BlocProvider.of<AddressCubit>(context).addressModel != null
                        ? BlocProvider.of<AddressCubit>(context)
                            .addressModel!
                            .id
                        : BlocProvider.of<AddressCubit>(context)
                            .getAddressesModel!
                            .data!
                            .addressModelsList[0]
                            .id,
                paymentMethod: addressCubit.selectedValue,
                usePoints: false,
              );
            } //if not and the  payment method is credit card or paypal
            // then show a dialog to enter the pin code of the card
            else {
              int totalAmount = amount * 100;
              PaymentIntentInputModel paymentIntentInputModel =
                  PaymentIntentInputModel(
                currency: 'EGP',
                amount: '$totalAmount',
                customerId: CashHelper.getData(key: customerID),
              );
              BlocProvider.of<PaymentCubit>(context).makePayment(
                paymentIntentInputModel: paymentIntentInputModel,
              );
            }
          },
        );
      },
    );
  }
}
