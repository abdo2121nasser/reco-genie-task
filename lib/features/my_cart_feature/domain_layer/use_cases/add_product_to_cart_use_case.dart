import 'package:reco_genie_task/core/services/fire_base_failure_service.dart';
import 'package:reco_genie_task/core/utils/usecase/base_usecase.dart';
import 'package:reco_genie_task/features/home_feature/domain_layer/reposities/base_service_repository.dart';
import 'package:either_dart/src/either.dart';
import 'package:reco_genie_task/features/my_cart_feature/domain_layer/reposities/base_cart_repository.dart';
import 'package:reco_genie_task/features/shopping_feature/domain_layer/entities/product_entity.dart';
import 'package:reco_genie_task/features/shopping_feature/domain_layer/reposities/base_product_repository.dart';


class AddProductToCartUseCase extends BaseUseCase<void, ProductEntity> {
  final BaseCartRepository baseCartRepository;

  AddProductToCartUseCase({required this.baseCartRepository});

  @override
  Future<Either<Failure,void>> call(ProductEntity object) async {
    return await baseCartRepository.addProduct(item: object);
  }

}
