import 'package:ecommerce_app_f2/global_props.dart';
import 'package:ecommerce_app_f2/models/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ProductsPage extends StatefulWidget {
  static const routeName = '/products';

  final void Function() onInit;

  ProductsPage({@required this.onInit});

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  void initState() {
    super.initState();
    widget.onInit?.call();
  }

  /*Future<void> _getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final storedUserStr = prefs.getString('user');
    final storedUser = json.decode(storedUserStr);
  }*/

  final _appBar = PreferredSize(
    preferredSize: Size.fromHeight(60.0),
    child: StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        return AppBar(
          centerTitle: true,
          leading: Icon(Icons.store),
          title: SizedBox(
            child: Text(state.user?.username ?? ''),
          ),
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 12.0),
                child: state.user != null
                    ? IconButton(
                        icon: Icon(Icons.exit_to_app),
                        onPressed: () {
                          //TODO: Exit To APP
                        })
                    : SizedBox()),
          ],
        );
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    // return StoreConnector<AppState, AppState>(
    //   builder: (context, state) =>
    //       state.user != null ? Text('${state.user.username}') : Text(' '),
    //   converter: (store) => store.state,
    // );
    return Scaffold(
      appBar: _appBar,
      body: Container(
        decoration: gradientBgBoxDecoration,
        child: Text('data'),
      ),
    );
  }
}
