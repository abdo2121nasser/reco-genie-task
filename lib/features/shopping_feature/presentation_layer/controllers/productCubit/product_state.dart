part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class GetAllProductsLoadingState extends ProductState {}

final class GetAllProductsSuccessState extends ProductState {
  final List<ProductEntity> products;

  GetAllProductsSuccessState({required this.products});
}

final class GetAllProductsErrorState extends ProductState {
  final Failure error;

  GetAllProductsErrorState({required this.error});
}
