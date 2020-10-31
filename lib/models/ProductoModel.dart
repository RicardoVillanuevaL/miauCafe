import 'package:flutter/material.dart';

class Product {
  final String image, title, description;
  final int price, size, id;
  final Color color;
  Product({
    this.id,
    this.image,
    this.title,
    this.price,
    this.description,
    this.size,
    this.color,
  });
}

List<Product> products = [
  Product(
      id: 1,
      title: 'Gatito',
      price: 234,
      size: 12,
      description: 'Gato',
      image: "assets/imagenes/pruebaGato.png",
      color: Color(0xFF3D82AE)),
  Product(
    id: 2,
    title: "Cafecito",
    price: 234,
    size: 8,
    description: 'Cafe',
    image: "assets/imagenes/pruebaGato.png",
    color: Colors.deepPurpleAccent[50],
  )
];
