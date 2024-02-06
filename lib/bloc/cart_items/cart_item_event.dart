part of 'cart_item_bloc.dart';

@immutable
abstract class CartItemEvent {}


class AddToCartItemEvent extends CartItemEvent {
 // final Product product;
  final List<Product> product;
  AddToCartItemEvent(this.product);
}

class RemoveFromCartItemEvent extends CartItemEvent {
  final int productId;

  RemoveFromCartItemEvent(this.productId);
}
