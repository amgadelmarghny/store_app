import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Sourban/shared/bloc/app_cubit/app_cubit.dart';

class ComplaintResponse extends StatelessWidget {
  const ComplaintResponse({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            BlocProvider.of<AppCubit>(context).complaintModel!.message,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Text('Complaint number: '),
              Text(
                '${BlocProvider.of<AppCubit>(context).complaintModel!.complaintDataModel!.id}',
                style: const TextStyle(decoration: TextDecoration.underline),
              )
            ],
          )
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.teal),
          ),
        ),
      ],
    );
  }
}
