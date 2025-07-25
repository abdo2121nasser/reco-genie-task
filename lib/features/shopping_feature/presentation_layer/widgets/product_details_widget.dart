
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reco_genie_task/core/utils/colors/colors.dart';
import 'package:reco_genie_task/core/utils/component/general_cashed_image_widget.dart';
import 'package:reco_genie_task/core/utils/constants/ui_strings.dart';
import 'package:reco_genie_task/core/utils/text_styles/style_manager.dart';
import 'package:reco_genie_task/core/utils/values/app_size.dart';
import 'package:reco_genie_task/features/shopping_feature/domain_layer/entities/product_entity.dart';

class ProductDetailsWidget extends StatelessWidget {
  final ProductEntity product;
  const ProductDetailsWidget({super.key,required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.label,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.dmSansBold20(),
        ),
        Text(
          "Price: ${product.price}\$",
          style: AppTextStyles.dmSansBold16(),
        ),
      ],
    );
  }
}
