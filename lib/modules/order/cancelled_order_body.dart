import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/shared/bloc/address_cubit/address_cubit.dart';
import 'package:store_2/shared/components/custom_show_messeges.dart';
import 'package:store_2/shared/style/colors.dart';

class CancelledOrdersBody extends StatelessWidget {
  const CancelledOrdersBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddressCubit, AddressState>(
      listener: (context, state) {
        if (state is GetOrderFaluir) {
          snacKBar(context, state.error);
        }
        if (state is GetOrderSuccess) {
          if (!state.getOrdersModel.status) {
            toastShown(
                messege: state.getOrdersModel.message!,
                state: ToastState.error,
                context: context);
          }
        }
      },
      builder: (context, state) {
        if (state is GetOrderFaluir) {
          return const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.warning_amber,
                color: Colors.red,
                size: 200,
              ),
              Text('Something went wrong\nPlease try again later'),
            ],
          );
        }
        if (BlocProvider.of<AddressCubit>(context).getOrdersModel != null &&
            BlocProvider.of<AddressCubit>(context)
                .cancelledOrdersList
                .isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/assets/images/empty_box.png',
                height: 200,
              ),
              const Text('There is no cannceld order')
            ],
          );
        }
        return ConditionalBuilder(
          condition:
              BlocProvider.of<AddressCubit>(context).getOrdersModel != null &&
                  BlocProvider.of<AddressCubit>(context)
                      .cancelledOrdersList
                      .isNotEmpty,
          builder: (BuildContext context) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  return Container(color: Colors.red, height: 10);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                itemCount: BlocProvider.of<AddressCubit>(context)
                    .cancelledOrdersList
                    .length);
          },
          fallback: (BuildContext context) {
            return const Center(
                child: CircularProgressIndicator(
              color: defaultColor,
            ));
          },
        );
      },
    );
  }
}
