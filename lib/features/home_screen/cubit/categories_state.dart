part of 'categories_cubit.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoading extends CategoriesState {}

final class CategoriesSuccess extends CategoriesState {
  final List<String> categories;

  CategoriesSuccess(this.categories);
}

final class CategoriesError extends CategoriesState {
  final String error;

  CategoriesError(this.error);
}

