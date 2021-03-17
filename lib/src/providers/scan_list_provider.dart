import 'package:flutter/cupertino.dart';
import 'package:qr_reader/src/models/scan_model.dart';
import 'package:qr_reader/src/providers/db_provider.dart';

class ScanLisProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String tipoSeleccionado = 'http';

  nuevoScan(String valor) async {
    final nuevoScan = new ScanModel(valor: valor);
    final id = await DBProvider.db.nuevoScan(nuevoScan);
    //asignar el ID de la base de datos al modelo
    nuevoScan.id = id;

    if (this.tipoSeleccionado == nuevoScan.tipo) {
      // se añade los cambios que necesitan redibujarse
      this.scans.add(nuevoScan);
      // que notifique a cada widget interesando cuando el valor cambie y necesite redibujarse
      notifyListeners();
    }
  }

  cargarScans() async {
    final scans = await DBProvider.db.getTodosLosScans();
    //asignando un nuevo array con los elementos de scans
    this.scans = [...scans];
    notifyListeners();
  }

  cargarScanPorTipo(String tipo) async {
    final scans = await DBProvider.db.getScansPorTipos(tipo);
    //asignando un nuevo array con los elementos de scans
    this.scans = [...scans];
    this.tipoSeleccionado = tipo;
    notifyListeners();
  }

  borrarTodos() async {
    await DBProvider.db.deleteAllScan();
    this.scans = [];
    notifyListeners();
  }

  borrarScanPorId(int id) async {
    await DBProvider.db.deleteScan(id);
    this.cargarScanPorTipo(this.tipoSeleccionado);
  }
}
