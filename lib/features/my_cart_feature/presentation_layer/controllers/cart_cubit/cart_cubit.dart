import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:reco_genie_task/core/services/fire_base_failure_service.dart';
import 'package:reco_genie_task/features/my_cart_feature/domain_layer/use_cases/add_product_to_cart_use_case.dart';
import 'package:reco_genie_task/features/my_cart_feature/domain_layer/use_cases/get_my_cart_products_use_case.dart';
import 'package:reco_genie_task/features/my_cart_feature/domain_layer/use_cases/remove_product_from_cart_use_case.dart';

import '../../../../shopping_feature/domain_layer/entities/product_entity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit({
    required AddProductToCartUseCase addProductToCartUseCase,
    required GetMyCartProductsUseCase getMyCartProductsUseCase,
    required RemoveProductFromCartUseCase removeProductFromCartUseCase,
  })  : _addProductToCartUseCase = addProductToCartUseCase,
        _getMyCartProductsUseCase = getMyCartProductsUseCase,
        _removeProductFromCartUseCase = removeProductFromCartUseCase,
        super(CartInitial());

  final AddProductToCartUseCase _addProductToCartUseCase;
  final GetMyCartProductsUseCase _getMyCartProductsUseCase;
  final RemoveProductFromCartUseCase _removeProductFromCartUseCase;

  static CartCubit get(context) => BlocProvider.of(context);

  Future<void> addProductToCart({required ProductEntity item}) async {
    emit(AddProductToCartLoadingState(productEntity: item));
    var result = await _addProductToCartUseCase(item);
    result.fold((error) {
      emit(AddProductToCartErrorState(error: error));
    }, (success) {
      emit(AddProductToCartSuccessState(productEntity: item));
    });
  }

  Future<void> getMyCartProducts() async {
    emit(GetMyCartProductsLoadingState());
    var result = await _getMyCartProductsUseCase(null);
    result.fold((error) {
      emit(GetMyCartProductsErrorState(error: error));
    }, (success) {
      emit(GetMyCartProductsSuccessState(products: success));
    });
  }

  Future<void> removeProductFromCart({required ProductEntity item}) async {
    emit(RemoveProductFromCartLoadingState(productEntity: item));
    var result = await _removeProductFromCartUseCase(item);
    result.fold((error) {
      emit(RemoveProductFromCartErrorState(error: error));
    }, (success) {
      emit(RemoveProductFromCartSuccessState());
    });
  }
}
