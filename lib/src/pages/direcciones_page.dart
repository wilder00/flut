import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/src/providers/scan_list_provider.dart';

class DireccionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //aqui si se necesita escuchar los cambios para que se redibuje
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: true);

    final scans = scanListProvider.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, i) => ListTile(
        leading: Icon(
          Icons.home_outlined,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(scans[i].valor),
        subtitle: Text(scans[i].toString()),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.grey,
        ),
        onTap: () => print("hacer algo"),
      ),
    );
  }
}
