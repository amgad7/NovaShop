import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/home_screen/repo/home_repo.dart';
import 'package:meta/meta.dart';

import '../models/ProductsModel.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this._homeRepo) : super(ProductInitial());
  final HomeRepo _homeRepo;

  void getProducts() async {
    emit(ProductLoading());
    final response = await _homeRepo.getProducts();
    response.fold((l) => emit(ProductError(l)), (r) => emit(ProductSuccess(r)));
  }

  void getProductsCategories(String catName) async {
    emit(ProductLoading());
    final response = await _homeRepo.getProductsCategories(catName);
    response.fold((l) => emit(ProductError(l)), (r) => emit(ProductSuccess(r)));
  }
}
