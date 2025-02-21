import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:soagmb/core/global/cubits/connectivity_cubit/connectivity_cubit.dart';
import 'package:soagmb/core/global/services/service_locator.dart';
import 'package:soagmb/core/global/views/connected_material_app.dart';
import 'package:soagmb/core/global/views/disconnected_material_app.dart';
import 'package:soagmb/core/network/remote/bloc_observer.dart';
import 'package:soagmb/core/network/local/api_keys.dart';
import 'package:soagmb/core/network/local/shared_helper.dart';
import 'package:soagmb/core/network/remote/dio_helper_for_shop.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.initial();
  ServiceLocator.init();
  await CashHelper.init();
  Stripe.publishableKey = ApiKeys.publishableKey;
  Bloc.observer = MyBlocObserver();
  runApp(BlocProvider(
    create: (context) => ConnectivityCubit()..checkConnection(),
    child: const Soagmb(),
  ));
}

class Soagmb extends StatelessWidget {
  const Soagmb({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityCubit, ConnectivityState>(
      builder: (context, state) {
        return ConditionalBuilder(
            condition: state is DisConnectedState,
            builder: (context) => DisconnectedMaterialApp(),
            fallback: (context) =>ConnetedMaterialApp() );
      },
    );
  }
}
