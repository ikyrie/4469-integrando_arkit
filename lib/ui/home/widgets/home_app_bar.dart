import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../_core/colors.dart';
import '../view/home_view_model.dart';

AppBar getHomeAppBar(BuildContext context) {
  HomeViewModel homeViewModel = Provider.of<HomeViewModel>(context);

  return AppBar(
    toolbarHeight: 64,
    backgroundColor: AppColors.appBarBackground,
    centerTitle: true,
    title: SvgPicture.asset(
      "assets/logo.svg",
      height: 40,
    ),
    actions: [
      if (!homeViewModel.isOnTop)
        IconButton(
          onPressed: () => homeViewModel.jumpToTop(context),
          icon: Icon(
            Icons.search,
            color: AppColors.appBarForeground,
          ),
        ),
    ],
  );
}
