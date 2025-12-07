import 'package:ecommerce_app/core/routing/app_routes.dart';
import 'package:ecommerce_app/features/address/address_screen.dart';
import 'package:ecommerce_app/features/auth/cubit/auth_cubit.dart';
import 'package:ecommerce_app/features/auth/login_screen.dart';
import 'package:ecommerce_app/features/auth/register_screen.dart';
import 'package:ecommerce_app/features/cart/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/main_screen/main_screen.dart';
import 'package:ecommerce_app/features/product_screen/product_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:go_transitions/go_transitions.dart';

import '../../features/address/cubit/address_cubit.dart';
import '../../features/home_screen/models/ProductsModel.dart';
import '../../features/splash_screen/splash_screen.dart';
import '../utils/service_locator.dart';

class RouterGenerationConfig {
  static GoRouter goRouter =
      GoRouter(initialLocation: AppRoutes.splashScreen, routes: [
    GoRoute(
      name: AppRoutes.splashScreen,
      path: AppRoutes.splashScreen,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      name: AppRoutes.loginScreen,
      path: AppRoutes.loginScreen,
      builder: (context, state) => BlocProvider(
        create: (context) => sl<AuthCubit>(),
        child: LoginScreen(),
      ),
    ),
    GoRoute(
      name: AppRoutes.registerScreen,
      path: AppRoutes.registerScreen,
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      name: AppRoutes.mainScreen,
      path: AppRoutes.mainScreen,
      builder: (context, state) => BlocProvider(
        create: (context) => sl<CartCubit>(),
        child: MainScreen(),
      ),
    ),
    GoRoute(
        name: AppRoutes.productScreen,
        path: AppRoutes.productScreen,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => sl<CartCubit>(),
            child: ProductScreen(products: state.extra as ProductsModel),
          );
        }),
    GoRoute(
      name: AppRoutes.addressScreen,
      path: AppRoutes.addressScreen,
      builder: (context, state) => BlocProvider(
        create: (context) => sl<AddressCubit>()..getAddress("2"),
        child: AddressScreen(),
      ),
    ),
  ]);
}
