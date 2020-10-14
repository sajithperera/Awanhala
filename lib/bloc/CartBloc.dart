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

        //if the item alredy exist in the cart we have to increase its count rather than adding it as a separate item
        CartModel cartModelInEvent = event.cartModel;

        if (cartModel.items.length == 0) {
          cartModel.items.add(event.cartModel.items.first);
        } else {
          for (var i = 0; i < cartModel.items.length; i++) {
            if (cartModel.items[i].id == cartModelInEvent.items.first.id) {
              //item already exist in the cart
              //so we have to increment its count
              cartModel.items[i].qty += cartModelInEvent.items.first.qty;
            } else {
              cartModel.items.add(event.cartModel.items.first);
            }
          }
        }

        cartModel.price = cartModel.price +
            (event.cartModel.items.first.price) *
                event.cartModel.items.first.qty;

        cartModel.quantity =
            cartModel.quantity + event.cartModel.items.first.qty;

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
