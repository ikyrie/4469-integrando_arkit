import 'package:flutter/material.dart';
import 'package:toca_moveis/ui/_core/colors.dart';
import 'package:toca_moveis/ui/_core/dimensions.dart';
import 'package:toca_moveis/ui/_core/widgets/primary_button.dart';
import '../../../domain/models/furniture.dart';

showFurnitureDialog({
  required BuildContext context,
  required Furniture furniture,
}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: AppColors.barrierDialog,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        elevation: 2,
        child: _HomeFurnitureDialog(furniture: furniture),
      );
    },
  );
}

class _HomeFurnitureDialog extends StatelessWidget {
  final Furniture furniture;
  const _HomeFurnitureDialog({
    required this.furniture,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(context),
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.close,
              color: AppColors.appBarForeground,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: AppColors.buttonBorder,
              ),
            ),
            child: Image.network(furniture.capture),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.scaffoldBackground,
            ),
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16,
              children: [
                Text(
                  furniture.name,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "R\$${furniture.price.toStringAsFixed(2).replaceAll(".", ",")}",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SingleChildScrollView(
                  child: Text(
                    furniture.description,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                PrimaryButton(
                  onPressed: () {},
                  child: "Comprar",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
