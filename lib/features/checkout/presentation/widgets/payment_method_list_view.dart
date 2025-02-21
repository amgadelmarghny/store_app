import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soagmb/features/address/presentation/cubit/address_cubit.dart';
import '../../../shop/presentation/widgets/payment_method_item.dart';

class PaymentMethodItemListView extends StatelessWidget {
  const PaymentMethodItemListView({super.key});

  final List<String> paymentMethodImageList = const [
    'lib/core/global/assets/images/cash-pickup.svg',
    'lib/core/global/assets/images/visa_credit.svg',
    'lib/core/global/assets/images/paypal.svg',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(
      builder: (context, state) {
        AddressCubit cubit = AddressCubit.get(context);
        return SizedBox(
          height: 62,
          width: MediaQuery.sizeOf(context).width,
          child: ListView.builder(
            clipBehavior: Clip.antiAlias,
            itemCount: paymentMethodImageList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GestureDetector(
                  onTap: () {
                    cubit.setSelectedValue(index);
                  },
                  child: PaymentMethodItem(
                    isActive: cubit.isChoose == index,
                    image: paymentMethodImageList[index],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
