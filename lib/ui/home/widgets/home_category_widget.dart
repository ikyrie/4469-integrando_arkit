import 'package:flutter/material.dart';
import 'package:toca_moveis/domain/models/furniture_category.dart';
import 'package:toca_moveis/ui/_core/colors.dart';

class HomeCategoryWidget extends StatelessWidget {
  final FurnitureCategory category;
  const HomeCategoryWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 4,
      children: [
        Container(
          height: 72,
          width: 72,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: AppColors.buttonBorder,
            ),
          ),
          child: Image.asset(
            category.imagePath,
            width: 72,
            height: 72,
          ),
        ),
        Text(
          category.name,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
