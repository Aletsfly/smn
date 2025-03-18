import 'package:flutter/material.dart';
import 'package:smn/custom_widgets/texto_gris_negrita.dart';
import 'package:smn/models/modelo_pronostico.dart';

class DiaPrincipal extends StatelessWidget {
  final ModeloPronostico dia;
  const DiaPrincipal({super.key, required this.dia});

  Widget Elemento(String texto, IconData icono, String medida) {
    return Column(
      children: [
        Text(texto),
        Row(
          children: [
            Icon(icono),
            Text(medida)
          ],
        )
      ],
    );
  }

  Widget Separador(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            color: Colors.black54,
            width: 2,
          )
        )
      ),
      child: SizedBox(
        width: 40,
        height: 40,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(dia.desciel),
        Container(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              Icons.sunny,
              color: Colors.amber,
              size: 80,
            ),
            Text(
              dia.tmax,
              style: TextStyle(
                fontSize: 70.0,
                color: Colors.redAccent,
              ),
            ),
            Text(
              "/${dia.tmin} °C",
              style: TextStyle(
                fontSize: 35.0,
                color: Colors.blueAccent,
              ),
            ),
          ]),
        ),
        MediaQuery.of(context).size.width <= 600
            ? Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              TextoGrisNegrita(texto: "Precipitación ", medida: dia.prec),
             // TextoGrisNegrita(texto: "texto", medida: medida),
             // TextoGrisNegrita(texto: "texto", medida: medida),
             // TextoGrisNegrita(texto: texto, medida: medida),

            ],
          ),
        )
            : Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Elemento("Lluvia", Icons.water_drop, "${dia.prec} lts/m2"),
            Separador(),
            Elemento("Probabilidad de Lluvia", Icons.cloudy_snowing, "${dia.probprec} lts/m2"),
            Separador(),
            Elemento("Dirección del viento", Icons.arrow_outward, "${dia.dirvienc} Km/h"),
            Separador(),
            Elemento("Velocidad del Viento", Icons.speed_outlined, "${dia.velvien} Km/h"),
          ],
        )
      ],
    );
  }
}
