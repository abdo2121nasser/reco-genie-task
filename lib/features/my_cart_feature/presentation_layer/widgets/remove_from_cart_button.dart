import 'package:flutter/material.dart';
import 'package:reco_genie_task/core/utils/colors/colors.dart';
import 'package:reco_genie_task/core/utils/constants/ui_strings.dart';
import 'package:reco_genie_task/core/utils/text_styles/style_manager.dart';
import 'package:reco_genie_task/core/utils/values/app_size.dart';
import 'package:reco_genie_task/features/my_cart_feature/presentation_layer/controllers/cart_cubit/cart_cubit.dart';
import 'package:reco_genie_task/features/shopping_feature/domain_layer/entities/product_entity.dart';

class RemoveFromCartButton extends StatelessWidget {
  final ProductEntity item;
  const RemoveFromCartButton({
    super.key,
    required this.item
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: k40V,
      child: TextButton(
        onPressed: () {
          CartCubit.get(context).removeProductFromCart(item: item);
        },
        style: TextButton.styleFrom(
          backgroundColor: kPurpleColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(k10R),
          ),
          padding: EdgeInsets.symmetric(horizontal: k10H, vertical: k5V),
        ),
        child: Text(
          UiStrings.kRemoveWord,
          style: AppTextStyles.dmSansBold16(color: kWhiteColor),
        ),
      ),
    );
  }
}
