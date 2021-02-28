import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/src/providers/ui_provider.dart';

class CustomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    return BottomNavigationBar(
      // hacemos uiProvider.selectedMenuOpt = i, porque selectedMenuOpt es un setter
      onTap: (int i) => uiProvider.selectedMenuOpt = i,
      //nos dirá cuál es elemento seleccionado
      currentIndex: currentIndex,
      elevation: 1,
      //requiere de por lo menos 2 elementos
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: "Mapa",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.compass_calibration),
          label: "Direcciones",
        ),
      ],
    );
  }
}
