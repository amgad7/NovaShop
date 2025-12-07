import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/cart/repo/cart_repo.dart';
import 'package:meta/meta.dart';

import '../../home_screen/models/ProductsModel.dart';
import '../models/cart_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this._cartRepo) : super(CartInitial());
  final CartRepo _cartRepo;

  Future<void> getCart(String id) async {
    emit(CartLoading());
    final res = await _cartRepo.getCart(id);
    res.fold(
      (l) => emit(CartError(l)),
      (r) => emit(CartLoaded(r)),
    );
  }

  Future<void> addToCart(String id, ProductsModel product,

      ) async {
    emit(CartAddToCart());
    final res = await _cartRepo.addToCart(id: id, product: product);
    res.fold(
      (l) => emit(CartAddToCartError(l)),
      (r) => emit(CartAddToCartSuccess(r)),
    );
  }
}
