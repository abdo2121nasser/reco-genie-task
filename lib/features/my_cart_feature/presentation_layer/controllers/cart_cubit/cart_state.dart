part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}
final class AddProductToCartLoadingState extends CartState {
  final ProductEntity productEntity;

  AddProductToCartLoadingState({required this.productEntity});

}
final class AddProductToCartSuccessState extends CartState {
  final ProductEntity productEntity;

  AddProductToCartSuccessState({required this.productEntity});
}
final class AddProductToCartErrorState extends CartState {
  final Failure error;

  AddProductToCartErrorState({required this.error});
}

