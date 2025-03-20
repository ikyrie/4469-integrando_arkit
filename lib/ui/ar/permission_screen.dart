import 'package:flutter/material.dart';
import 'package:toca_moveis/ui/_core/widgets/primary_button.dart';
import 'package:toca_moveis/ui/ar/ar_screen.dart';

class PermissionScreen extends StatelessWidget {
  const PermissionScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Permissões"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 64),
        child: Column(
          spacing: 24,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.camera_alt,
              size: 48,
            ),
            Text(
              "Precisamos de acesso à sua câmera",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Para continuar o cadastro, a aplicação precisa de autorização para acessar a sua câmera.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            PrimaryButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ArScreen()));
              },
              child: "Autorizar acesso à câmera",
            ),
            InkWell(
              child: Text(
                "Agora não",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
