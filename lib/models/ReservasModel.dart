import 'dart:convert';

Reserva reservaFromJson(String str) => Reserva.fromJson(json.decode(str));

String reservaToJson(Reserva data) => json.encode(data.toJson());

//List<ReservaList> reservaListFromJson(String str) => List<ReservaList>.from(json.decode(str).map((x) => ReservaList.fromJson(x)));
//String reservaListToJson(List<ReservaList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Reserva {
  Reserva({
    this.fecha,
    this.hora,
    this.personas,
    this.mesa,
    this.gatos,
    this.usuario,
  });

  DateTime fecha;
  String hora;
  int personas;
  int mesa;
  int gatos;
  String usuario;

  factory Reserva.fromJson(Map<String, dynamic> json) => Reserva(
        fecha: DateTime.parse(json["fecha"]),
        hora: json["hora"],
        personas: json["personas"],
        mesa: json["mesa"],
        gatos: json["gatos"],
        usuario: json["usuario"],
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
