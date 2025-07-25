import 'package:reco_genie_task/features/home_feature/domain_layer/entities/service_entity.dart';
import 'package:reco_genie_task/features/shopping_feature/domain_layer/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required super.imageUrl,
    required super.label,
    required super.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      imageUrl: json['imageLink'],
      price: json['price'],
      label: json['label'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imageLink': imageUrl,
      'label': label,
      'price': price,
    };
  }
  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      imageUrl: entity.imageUrl,
      price: entity.price,
      label: entity.label,
    );
  }
}
