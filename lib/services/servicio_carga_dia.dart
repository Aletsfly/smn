import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:smn/models/modelo_pronostico.dart';

import '../models/modelo_dia.dart';

class ServicioCargaDia {


  Future <List<ModeloDia>> descargaDia(int index) async{
    try{
      final String respuesta = await rootBundle.loadString('assets/data/{$index+1}.json');
      List<dynamic> listaDedia = jsonDecode(respuesta);

      return listaDedia.map((dia) =>
          ModeloDia.fromJson(dia)).toList();
    }catch(e){
      return[];

    }
  }
}