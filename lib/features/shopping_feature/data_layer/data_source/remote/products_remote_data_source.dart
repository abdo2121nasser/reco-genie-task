import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reco_genie_task/core/utils/constants/logic_strings.dart';
import 'package:reco_genie_task/features/shopping_feature/data_layer/models/product_model.dart';
import 'package:reco_genie_task/features/shopping_feature/domain_layer/entities/product_entity.dart';

import '../../../../../core/services/exceptions_service.dart';
import 'base_data_source/base_products_remote_data_source.dart';

class ProductsRemoteDataSource extends BaseProductsRemoteDataSource {
  @override
  Future<List<ProductEntity>> getAllProducts() async {
    final result = await FirebaseFirestore.instance
        .collection(LogicStrings.kProductsCollection)
        .get();
    if (result.docs.isNotEmpty) {
      return result.docs
          .map(
            (e) {
              return ProductModel.fromJson(e.data());
            },
          )
          .toList();
    } else {
      throw const ServerException(
          errorMessage: LogicStrings.kEmptyListErrorMessage);
    }
  }
}
