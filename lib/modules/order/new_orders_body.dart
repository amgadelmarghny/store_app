import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/shared/bloc/address_cubit/address_cubit.dart';
import 'package:store_2/shared/style/colors.dart';

class NewOrdersBody extends StatelessWidget {
  const NewOrdersBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(
      builder: (context, state) {
        if (state is GetAddressFaluir) {
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
            BlocProvider.of<AddressCubit>(context).newOrdersList.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/assets/images/empty_box.png',
                height: 200,
              ),
              const Text('You havn\'t placed an order yet')
            ],
          );
        }
        return ConditionalBuilder(
          condition: BlocProvider.of<AddressCubit>(context).getOrdersModel !=
                  null &&
              BlocProvider.of<AddressCubit>(context).newOrdersList.isNotEmpty,
          builder: (BuildContext context) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  return Container(color: Colors.amber, height: 10);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                itemCount: BlocProvider.of<AddressCubit>(context)
                    .newOrdersList
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
