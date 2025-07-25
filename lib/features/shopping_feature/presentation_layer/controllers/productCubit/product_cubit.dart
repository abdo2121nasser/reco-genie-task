import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:reco_genie_task/features/shopping_feature/domain_layer/entities/product_entity.dart';
import 'package:reco_genie_task/features/shopping_feature/domain_layer/use_cases/get_all_products_use_case.dart';

import '../../../../../core/services/fire_base_failure_service.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit({required GetAllProductsUseCase getAllProductsUseCase})
      : _getAllProductsUseCase = getAllProductsUseCase,
        super(ProductInitial());

  final GetAllProductsUseCase _getAllProductsUseCase;

  static ProductCubit get(context) => BlocProvider.of(context);

  getAllProduct() async {
    emit(GetAllProductsLoadingState());

    final result = await _getAllProductsUseCase(null);

    result.fold(
      (failure) {
        emit(GetAllProductsErrorState(error: failure));
        print(failure.devMessage);
      },
      (products) {
        emit(GetAllProductsSuccessState(products: products));
      },
    );
  }
}
