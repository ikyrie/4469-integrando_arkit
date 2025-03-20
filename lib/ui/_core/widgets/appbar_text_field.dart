import 'package:flutter/material.dart';

import '../colors.dart';

class AppbarTextField extends StatelessWidget {
  final double? height;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;

  const AppbarTextField({
    super.key,
    this.height,
    this.controller,
    this.validator,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 56,
      decoration: BoxDecoration(color: AppColors.inputBackground),
      child: Center(
        child: TextFormField(
          focusNode: focusNode,
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            hintText: "O que você busca?",
            hintStyle: TextStyle(
              color: AppColors.inputHintColor,
              fontSize: 14,
            ),
            fillColor: AppColors.inputBackground,
            iconColor: AppColors.inputIconColor,
            suffixIcon: Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
