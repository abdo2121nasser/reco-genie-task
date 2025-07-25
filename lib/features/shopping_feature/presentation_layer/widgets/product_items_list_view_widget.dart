import 'package:flutter/cupertino.dart';
import 'package:reco_genie_task/features/shopping_feature/domain_layer/entities/product_entity.dart';
import 'package:reco_genie_task/features/shopping_feature/presentation_layer/widgets/product_item_widget.dart';

import '../../../../core/utils/values/app_size.dart';

class ProductItemsListViewWidget extends StatelessWidget {
final  List<ProductEntity> items;
  const ProductItemsListViewWidget({
    super.key,
    required this.items
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: k20H,vertical: k20V),
        separatorBuilder: (context, index) => SizedBox(height: k14V,),
        itemBuilder: (context, index) => ProductItemWidget(product: items[index],),
        itemCount: items.length,
      ),
    );
  }
}