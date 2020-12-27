import 'dart:convert';

Reserva reservaFromJson(String str) => Reserva.fromJson(json.decode(str));
String reservaToJson(Reserva data) => json.encode(data.toJson());

class Reserva {
  Reserva({
    this.id,
    this.fecha,
    this.hora,
    this.personas,
    this.mesa,
    this.gatos,
    this.usuario,
  });
  int id;
  DateTime fecha;
  String hora;
  int personas;
  int mesa;
  int gatos;
  String usuario;

  factory Reserva.fromJson(Map<String, dynamic> json) => Reserva(
        id: json["id"],
        fecha: DateTime.parse(json["fecha_reserva"]),
        hora: json["hora_reserva"],
        personas: json["cantidadPersonas"],
        mesa: json["num_mesa"],
        gatos: json["cantidadGatos"],
        usuario: json["id_usuario"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "fecha": fecha.toIso8601String(),
        "hora": hora,
        "personas": personas,
        "mesa": mesa,
        "gatos": gatos,
        "usuario": usuario,
      };
}
