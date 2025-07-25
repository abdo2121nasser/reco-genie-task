import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:reco_genie_task/core/services/fire_base_failure_service.dart';
import 'package:reco_genie_task/features/my_cart_feature/domain_layer/use_cases/add_product_to_cart_use_case.dart';

import '../../../../shopping_feature/domain_layer/entities/product_entity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit({required this.addProductToCartUseCase}) : super(CartInitial());

  final AddProductToCartUseCase addProductToCartUseCase;

  static CartCubit get(context) => BlocProvider.of(context);

  Future<void> addProductToCart({required ProductEntity item}) async {
    emit(AddProductToCartLoadingState(productEntity: item));
    var result = await addProductToCartUseCase(item);
    result.fold((error) {
      emit(AddProductToCartErrorState(error: error));
    }, (success) {
      emit(AddProductToCartSuccessState(productEntity: item));
    });
  }
}
