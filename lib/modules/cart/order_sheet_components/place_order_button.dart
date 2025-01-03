import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:soagmb/shared/bloc/address_cubit/address_cubit.dart';
import 'package:soagmb/shared/components/custom_button.dart';
import 'package:soagmb/shared/components/custom_show_messages.dart';
import 'package:soagmb/shared/feature/checkout/data/models/payment_intent_input_model.dart';
import 'package:soagmb/shared/feature/checkout/data/presentation/manager/cubit/payment_cubit.dart';
// import 'package:soagmb/shared/network/local/api_keys.dart';
import 'package:soagmb/shared/network/local/shared_helper.dart';
import '../../../shared/network/local/key_const.dart';

class PlaceOrderButton extends StatelessWidget {
  const PlaceOrderButton({
    super.key,
    required this.addressState,
    this.amount,
  });

  final AddressState addressState;
  final dynamic amount;

  @override
  Widget build(BuildContext context) {
    AddressCubit addressCubit = BlocProvider.of<AddressCubit>(context);
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentFailur) {
          toastShown(
            message: 'The payment method has not been completed yet',
            state: ToastState.error,
            context: context,
          );
        }
        if (state is PaymentSuccess) {
          // TODO : write what UI action will u make after payment success
          addressCubit.addNewOrder(
            addressId: addressCubit.addressModel != null
                ? addressCubit.addressModel!.id
                : addressCubit.getAddressesModel!.data!.addressModelsList[0].id,
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
                addressId: addressCubit.addressModel != null
                    ? addressCubit.addressModel!.id
                    : addressCubit
                        .getAddressesModel!.data!.addressModelsList[0].id,
                paymentMethod: addressCubit.selectedValue,
                usePoints: false,
              );
            } //if not and the  payment method is credit card
            // then show a dialog to enter the pin code of the card
            else if (addressCubit.selectedValue == 2) {
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
              // that's mean the payment method is paypal
              // so user should be redirected to paypal site to make the payment
            } else {
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (BuildContext context) => PaypalCheckoutView(
              //       sandboxMode: true,
              //       clientId: ApiKeys.payPalClientId,
              //       secretKey: ApiKeys.payPalSecret,
              //       transactions: const [
              //         {
              //           "amount": {
              //             "total": "10",
              //             "currency": "USD",
              //             "details": {
              //               "subtotal": "100",
              //               "shipping": "0",
              //               "shipping_discount": 0
              //             }
              //           },
              //           "description": "The payment transaction description.",
              //           // "item_list": {
              //           //   "items": [
              //           //     {
              //           //       "name": "Apple",
              //           //       "quantity": 4,
              //           //       "price": "10",
              //           //       "currency": "USD"
              //           //     },
              //           //     {
              //           //       "name": "Pineapple",
              //           //       "quantity": 5,
              //           //       "price": "12",
              //           //       "currency": "USD"
              //           //     }
              //           //   ],
              //           // }
              //         }
              //       ],
              //       note: "Contact us for any questions on your order.",
              //       onSuccess: (Map params) async {
              //         print("onSuccess: $params");
              //         Navigator.pop(context);
              //       },
              //       onError: (error) {
              //         print("onError: $error");
              //         Navigator.pop(context);
              //       },
              //       onCancel: () {
              //         print('cancelled');
              //         Navigator.pop(context);
              //       },
              //     ),
              //   ),
              // );
            }
          },
        );
      },
    );
  }
}
