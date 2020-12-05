import 'dart:convert';

List<Producto> productoFromJson(String str) => List<Producto>.from(json.decode(str).map((x) => Producto.fromJson(x)));

String productoToJson(List<Producto> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Producto {
    Producto({
        this.id,
        this.image,
        this.title,
        this.price,
        this.description,
        this.categories,
    });

    int id;
    String image;
    String title;
    int price;
    String description;
    String categories;

    factory Producto.fromJson(Map<String, dynamic> json) => Producto(
        id: json["id"],
        image: json["image"],
        title: json["title"],
        price: json["price"],
        description: json["description"],
        categories: json["categories"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "title": title,
        "price": price,
        "description": description,
        "categories": categories,
    };
}
