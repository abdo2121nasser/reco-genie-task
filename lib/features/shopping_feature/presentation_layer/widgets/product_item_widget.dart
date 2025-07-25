import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reco_genie_task/core/utils/colors/colors.dart';
import 'package:reco_genie_task/core/utils/values/app_size.dart';
import 'package:reco_genie_task/features/my_cart_feature/presentation_layer/controllers/cart_cubit/cart_cubit.dart';
import 'package:reco_genie_task/features/my_cart_feature/presentation_layer/widgets/remove_from_cart_button.dart';
import 'package:reco_genie_task/features/shopping_feature/presentation_layer/widgets/product_details_widget.dart';
import 'package:reco_genie_task/features/shopping_feature/presentation_layer/widgets/product_image_widget.dart';

import '../../domain_layer/entities/product_entity.dart';
import 'add_to_cart_button_widget.dart';

class ProductItemWidget extends StatelessWidget {
  final bool isAddToCartButton;
  final ProductEntity product;

  const ProductItemWidget(
      {super.key, required this.product, required this.isAddToCartButton});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: k10H, vertical: k10V),
      height: k140V,
      decoration: BoxDecoration(
        color: kDarkWhiteColor,
        borderRadius: BorderRadius.circular(k10R),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductImageWidget(imageLink: product.imageUrl,),
          SizedBox(width: k10H),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductDetailsWidget(product: product,),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomRight,
                  child:
                  BlocBuilder<CartCubit, CartState>(
                    builder: (context, state) {
                      if (state is AddProductToCartLoadingState &&
                              state.productEntity == product ||
                          state is RemoveProductFromCartLoadingState &&
                              state.productEntity == product) {
                        return const CircularProgressIndicator();
                      } else {
                        return isAddToCartButton
                            ? AddToCartButtonWidget(
                                item: product,
                              )
                            : RemoveFromCartButton(item: product);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
