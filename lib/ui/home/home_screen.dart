import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:toca_moveis/data/list_categories.dart';
import 'package:toca_moveis/domain/models/furniture.dart';
import 'package:toca_moveis/ui/_core/colors.dart';
import 'package:toca_moveis/ui/_core/dimensions.dart';
import 'package:toca_moveis/ui/_core/widgets/section_widget.dart';
import 'package:toca_moveis/ui/home/view/home_view_model.dart';
import 'package:toca_moveis/ui/home/widgets/home_app_bar.dart';
import 'package:toca_moveis/ui/home/widgets/home_bottom_navigation.dart';
import 'package:toca_moveis/ui/home/widgets/home_category_widget.dart';
import 'package:toca_moveis/ui/home/widgets/home_grid_widget.dart';

import '../_core/widgets/appbar_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeViewModel>(context, listen: false).initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    HomeViewModel homeViewModel = Provider.of<HomeViewModel>(context);

    return Scaffold(
      appBar: getHomeAppBar(context),
      bottomNavigationBar: HomeBottomNavigationBar(),
      body: SingleChildScrollView(
        controller: homeViewModel.homeScrollController,
        child: Column(
          children: [
            Container(
              height: 80,
              color: AppColors.appBarBackground,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: AppbarTextField(
                  focusNode: homeViewModel.searchFocusNode,
                ),
              ),
            ),
            SvgPicture.asset(
              "assets/home-banner.svg",
              width: width(context),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Column(
                spacing: 32,
                children: [
                  SectionWidget(
                    title: "Categorias",
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        spacing: 8,
                        children: listCategories
                            .map((e) => HomeCategoryWidget(category: e))
                            .toList(),
                      ),
                    ),
                  ),
                  if (homeViewModel.indexPage == 0)
                    SectionWidget(
                      title: "Destaques",
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          spacing: 8,
                          children: List.generate(
                            homeViewModel
                                .getListHighlightedFurniture(context)
                                .length,
                            (index) {
                              Furniture furniture = homeViewModel
                                  .getListHighlightedFurniture(context)[index];
                              return HomeGridWidget(furniture: furniture);
                            },
                          ),
                        ),
                      ),
                    ),
                  if (homeViewModel.indexPage == 0)
                    SectionWidget(
                      title: "Descontos",
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          spacing: 8,
                          children: List.generate(
                            homeViewModel
                                .getListDiscountedFurniture(context)
                                .length,
                            (index) {
                              Furniture furniture = homeViewModel
                                  .getListDiscountedFurniture(context)[index];
                              return HomeGridWidget(furniture: furniture);
                            },
                          ),
                        ),
                      ),
                    ),
                  if (homeViewModel.indexPage != 0)
                    SectionWidget(
                      title: "Favoritos",
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        runAlignment: WrapAlignment.start,
                        children:
                            homeViewModel.getListFavoriteFurniture(context).map(
                          (Furniture furniture) {
                            return HomeGridWidget(
                              furniture: furniture,
                              onWrap: true,
                            );
                          },
                        ).toList(),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
