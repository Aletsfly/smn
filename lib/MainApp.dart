import 'package:flutter/material.dart';
import 'package:smn/pages/buscar_municipio.dart';
import 'package:smn/pages/pagina_inicial.dart';
import 'package:smn/providers/provider_dia.dart';

import 'package:smn/providers/provider_lista_municipios.dart';
import 'package:provider/provider.dart';
import 'package:smn/providers/provider_pronosticos.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>ProviderListaMunicipios() // este es el aviso aqui es donde se va a notificar el aviso. es la base de datos, es la vía la carretera donde recibe el aviso. el operador que recibe la peticion y checa si está
        ),
        ChangeNotifierProvider(create: (context)=>ProviderPronosticos() // este es el aviso aqui es donde se va a notificar el aviso. es la base de datos, es la vía la carretera donde recibe el aviso. el operador que recibe la peticion y checa si está
        ),
        ChangeNotifierProvider(create: (context)=>ProviderDia() // este es el aviso aqui es donde se va a notificar el aviso. es la base de datos, es la vía la carretera donde recibe el aviso. el operador que recibe la peticion y checa si está
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PaginaInicial()
      ),
    );
  }
}