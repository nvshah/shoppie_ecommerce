import 'package:ecommerce_app_f2/models/app_state.dart';
import 'package:ecommerce_app_f2/models/user.dart';
import 'package:ecommerce_app_f2/redux/actions.dart';

AppState appReducer(AppState state, dynamic action) =>
    AppState(user: userReducer(state.user, action));

User userReducer(User user, dynamic action) {
  if (action is GetUserAction) {
    return action.user;
  }
  return user;
}
