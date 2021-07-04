/* User Actions */

import 'dart:convert';

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

class GetUserAction {
  final User _user;
  User get user => _user;
  GetUserAction(this._user);
}
