import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/AddressModel.dart';
import '../repo/address_repo.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  final AddressRepo _addressRepo;
  AddressCubit(this._addressRepo) : super(AddressInitial());

  Future<void> getAddress(String id) async {
    emit(AddressLoading());
    final res = await _addressRepo.getAddress(id);
    res.fold(
      (l) {
        emit(AddressError(l));
      },
      (r) {
        emit(AddressLoaded(r));
      },
    );
  }
}
