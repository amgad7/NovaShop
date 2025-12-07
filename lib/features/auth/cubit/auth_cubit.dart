import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/utils/storage_helper.dart';
import 'package:meta/meta.dart';

import '../../../core/utils/service_locator.dart';
import '../models/login_resoponse_model.dart';
import '../repo/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepo) : super(AuthInitial());

  final AuthRepo _authRepo;

  void login(String username, String password) async {
    emit(AuthLoadingState());
    final Either<String, LoginResponseModel> res =
        await _authRepo.login(username, password);
    res.fold(
      (l) => emit(AuthErrorState(l)),
      (r) => emit(AuthSuccessState("Login Successfully")),
    );
  }

  void logout(){
    sl<StorageHelper>().deleteToken();
  }
}
