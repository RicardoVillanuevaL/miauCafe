import 'dart:convert';

Pago pagoFromJson(String str) => Pago.fromJson(json.decode(str));

String pagoToJson(Pago data) => json.encode(data.toJson());

List<Pago> pagoFromJsonConsulta(String str) =>
    List<Pago>.from(json.decode(str).map((x) => Pago.fromJsonConsulta(x)));

String pagoToJsonConsulta(List<Pago> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJsonConsulta())));

class Pago {
  Pago({
    this.idPago,
    this.fechaHora,
    this.montoTotal,
    this.usuario,
    this.concepto,
  });
  int idPago;
  DateTime fechaHora;
  int montoTotal;
  String usuario;
  String concepto;

  factory Pago.fromJson(Map<String, dynamic> json) => Pago(
        fechaHora: DateTime.parse(json["fecha_hora"]),
        montoTotal: json["monto_total"],
        usuario: json["usuario"],
        concepto: json["concepto"],
      );

  Map<String, dynamic> toJson() => {
        "fecha_hora": fechaHora.toIso8601String(),
        "monto_total": montoTotal,
        "usuario": usuario,
        "concepto": concepto,
      };

  factory Pago.fromJsonConsulta(Map<String, dynamic> json) => Pago(
        idPago: json["id_pago"],
        fechaHora: DateTime.parse(json["fecha_hora_pago"]),
        montoTotal: json["monto_total_pago"],
        usuario: json["id_usuario"],
        concepto: json["concepto"],
      );

  Map<String, dynamic> toJsonConsulta() => {
        "id_pago": idPago,
        "fecha_hora_pago": fechaHora.toIso8601String(),
        "monto_total_pago": montoTotal,
        "id_usuario": usuario,
        "concepto": concepto,
      };
}
