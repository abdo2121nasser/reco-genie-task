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
        .collection(LogicStrings.kUserCollection).doc(userId).collection(
        LogicStrings.kCartCollection)
        .add(ProductModel.fromEntity(item).toJson());
  }
}