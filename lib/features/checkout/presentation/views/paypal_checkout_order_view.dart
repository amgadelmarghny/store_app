import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/features/address/presentation/cubit/address_cubit.dart';
import 'package:soagmb/features/checkout/domain/entities/paypal/amount/amount.dart';
import 'package:soagmb/features/checkout/domain/entities/paypal/amount/details.dart';
import 'package:soagmb/features/checkout/domain/entities/paypal/product_items_list_model/product_item_order.dart';
import 'package:soagmb/features/checkout/domain/entities/paypal/product_items_list_model/product_items_list_model.dart';
import 'package:soagmb/core/network/local/api_keys.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:soagmb/features/order/data/models/add_new_order__parameter.dart';
import 'package:soagmb/features/order/presentation/cubit/order_cubit.dart';
import 'package:soagmb/features/shop/domain/entities/cart/cart_item.dart';
import 'package:soagmb/features/shop/presentation/cubit/shop_cubit.dart';
import 'package:soagmb/features/shop/presentation/widgets/custom_show_messages.dart';

class PayPalCheckOutOrderView extends StatelessWidget {
  const PayPalCheckOutOrderView({super.key});
  static const String id = 'paypal checkout';

  @override
  Widget build(BuildContext context) {
    ({AddressCubit addressCubit, OrderCubit orderCubit}) data =
        ModalRoute.settingsOf(context)!.arguments as ({
      AddressCubit addressCubit,
      OrderCubit orderCubit
    });

    return PaypalCheckoutView(
      sandboxMode: true,
      clientId: ApiKeys.payPalClientId,
      secretKey: ApiKeys.payPalSecret,
      transactions: [
        {
          "amount": transactionData(context).amount.toJson(),
          "description": "The payment transaction description.",
          "item_list": transactionData(context).productItemsListModel.toJson(),
        }
      ],
      note: "Contact us for any questions on your order.",
      onSuccess: (Map params) async {
        toastShown(
          message: params['message'],
          state: ToastState.success,
          context: context,
        );
        Navigator.pop(context);
     await addNewOrderMethod(data.addressCubit, data.orderCubit);
      },
      onError: (error) {
        toastShown(
          message: error['message'],
          state: ToastState.success,
          context: context,
        );
        Navigator.pop(context);
      },
      onCancel: () {
        log('cancelled');
        Navigator.pop(context);
      },
    );
  }

  ({Amount amount, ProductItemsListModel productItemsListModel})
      transactionData(context) {
    int total =
        BlocProvider.of<ShopCubit>(context).cartModel!.data!.total!.toInt();
    Details details =
        Details(shipping: "0", subtotal: total.toString(), shippingDiscount: 0);
    Amount amount =
        Amount(total: total.toString(), currency: "USD", details: details);
    List<CartItem> cartItemList =
        BlocProvider.of<ShopCubit>(context).cartModel!.data!.cartItemsList;
    ProductItemsListModel productItemsListModel = ProductItemsListModel(
      items: List<ProductItemOrder>.from(
        cartItemList.map(
          (cartItem) => ProductItemOrder(
              name: cartItem.product.name!,
              quantity: cartItem.quantity,
              price: cartItem.product.price.toString(),
              currency: "USD"),
        ),
      ),
    );
    return (amount: amount, productItemsListModel: productItemsListModel);
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
