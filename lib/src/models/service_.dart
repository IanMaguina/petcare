import 'dart:convert';

Service serviceFromJson(String str) => Service.fromJson(json.decode(str));

String serviceToJson(Service data) => json.encode(data.toJson());

class Service {
  Service({
     this.name,
     this.idVeterinaria,
     this.idVeterinario,
     this.idTipoServicio,
  });

  String name;
  int idVeterinaria;
  int idVeterinario;
  int idTipoServicio;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        name: json["name"],
        idVeterinaria: json["id_veterinaria"],
        idVeterinario: json["id_veterinario"],
        idTipoServicio: json["id_tipo_servicio"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id_veterinaria": idVeterinaria,
        "id_veterinario": idVeterinario,
        "id_tipo_servicio": idTipoServicio,
      };
}
