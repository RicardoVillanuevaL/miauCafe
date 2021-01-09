// To parse this JSON data, do
//
//     final pedido = pedidoFromJson(jsonString);

import 'dart:convert';

Pedido pedidoFromJson(String str) => Pedido.fromJson(json.decode(str));

String pedidoToJson(Pedido data) => json.encode(data.toJson());

List<Pedido> pedidoFromJsonConsulta(String str) =>
    List<Pedido>.from(json.decode(str).map((x) => Pedido.fromJsonConsulta(x)));

String pedidoToJsonConsulta(List<Pedido> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJsonConsulta())));

class Pedido {
  Pedido({
    this.id,
    this.fecha,
    this.tiempo,
    this.estado,
    this.cliente,
    this.reserva,
  });
  int id;
  DateTime fecha;
  String tiempo;
  int estado;
  String cliente;
  int reserva;

  factory Pedido.fromJson(Map<String, dynamic> json) => Pedido(
        fecha: DateTime.parse(json["fecha"]),
        tiempo: json["tiempo"],
        estado: json["estado"],
        cliente: json["cliente"],
        reserva: json["reserva"],
      );

  Map<String, dynamic> toJson() => {
        "fecha":
            "${fecha.year.toString().padLeft(4, '0')}-${fecha.month.toString().padLeft(2, '0')}-${fecha.day.toString().padLeft(2, '0')}",
        "tiempo": tiempo,
        "estado": estado,
        "cliente": cliente,
        "reserva": reserva,
      };

  factory Pedido.fromJsonConsulta(Map<String, dynamic> json) => Pedido(
        id: json["id_pedido"],
        fecha: DateTime.parse(json["fecha_pedido"]),
        tiempo: json["tiempo_pedido"],
        estado: json["estado_pedido"],
        cliente: json["id_cliente"],
        reserva: json["id_reserva"],
      );

  Map<String, dynamic> toJsonConsulta() => {
        "id_pedido": id,
        "fecha_pedido": fecha.toIso8601String(),
        "tiempo_pedido": tiempo,
        "estado_pedido": estado,
        "id_cliente": cliente,
        "id_reserva": reserva,
      };
}
