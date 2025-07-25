import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:reco_genie_task/core/utils/constants/logic_strings.dart';
import 'package:reco_genie_task/features/shopping_feature/data_layer/models/product_model.dart';
import 'package:reco_genie_task/features/shopping_feature/domain_layer/entities/product_entity.dart';

import '../../../../../core/services/exceptions_service.dart';
import 'base_data_source/base_cart_remote_data_source.dart';

class CartRemoteDataSource extends BaseCartRemoteDataSource {
  @override
  Future<void> addProduct(ProductEntity item) async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection(LogicStrings.kUserCollection)
        .doc(userId)
        .collection(LogicStrings.kCartCollection)
        .add(ProductModel.fromEntity(item).toJson());
  }

  @override
  Future<List<ProductEntity>> getMyCartProducts() async {
    String userId = FirebaseAuth.instance.currentUser!.uid;

    final result = await FirebaseFirestore.instance
        .collection(LogicStrings.kUserCollection)
        .doc(userId)
        .collection(LogicStrings.kCartCollection)
        .get();
    if (result.docs.isNotEmpty) {
      return result.docs.map(
        (e) {
          return ProductModel.fromJson(e.data(), e.id);
        },
      ).toList();
    } else {
      throw const ServerException(
          errorMessage: LogicStrings.kEmptyListErrorMessage);
    }
  }

  @override
  Future<void> removeProduct(ProductEntity item) async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection(LogicStrings.kUserCollection)
        .doc(userId)
        .collection(LogicStrings.kCartCollection)
        .doc(item.id).delete();
  }
}