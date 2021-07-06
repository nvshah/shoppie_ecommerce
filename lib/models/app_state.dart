import 'package:ecommerce_app_f2/models/user.dart';
import 'package:flutter/cupertino.dart';

@immutable
class AppState {
  final User user;
  final List<dynamic> products;
  AppState({
    @required this.user,
    @required this.products,
  });

  factory AppState.initial() => AppState(user: null, products: []);
}
