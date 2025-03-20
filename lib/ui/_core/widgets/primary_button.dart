import 'package:flutter/material.dart';
import 'package:toca_moveis/ui/_core/colors.dart';

import '../fonts.dart';

class PrimaryButton extends StatelessWidget {
  final Function? onPressed;
  final String child;

  final Widget? leading;

  final double? width;
  final double? height;

  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.leading,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.buttonBorder,
            offset: Offset(2, 2),
            blurRadius: 0,
          )
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed != null ? () => onPressed!() : null,
          child: Ink(
            height: height ?? 48,
            width: width ?? double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: AppColors.buttonBorder,
              ),
              color: (onPressed != null)
                  ? AppColors.buttonPrimary
                  : AppColors.buttonDeactivated,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 8,
              children: [
                if (leading != null) leading!,
                Text(
                  child,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: AppFonts.montserrat,
                    color: AppColors.textPrimary,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
