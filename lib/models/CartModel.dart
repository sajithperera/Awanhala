class CartModel {
  int cusID; //id of the customer
  double price; //price of the order
  int quantity;
  List<CartItem> items;

  CartModel({
    this.cusID,
    this.price,
    this.quantity,
    this.items,
  });
}

class CartItem {
  String id; //id of the item
  double price; //price of the single item
  int qty; //quantity of items

  CartItem({
    this.id,
    this.price,
    this.qty,
  });
}
