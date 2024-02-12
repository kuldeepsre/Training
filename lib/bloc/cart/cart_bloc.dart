import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dreambiztech/Pojo/product.dart';
import 'package:equatable/equatable.dart';
import 'package:dreambiztech/Pojo/cart.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<LoadProductCounter>((event, emit) async {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(const CartLoaded(cart: Cart()));
    });
    on<AddProduct>((event, emit) {
      if (state is CartLoaded) {
        final state = this.state as CartLoaded;
        emit(CartLoaded(
            cart: Cart(
                products: List.from(state.cart.products)..add(event.product))));
      }
    });
    on<RemoveProduct>((event, emit) {
      if (state is CartLoaded) {
        final state = this.state as CartLoaded;
        emit(CartLoaded(
            cart: Cart(
                products: List.from(state.cart.products)
                  ..remove(event.product))));
      }
    });
  }
}