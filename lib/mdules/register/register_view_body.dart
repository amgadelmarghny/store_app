import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_2/mdules/login/login_view.dart';
import 'package:store_2/mdules/register/sliver_register_input.dart';
import 'package:store_2/shared/bloc/auth_cubit/auth_cubit.dart';
import 'package:store_2/shared/componants/custom_curve_color_ui.dart';
import 'package:store_2/shared/style/colors.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: CurveColorUI(
                headLine: 'Create Your Account',
                subHeadline: 'Creat an account so you can shop',
                subHeadline2: 'form you comfortable home.',
                color: defaultColor,
              ),
            ),
            const SliverRegisterInfo(),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have account?',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, LoginView.id);
                      },
                      child: Text(
                        'Login',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
