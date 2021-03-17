import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/src/pages/direcciones_page.dart';
import 'package:qr_reader/src/pages/mapas_pages.dart';
import 'package:qr_reader/src/providers/scan_list_provider.dart';
import 'package:qr_reader/src/providers/ui_provider.dart';
import 'package:qr_reader/src/widgets/custom_navigatorbar.dart';
import 'package:qr_reader/src/widgets/scan_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Historial"),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () {
              scanListProvider.borrarTodos();
            },
          ),
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);

    //cambiar para mostrar la página respectiva
    final currentIndex = uiProvider.selectedMenuOpt;

    //usar el ScanListProvider y lo traemos del context, con el listen: false le decimos que no se redibuje todavia
    final scanlistProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        scanlistProvider.cargarScanPorTipo('geo');
        return MapasPage();
      case 1:
        scanlistProvider.cargarScanPorTipo('http');
        return DireccionesPage();
      default:
        return MapasPage();
    }
  }
}
