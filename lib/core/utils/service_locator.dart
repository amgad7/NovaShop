import 'package:ecommerce_app/core/networking/dio_helper.dart';
import 'package:ecommerce_app/core/utils/storage_helper.dart';
import 'package:ecommerce_app/features/address/repo/address_repo.dart';
import 'package:ecommerce_app/features/home_screen/cubit/product_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../features/address/cubit/address_cubit.dart';
import '../../features/auth/cubit/auth_cubit.dart';
import '../../features/auth/repo/auth_repo.dart';
import '../../features/cart/cubit/cart_cubit.dart';
import '../../features/cart/repo/cart_repo.dart';
import '../../features/home_screen/cubit/categories_cubit.dart';
import '../../features/home_screen/repo/home_repo.dart';

GetIt sl = GetIt.instance;

void setupServiceLocator() {
  DioHelper dio = DioHelper();

  sl.registerSingleton<DioHelper>(dio);

  sl.registerLazySingleton(() => StorageHelper());

  sl.registerLazySingleton(() => AuthRepo(sl()));
  sl.registerLazySingleton(() => HomeRepo(sl()));
  sl.registerLazySingleton(() => AddressRepo(sl()));
  sl.registerLazySingleton(() => CartRepo(sl()));

  sl.registerFactory(() => AuthCubit(sl()));
  sl.registerFactory(() => ProductCubit(sl()));
  sl.registerFactory(() => CategoriesCubit(sl()));
  sl.registerFactory(() => CartCubit(sl()));
  sl.registerFactory(() => AddressCubit(sl()));
}
