import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smn/custom_widgets/texto_gris_negrita.dart';
import 'package:smn/models/modelo_pronostico.dart';
import 'package:weather_icons/weather_icons.dart';

class WidgetDia extends StatelessWidget {
  final ModeloPronostico pronostico;
  final int index;

  WidgetDia({super.key, required this.pronostico, required this.index});

  @override
  Widget build(BuildContext context) {
    String fechaFormateada = pronostico.fecha ?? '';
    DateFormat formatoEntrada = DateFormat("d/MM");
    DateTime fechaConvertida = formatoEntrada.parse(fechaFormateada);

    if (index == 0) {
      fechaFormateada = "Hoy";
    } else if (index == 1) {
      fechaFormateada = "Mañana";
    } else {
      DateFormat formatoSalida = DateFormat("EEEE", "es_MX");
      fechaFormateada = formatoSalida.format(fechaConvertida);
    }

    return Padding(
      padding: EdgeInsets.all(10.0),
      child: LayoutBuilder(builder: (context, condicionantes) {
        double ancho = condicionantes.maxWidth;
        bool esTelefono = MediaQuery.of(context).size.width < 600;
        double tamano = esTelefono ? (ancho / 2) - 10 : ancho;
        return Container(
          padding: EdgeInsets.all(2.0),
          decoration: BoxDecoration(
              border: Border.all(
            color: Colors.black12,
          )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fechaFormateada,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                pronostico.fecha.toString(),
                style: TextStyle(color: Colors.black38),
              ),
              Wrap(
                alignment: WrapAlignment.start,
                spacing: 10.0,
                runSpacing: 10.0,
                children: [
                  SizedBox(
                    width: tamano,
                    child: Icon(Icons.sunny, color: Colors.amber, size: 80),
                  ),
                  SizedBox(
                    width: tamano,
                    child: Column(
                      children: [
                        Text(pronostico.desciel),
                        Row(
                          children: [
                            Text(
                              pronostico.tmax,
                              style: TextStyle(
                                fontSize: 35.0,
                                color: Colors.redAccent,
                              ),
                            ),
                            Text(
                              "/${pronostico.tmin} °C",
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: tamano,
                    child: TextoGrisNegrita(
                        texto: "Lluvia ", medida: "${pronostico.prec} lts/m2"),
                  ),
                  SizedBox(
                    width: tamano,
                    child: TextoGrisNegrita(
                        texto: "Prob de Lluvia ",
                        medida: "${pronostico.probprec} %"),
                  ),
                  SizedBox(
                    width: tamano,
                    child: TextoGrisNegrita(
                        texto: "Dir viento ", medida: "${pronostico.dirvienc}"),
                  ),
                  SizedBox(
                    width: tamano,
                    child: TextoGrisNegrita(
                        texto: "Vel del viento ",
                        medida: "${pronostico.velvien} Km/h"),
                  ),
                  SizedBox(
                    width: tamano,
                    child: TextoGrisNegrita(
                        texto: "Raf de viento ",
                        medida: "${pronostico.raf} Km/h"),
                  ),
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
