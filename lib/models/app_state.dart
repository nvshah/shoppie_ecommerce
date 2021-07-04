import 'package:ecommerce_app_f2/models/user.dart';
import 'package:flutter/cupertino.dart';

@immutable
class AppState {
  final User user;
  AppState({@required this.user});

  factory AppState.initial() => AppState(user: null);
}
