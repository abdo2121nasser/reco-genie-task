import 'package:flutter/material.dart';
import 'package:reco_genie_task/core/utils/component/general_cashed_image_widget.dart';
import 'package:reco_genie_task/core/utils/values/app_size.dart';

class ProductImageWidget extends StatelessWidget {
  final String imageLink;
  const ProductImageWidget({
    super.key,
    required this.imageLink
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(k10R),
      child: SizedBox(
        width: k120H,
        height: k100V,
        child: GeneralCashedImageWidget(
          link:imageLink
        ),
      ),
    );
  }
}
