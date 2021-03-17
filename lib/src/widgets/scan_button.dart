import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/src/providers/scan_list_provider.dart';
import 'package:qr_reader/src/utils/utils.dart';

class ScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: Icon(Icons.filter_center_focus),
      onPressed: () async {
        //String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        //    '#3D8BEF', "cancelar", false, ScanMode.QR);
        //final barcodeScanRes = "https://github.com";
        final barcodeScanRes = "geo:37.553057,126.979250";
        print(barcodeScanRes);

        //el usuario canceló
        if (barcodeScanRes == '-1') {
          return;
        }

        final scanlistProvider =
            Provider.of<ScanListProvider>(context, listen: false);
        final nuevoScan = await scanlistProvider.nuevoScan(barcodeScanRes);

        launchURL(context, nuevoScan);
      },
    );
  }
}
