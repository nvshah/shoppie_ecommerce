import 'package:ecommerce_app_f2/models/app_state.dart';
import 'package:ecommerce_app_f2/models/products.dart';
import 'package:ecommerce_app_f2/models/user.dart';
import 'package:ecommerce_app_f2/redux/actions.dart';

/// reducer decide state based on action inp
AppState appReducer(AppState state, dynamic action) => AppState(
      user: userReducer(state.user, action),
      products: productsReducer(state.products, action),
    );

User userReducer(User user, dynamic action) {
  if (action is GetUserAction) {
    return action.user;
  }
  return user;
}

List<Product> productsReducer(List<Product> products, dynamic action) {
  if (action is GetProductsAction) {
    return action.products;
  }
  return products;
}
