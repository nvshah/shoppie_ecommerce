import 'package:ecommerce_app_f2/redux/actions.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux_logging/redux_logging.dart';

import 'package:ecommerce_app_f2/pages/login_page.dart';
import 'package:ecommerce_app_f2/pages/products_page.dart';
import 'package:ecommerce_app_f2/pages/register_page.dart';
import 'package:ecommerce_app_f2/redux/reducers.dart';
import 'package:flutter/material.dart';

import 'models/app_state.dart';

void main() {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: [thunkMiddleware, LoggingMiddleware.printer()],
  );
  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp({this.store});
  @override
  Widget build(BuildContext context) {
    //Inorder to provide redux store to app
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.teal,
          accentColor: Colors.greenAccent,
          brightness: Brightness.dark,
          textTheme: TextTheme(
            headline5: TextStyle(fontSize: 64.0, fontWeight: FontWeight.w600),
            headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            bodyText1: TextStyle(fontSize: 18.0),
          ),
        ),
        routes: {
          RegisterPage.routeName: (context) => RegisterPage(),
          LoginPage.routeName: (context) => LoginPage(),
          ProductsPage.routeName: (context) => ProductsPage(
                onInit: () {
                  StoreProvider.of<AppState>(context).dispatch(getUserAction);
                  StoreProvider.of<AppState>(context)
                      .dispatch(getProductsAction);
                },
              ),
        },
        //home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
