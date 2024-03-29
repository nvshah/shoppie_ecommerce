import 'package:ecommerce_app_f2/models/app_state.dart';
import 'package:ecommerce_app_f2/models/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ProductItem extends StatelessWidget {
  final Product item;
  ProductItem({@required this.item});
  @override
  Widget build(BuildContext context) {
    final pictureUrl = 'http://localhost:1337${item.picture['url']}';
    return GridTile(
      child: Image.network(pictureUrl, fit: BoxFit.cover),
      footer: GridTileBar(
        title: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,
          child: Text(
            item.name,
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        subtitle: Text(
          '\$${item.price}',
          style: TextStyle(fontSize: 16.0),
        ),
        backgroundColor: Color(0xBB000000),
        trailing: StoreConnector<AppState, AppState>(
          converter: (store) => store.state,
          builder: (_, state) {
            return state.user != null
                ? IconButton(
                    icon: Icon(Icons.shopping_bag),
                    color: Colors.cyan,
                    onPressed: () {
                      //TODO : OnPress Cart/Bag button
                    })
                : SizedBox();
          },
        ),
      ),
    );
  }
}
