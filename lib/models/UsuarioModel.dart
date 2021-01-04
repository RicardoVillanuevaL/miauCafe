import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
  Usuario({
    this.id,
    this.nombre,
    this.apellido,
    this.correo,
    this.pass,
  });

  String id;
  String nombre;
  String apellido;
  String correo;
  String pass;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["id_usuario"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        correo: json["correo"],
        pass: json["pass"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "apellido": apellido,
        "correo": correo,
        "pass": pass,
      };
}
