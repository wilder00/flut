import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentIndex = 0;

    return BottomNavigationBar(
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
