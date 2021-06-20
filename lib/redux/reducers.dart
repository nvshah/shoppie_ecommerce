import 'package:ecommerce_app_f2/models/app_state.dart';
import 'package:ecommerce_app_f2/redux/actions.dart';

AppState appReducer(state, action) =>
    AppState(user: userReducer(state.user, action));

userReducer(user, action) {
  if (action is GetUserAction) {
    return action.user;
  }
  return user;
}
