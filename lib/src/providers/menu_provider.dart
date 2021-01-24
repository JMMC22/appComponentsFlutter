import 'package:flutter/services.dart'
    show rootBundle; //Importación para leer JSON
import 'dart:convert';

class _MenuProvider {
  List<dynamic> opciones = [];

  _MenuProvider() {}

  Future<List<dynamic>> cargarData() async { //Se crea un Future ya que al leer de un JSON, puede tardar en cargarse
    final resp =
        await rootBundle.loadString('data/menu_opts.json'); //Lectura de JSON
    Map dataMap = json.decode(resp);

    opciones = dataMap['rutas'];

    return opciones;
  }
}

final menuProvider = new _MenuProvider();
