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

final class GetMyCartProductsLoadingState extends CartState {}

final class GetMyCartProductsSuccessState extends CartState {
  final List<ProductEntity> products;

  GetMyCartProductsSuccessState({required this.products});
}

final class GetMyCartProductsErrorState extends CartState {
  final Failure error;

  GetMyCartProductsErrorState({required this.error});
}

final class RemoveProductFromCartLoadingState extends CartState {
  final ProductEntity productEntity;
  RemoveProductFromCartLoadingState({required this.productEntity});
}

final class RemoveProductFromCartSuccessState extends CartState {

}

final class RemoveProductFromCartErrorState extends CartState {
  final Failure error;

  RemoveProductFromCartErrorState({required this.error});
}