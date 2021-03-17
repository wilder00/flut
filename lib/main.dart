import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/src/pages/home_page.dart';
import 'package:qr_reader/src/pages/mapa_page.dart';
import 'package:qr_reader/src/providers/scan_list_provider.dart';
import 'package:qr_reader/src/providers/ui_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //el create es una funcion que se va a ejecutar cuando no hay ninguna instancia de providers creado
        ChangeNotifierProvider(create: (_) => new UiProvider()),
        ChangeNotifierProvider(create: (_) => new ScanListProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'home',
        routes: {
          'home': (BuildContext context) => HomePage(),
          'mapa': (BuildContext context) => MapaPage(),
        },
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.deepPurple,
            //fuentes iconos se pueden cambiar
          ),
        ),
      ),
    );
  }
}
