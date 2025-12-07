import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/networking/dio_helper.dart';

import '../../../core/networking/api_endpoints.dart';
import '../models/AddressModel.dart';

class AddressRepo {
  final DioHelper _dioHelper;

  AddressRepo(this._dioHelper);

  Future<Either<String, AddressModel>> getAddress(String id) async {
    final response =
        await _dioHelper.getRequest(endPoint: "${ApiEndpoints.address}/$id");
    try {
      AddressModel addressModel = AddressModel.fromJson(response.data);
      if (response.statusCode == 200) {
        return Right(addressModel);
      } else {
        return Left("Something went wrong");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
