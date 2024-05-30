import 'package:flutter/material.dart';
import 'package:Sourban/shared/style/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    this.isLoading = false,
    required this.text,
    this.isGradientColor = false,
    this.color = defaultColor,
    this.prefixIcon = false,
    this.textColor = Colors.white,
  });
  final void Function()? onTap;
  final bool isLoading;
  final String text;
  final bool isGradientColor;
  final Color? color;
  final bool prefixIcon;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 55,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: color,
          gradient: isGradientColor
              ? LinearGradient(
                  colors: [
                    defaultColor[600]!,
                    defaultColor[200]!,
                  ],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                )
              : null,
          // color: defaultColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: isLoading
              ? const SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (prefixIcon)
                      const Icon(
                        Icons.do_not_disturb,
                        color: Colors.red,
                      ),
                    if (prefixIcon)
                      const SizedBox(
                        width: 5,
                      ),
                    Text(
                      text,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
