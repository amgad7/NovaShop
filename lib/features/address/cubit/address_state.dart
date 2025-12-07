part of 'address_cubit.dart';

@immutable
sealed class AddressState {}

final class AddressInitial extends AddressState {}

final class AddressLoading extends AddressState {}

final class AddressLoaded extends AddressState {
  final AddressModel addressModel;
  AddressLoaded(this.addressModel);
}

final class AddressError extends AddressState {
  final String error;
  AddressError(this.error);
}
