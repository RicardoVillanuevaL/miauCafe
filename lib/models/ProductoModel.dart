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
    title: 'Affogato',
    price: 50,
    size: 12,
    description: 'Gato',
    image: "assets/imagenes/affogato.png",
    color: Colors.orange[100],
  ),
  Product(
    id: 2,
    title: "Cafe Cubano",
    price: 40,
    size: 8,
    description: 'Cafe',
    image: "assets/imagenes/cafe_cubano.png",
    color: Color(0xFFb992c9),
  ),
  Product(
    id: 3,
    title: 'Cafe Moccha',
    price: 50,
    size: 12,
    description: 'Gato',
    image: "assets/imagenes/Caffe_Mocha.png",
    color: Color(0xFFb992c9),
  ),
  Product(
    id: 4,
    title: "Caramel Macchiato",
    price: 40,
    size: 8,
    description: 'Cafe',
    image: "assets/imagenes/Caramel_Macchiato.png",
    color: Color(0xFFb992c9),
  ),
  Product(
    id: 5,
    title: 'Affogato',
    price: 50,
    size: 12,
    description: 'Cortado',
    image: "assets/imagenes/cortado.png",
    color: Color(0xFFbeaac6),
  ),
  Product(
    id: 6,
    title: "Cafe Expresso",
    price: 40,
    size: 8,
    description: 'Cafe',
    image: "assets/imagenes/espresso.png",
    color: Colors.deepPurpleAccent[50],
  ),
  Product(
      id: 7,
      title: 'Affogato',
      price: 50,
      size: 12,
      description: 'Gato',
      image: "assets/imagenes/affogato.png",
      color: Color(0xFFbeaac6)),
  Product(
    id: 8,
    title: "Cafe Cubano",
    price: 40,
    size: 8,
    description: 'Cafe',
    image: "assets/imagenes/cafe_cubano.png",
    color: Color(0xFFb992c9),
  )
];
