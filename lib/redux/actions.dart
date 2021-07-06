/* User Actions */

import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:ecommerce_app_f2/models/app_state.dart';
import 'package:ecommerce_app_f2/models/user.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

///Action for user getting
ThunkAction<AppState> getUserAction = (Store<AppState> store) async {
  final prefs = await SharedPreferences.getInstance();
  final storedUserStr = prefs.getString('user');
  final storedUser =
      storedUserStr != null ? User.fromJson(json.decode(storedUserStr)) : null;
  store.dispatch(GetUserAction(storedUser));
};

/* Products Actions */
ThunkAction<AppState> getProductsAction = (Store<AppState> store) async {
  http.Response response = await http.get('http://localhost:1337/products');
  final List<dynamic> products = json.decode(response.body);
  store.dispatch(GetProductsAction(products));
};

class GetUserAction {
  final User _user;
  User get user => _user;
  GetUserAction(this._user);
}

class GetProductsAction {
  final List<dynamic> _products;
  List<dynamic> get products => _products;
  GetProductsAction(this._products);
}
