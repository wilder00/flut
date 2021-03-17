import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/src/providers/scan_list_provider.dart';

class ScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: Icon(Icons.filter_center_focus),
      onPressed: () async {
        //String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        //    '#3D8BEF', "cancelar", false, ScanMode.QR);
        final barcodeScanRes = "https://github.com";
        print(barcodeScanRes);
        final scanlistProvider =
            Provider.of<ScanListProvider>(context, listen: false);
        scanlistProvider.nuevoScan(barcodeScanRes);
      },
    );
  }
}
