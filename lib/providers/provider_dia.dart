import 'package:flutter/material.dart';
import 'package:smn/models/modelo_dia.dart';
import 'package:smn/models/modelo_pronostico.dart';
import 'package:smn/services/servicio_carga_pronosticos.dart';

import '../services/servicio_carga_dia.dart';

class ProviderDia with ChangeNotifier {

  List<ModeloDia> _dia = [];
  bool _esta_cargando = false;


  //gets
  List<ModeloDia> get dia => _dia;
  bool get estaCargando => _esta_cargando;

  Future<void> cargarDia (int index) async {
    _esta_cargando = true;
    notifyListeners();

    try{
      if(_dia.isEmpty){
        _dia = await ServicioCargaDia().descargaDia(index);
      }
    }catch(error){
      print(error);
    }finally {
      _esta_cargando = false;
      notifyListeners();
    }
  }
}