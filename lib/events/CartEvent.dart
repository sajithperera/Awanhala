import 'package:awanahala/models/CartModel.dart';

enum CartEventType {
  addItemsToCart,
  clearCart,
}

class CartEvent {
  CartModel cartModel;
  CartEventType cartEventType;

  CartEvent() {
    cartModel = CartModel(
      items: [],
    );
  }

  CartEvent.addItemsToCart(CartItem cartItem) {
    this.cartEventType = CartEventType.addItemsToCart;
    cartModel = CartModel();
    cartModel.items = [];

    this.cartModel.items.add(cartItem);
  }

  CartEvent.clearCart() {
    this.cartEventType = CartEventType.clearCart;
  }
}
