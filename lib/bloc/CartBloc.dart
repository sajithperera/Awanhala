import 'package:awanahala/events/CartEvent.dart';
import 'package:awanahala/models/CartModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class CartBloc extends Bloc<CartEvent, CartModel> {
  CartBloc(CartModel cartModel)
      : super(CartModel(
            cusID: Hive.box('user').get('id'),
            items: [],
            price: 0,
            quantity: 0));
  @override
  Stream<CartModel> mapEventToState(event) async* {
    switch (event.cartEventType) {
      case CartEventType.addItemsToCart:
        CartModel cartModel = state;

        for (var i = 0; i < event.cartModel.items.length; i++) {
          cartModel.items.add(event.cartModel.items[i]);
          cartModel.price = cartModel.price +
              (event.cartModel.items[i].price) * event.cartModel.items[i].qty;

          cartModel.quantity =
              cartModel.quantity + event.cartModel.items[i].qty;
        }

        yield cartModel;

        break;

      case CartEventType.clearCart:
        CartModel cartModel = state;
        cartModel.items = [];
        cartModel.price = 0;
        cartModel.quantity = 0;

        yield cartModel;
        break;

      default:
    }
  }
}
