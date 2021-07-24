import 'dart:convert';

import 'package:flutter/foundation.dart';

class Product {
  final String id;
  final String name;
  final String description;
  final num price;
  final Map<String, dynamic> picture;

  Product({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.price,
    @required this.picture,
  });

  Map<String, dynamic> _toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'picture': picture,
    };
  }

  factory Product._fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      price: map['price'],
      picture: Map<String, dynamic>.from(map['picture']),
    );
  }

  String toJson() => json.encode(_toMap());

  factory Product.fromJson(String source) =>
      Product._fromMap(json.decode(source));
}
