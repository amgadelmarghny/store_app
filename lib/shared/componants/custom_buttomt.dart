import 'package:flutter/material.dart';
import 'package:store_2/shared/style/colors.dart';

class CustomButtomShet extends StatelessWidget {
  const CustomButtomShet({
    super.key,
    this.onTap,
    this.isLoading = false,
    required this.text,
  });
  final void Function()? onTap;
  final bool isLoading;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              defaultColor[500]!,
              defaultColor[200]!,
            ],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
          // color: defaultColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: isLoading
              ? const SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(),
                )
              : Text(
                  text,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
        ),
      ),
    );
  }
}
