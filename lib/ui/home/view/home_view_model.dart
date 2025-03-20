import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:toca_moveis/domain/furniture_provider.dart';
import 'package:toca_moveis/domain/models/furniture.dart';
import 'package:toca_moveis/ui/ar/ar_screen.dart';
import 'package:toca_moveis/ui/ar/permission_screen.dart';
import 'package:toca_moveis/ui/home/home_screen.dart';

import '../widgets/home_furniture_dialog.dart';

class HomeViewModel extends ChangeNotifier {
  // Listas aleatórias para página inicial
  List<Furniture> _listHighlightedFurniture = [];
  List<Furniture> _listDiscountedFurniture = [];
  List<Furniture> _listFavoriteFurniture = [];

  // Controles para pesquisa na appbar
  ScrollController homeScrollController = ScrollController();
  bool isOnTop = true;
  FocusNode searchFocusNode = FocusNode();

  // Para navegação entre páginas
  int _indexPage = 0;

  // TODO: Quando algum botão de AR for clicado.
  Future<void> onFurnitureArViewClicked(BuildContext context, Furniture furniture) async {
    final cameraPermissionGranted = await Permission.camera.isGranted;
    if(cameraPermissionGranted && context.mounted) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => ArScreen(furniture: furniture)));
    } else {
      if (context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return PermissionScreen(furniture: furniture);
            },
          ),
        );
      }
    }
  }

  // Inicialização
  void initialize() {
    homeScrollController.addListener(
      () {
        isOnTop = homeScrollController.offset <= 80;
        notifyListeners();
      },
    );
  }

  // Da tela de splash para tela de home
  void onSplashEnterButtonPressed(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }

  // Constrói e/ou devolve a lista de "Destaques"
  List<Furniture> getListHighlightedFurniture(BuildContext context) {
    if (_listHighlightedFurniture.isEmpty) {
      _listHighlightedFurniture =
          context.read<FurnitureProvider>().getRandomListFurniture(amount: 4);
    }
    return _listHighlightedFurniture;
  }

  // Constrói e/ou devolve a lista de "Descontos"
  List<Furniture> getListDiscountedFurniture(BuildContext context) {
    if (_listDiscountedFurniture.isEmpty) {
      _listDiscountedFurniture =
          context.read<FurnitureProvider>().getRandomListFurniture(amount: 4);
    }
    return _listDiscountedFurniture;
  }

  // Constroi e/ou devolve a lista de "Favoritos"
  List<Furniture> getListFavoriteFurniture(BuildContext context) {
    if (_listFavoriteFurniture.isEmpty) {
      _listFavoriteFurniture =
          context.read<FurnitureProvider>().getRandomListFurniture();
    }
    return _listFavoriteFurniture;
  }

  // Rola a página para o topo
  void jumpToTop(BuildContext context) async {
    await homeScrollController.animateTo(
      0,
      duration: Duration(milliseconds: 1250),
      curve: Curves.easeInOut,
    );
    if (!context.mounted) return;
    FocusScope.of(context).requestFocus(searchFocusNode);
  }

  // Para navegação entre páginas
  int get indexPage => _indexPage;
  set indexPage(int index) {
    if (_indexPage != index) {
      _indexPage = index;
      notifyListeners();
    }
  }

  onFurniturePressed({
    required BuildContext context,
    required Furniture furniture,
  }) {
    showFurnitureDialog(context: context, furniture: furniture);
  }
}
