import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/core/network/local/api_keys.dart';
import 'package:soagmb/features/address/presentation/cubit/address_cubit.dart';
import 'package:soagmb/features/checkout/presentation/manager/cubit/payment_cubit.dart';
import 'package:soagmb/features/order/data/models/add_new_order__parameter.dart';
import 'package:soagmb/features/order/presentation/cubit/order_cubit.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:soagmb/features/shop/presentation/widgets/custom_button.dart';
import 'package:soagmb/features/shop/presentation/widgets/custom_show_messages.dart';
import 'package:soagmb/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:soagmb/core/network/local/shared_helper.dart';
import 'package:soagmb/generated/l10n.dart';
import '../../../../core/network/local/key_const.dart';

class PlaceOrderButton extends StatelessWidget {
  const PlaceOrderButton({
    super.key,
    this.amount,
  });

  final dynamic amount;

  @override
  Widget build(BuildContext context) {
    AddressCubit addressCubit = AddressCubit.get(context);
    OrderCubit orderCubit = OrderCubit.get(context);
    return BlocListener<PaymentCubit, PaymentState>(
      listener: (context, state) async {
        if (state is PaymentFailur) {
          toastShown(
            message:
                S.of(context).the_payment_method_has_not_been_completed_yet,
            state: ToastState.error,
            context: context,
          );
        }
        if (state is PaymentSuccess) {
          // TODO : write what UI action will u make after payment success
          await addNewOrderMethod(addressCubit, orderCubit);
        }
      },
      child: BlocBuilder<PaymentCubit, PaymentState>(
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is PaymentLoading ? true : false,
            child: CustomButton(
              text: 'Place Order',
              dutrationTime: 0,
              isLoading: state is PaymentLoading || state is AddOrderLoading,
              onTap: () async {
                // if the payment method is cash  on delivery
                //then the  user can place order directly
                if (addressCubit.selectedValue == 1) {
                  await addNewOrderMethod(addressCubit, orderCubit);
                } //if not and the  payment method is credit card
                // then show a dialog to enter the pin code of the card
                else if (addressCubit.selectedValue == 2) {
                  int totalAmount = amount * 100;
                  PaymentIntentInputModel paymentIntentInputModel =
                      PaymentIntentInputModel(
                    currency: 'EGP',
                    amount: '$totalAmount',
                    customerId: CashHelper.getData(key: kCustomerID),
                  );
                  BlocProvider.of<PaymentCubit>(context).makePayment(
                    paymentIntentInputModel: paymentIntentInputModel,
                  );

                  // that's mean the payment method is paypal
                  // so user should be redirected to paypal site to make the payment
                } else {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => PaypalCheckoutView(
                        sandboxMode: true,
                        clientId: ApiKeys.payPalClientId,
                        secretKey: ApiKeys.payPalSecret,
                        transactions: const [
                          {
                            "amount": {
                              "total": "10",
                              "currency": "USD",
                              "details": {
                                "subtotal": "100",
                                "shipping": "0",
                                "shipping_discount": 0
                              }
                            },
                            "description":
                                "The payment transaction description.",
                            // "item_list": {
                            //   "items": [
                            //     {
                            //       "name": "Apple",
                            //       "quantity": 4,
                            //       "price": "10",
                            //       "currency": "USD"
                            //     },
                            //     {
                            //       "name": "Pineapple",
                            //       "quantity": 5,
                            //       "price": "12",
                            //       "currency": "USD"
                            //     }
                            //   ],
                            // }
                          }
                        ],
                        note: "Contact us for any questions on your order.",
                        onSuccess: (Map params) async {
                          print("onSuccess: $params");
                          Navigator.pop(context);
                        },
                        onError: (error) {
                          print("onError: $error");
                          Navigator.pop(context);
                        },
                        onCancel: () {
                          print('cancelled');
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }

  Future<void> addNewOrderMethod(
      AddressCubit addressCubit, OrderCubit orderCubit) async {
    AddNewOrderParameter parameter = AddNewOrderParameter(
        addressId: addressCubit.addressModel != null
            ? addressCubit.addressModel!.id
            : addressCubit.getAddressesModel!.data!.addressModelsList[0].id,
        paymentMethod: addressCubit.selectedValue,
        usePoints: false);
    await orderCubit.addNewOrder(parameter: parameter);
  }
}
