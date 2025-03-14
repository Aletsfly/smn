import 'package:flutter/material.dart';
import 'package:smn/models/modelo_pronostico.dart';

class DiaPrincipal extends StatelessWidget {
  final ModeloPronostico dia;

  DiaPrincipal({super.key, required this.dia});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(dia.desciel),
        Container(
          child: Row(
            children: [
              Icon(Icons.sunny, color: Colors.amber, size: 80,),
              Text(dia.tmax, style: TextStyle(
                fontSize: 80,
                color: Colors.redAccent,
              ),
              ),
              Text("/${dia.tmin} °C",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.blueAccent,
                ),
              )
            ],),
        ),
       //AQUI VA TEXTO GRIS NEGRITA
      ],
    );
  }
}
