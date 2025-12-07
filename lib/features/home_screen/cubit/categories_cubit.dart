import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/home_screen/repo/home_repo.dart';
import 'package:meta/meta.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this._homeRepo) : super(CategoriesInitial());
  final HomeRepo _homeRepo;
  void categories() async {
    emit(CategoriesLoading());
    final response = await _homeRepo.getCategories();
    response.fold(
        (l) => emit(CategoriesError(l)), (r) => emit(CategoriesSuccess(r)));
  }
}
