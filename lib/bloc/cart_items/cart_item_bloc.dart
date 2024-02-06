import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dreambiztech/Pojo/product.dart';
import 'package:meta/meta.dart';

part 'cart_item_event.dart';
part 'cart_item_state.dart';


class ShoppingCartBloc extends Bloc<CartItemEvent, CartItemState> {
  ShoppingCartBloc() : super(CartItemState([]));

  @override
  Stream<CartItemState> mapEventToState(CartItemEvent event) async* {
    if (event is AddToCartItemEvent) {
      final updatedCart = List.from(state.cartItems)..add(event.product);
    //  yield CartItemState(updatedCart);
    } else if (event is RemoveFromCartItemEvent) {
      final updatedCart = List.from(state.cartItems)
        ..removeWhere((item) => item.id == event.productId);
     // yield CartItemState(updatedCart);
    }
  }
}