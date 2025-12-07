import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/networking/api_endpoints.dart';
import 'package:ecommerce_app/core/networking/dio_helper.dart';
import 'package:ecommerce_app/features/cart/models/cart_model.dart';
import 'package:ecommerce_app/features/home_screen/models/ProductsModel.dart';

class CartRepo {
  final DioHelper _dioHelper;
  CartRepo(this._dioHelper);

  Future<Either<String, CartsModel>> getCart(String id) async {
    final response =
        await _dioHelper.getRequest(endPoint: "${ApiEndpoints.carts}/$id");
    try {
      if (response.statusCode == 200) {
        return Right(CartsModel.fromJson(response.data));
      } else {
        return Left("Something went wrong");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, CartsModel>> addToCart({
    required String id,
    required ProductsModel product,
  }) async {
    try {
      final response = await _dioHelper
          .putRequest(endPoint: "${ApiEndpoints.carts}/$id", data: {
        "id": id,
        "userId": 1,
        "products": [
          {
            "id": product.id,
            "title": product.title,
            "price": product.price.toString(),
            "description": product.description,
            "category": product.category,
            "image": product.image,
          }
        ]
      });
      CartsModel cartsModel = CartsModel.fromJson(response.data);
      if (response.statusCode == 200) {
        return Right(cartsModel);
      } else {
        return Left("Something went wrong");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
