import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:toca_moveis/ui/_core/colors.dart';
import 'package:toca_moveis/ui/_core/dimensions.dart';
import 'package:toca_moveis/ui/_core/widgets/primary_button.dart';
import 'package:toca_moveis/ui/home/view/home_view_model.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeViewModel viewModel = Provider.of<HomeViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Opacity(
              opacity: 0.4,
              child: Image.asset(
                "assets/splash-background.jpg",
                height: height(context),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SvgPicture.asset("assets/logo.svg"),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32.0,
                vertical: 100,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 24,
                children: [
                  Text(
                    "Seu ambiente, do seu jeito.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                    ),
                  ),
                  PrimaryButton(
                    onPressed: () =>
                        viewModel.onSplashEnterButtonPressed(context),
                    child: "Entrar",
                    leading: Icon(Icons.arrow_forward_sharp),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
