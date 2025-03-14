import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smn/providers/provider_lista_municipios.dart';


class BuscarMunicipio extends StatefulWidget {
  const BuscarMunicipio({super.key});

  @override
  State<BuscarMunicipio> createState() => _BuscarMunicipioState();
}

class _BuscarMunicipioState extends State<BuscarMunicipio> {
  final TextEditingController _controlador_de_mi_caja_de_texto = TextEditingController();

  @override
  void initState(){
    super.initState();
    print('init');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print('acaa');
      Provider.of<ProviderListaMunicipios>(context,listen:false)
          .cargaMunicipios();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:   AppBar(
        title: Text("Buscando Municipioxx"),
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 16,
          ),
            child: TextField(
              controller: _controlador_de_mi_caja_de_texto,
              onChanged: (texto){
                Provider.of<ProviderListaMunicipios>(context,listen:false)
                    .filtrarMunicipios(texto);
              },
            ),
          ),
          Expanded(
              child: Consumer<ProviderListaMunicipios> ( //si no le ponemos esto se creara una vista y se desbordará
              builder: (context, provedor_del_municipio, child){
                if(provedor_del_municipio.estaCargando) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return ListView.builder(
                    itemCount: provedor_del_municipio.listaDeMunicipiosFiltrada.length,
                    itemBuilder: (context, index) {
                      final municipio = provedor_del_municipio
                          .listaDeMunicipiosFiltrada[index];
                      return ListTile(
                        onTap: ()=> print(municipio.label),
                        title: Text(municipio.label),
                      );
                }
                );

              },
              )
          )
        ],
      ),
    );
  }
}
