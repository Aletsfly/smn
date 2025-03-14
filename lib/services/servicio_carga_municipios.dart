import 'dart:convert';

import 'package:flutter/material.dart'; // no importamos material porque no estamos usando nada
import 'package:flutter/services.dart';
import 'package:smn/models/modelo_municipio.dart';

class ServicioCargaMunicipios {
  Future<List<ModeloMunicipio>> descargaMunicipios() async {
    //le indica a la aplicaciion que siga cargando mientras no se detenga. corriendo en segundo plano de un modo asincrono esperando al await
    try {
      //intenta hacer... esto que está aquí abajo si por error falla se va a saltar al catch
      final String response = await rootBundle.loadString(
          'assets/data/datos_municipios.json'); //await es un funcion que le dice la servicio espérate. "cargar el json"
      print(response);

      List<dynamic> listaMunicipios = jsonDecode(response);
      return listaMunicipios
          .map((municipio) => ModeloMunicipio.fromJson(
              municipio)) //mapea el muncipio hace un recorrido como un for. uno por uno va a reccorer el map y va a transformar modelando en lo que sale en modelo_municipio.dart
          .toList(); // finalmente lo transforma en una lista porque está esperando una lista
    } catch (e) {
      print(e);
      return [];
    }
  }
}
