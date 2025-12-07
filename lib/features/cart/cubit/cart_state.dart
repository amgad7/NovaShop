part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartLoaded extends CartState {
  final CartsModel cartsModel;
  CartLoaded(this.cartsModel);
}

final class CartError extends CartState {
  final String message;
  CartError(this.message);
}

final class CartAddToCart extends CartState {}

final class CartAddToCartSuccess extends CartState{
  final CartsModel cartsModel;
  CartAddToCartSuccess(this.cartsModel);

}

final class CartAddToCartError extends CartState {
  final String message;
  CartAddToCartError(this.message);
}

