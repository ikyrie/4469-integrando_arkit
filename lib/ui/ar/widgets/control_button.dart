import 'package:flutter/material.dart';
import 'package:toca_moveis/ui/_core/colors.dart';

class ControlButton extends StatelessWidget {
  const ControlButton({super.key, required this.onTap, required this.icon});

  final Function onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.buttonPrimary,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Icon(icon, color: AppColors.buttonIcon, size: 32,),
      ),
    );
  }
}
