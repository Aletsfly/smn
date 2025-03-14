class ModeloMunicipio {

  /*
  "label": "Aguascalientes, Aguascalientes",
      "id_edo": "1",
      "id_mpo": "1"
   */

  String label;
  String idEdo;
  String idMpo;

  ModeloMunicipio({required this.label,required this.idEdo,required this.idMpo}); // las llavecitas para que el usuario obligatoriamente tiene que poner esos datos

  factory ModeloMunicipio.fromJson(Map<String, dynamic> json){
    return ModeloMunicipio (
      label: json['label'] ?? "ciudad valles, san luis potosi", // si no existe este ponle esto los signos de interrogacion así funcionan
      idEdo: json['idEdo'] ?? "24",
      idMpo: json ['idMpo'] ?? "13",
    );
  } //devuelve al modelo para que pueda trabajar con él

}