import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reco_genie_task/core/utils/constants/ui_strings.dart';
import 'package:reco_genie_task/core/utils/text_styles/style_manager.dart';
import 'package:reco_genie_task/core/utils/values/app_size.dart';
import 'package:reco_genie_task/features/my_cart_feature/presentation_layer/controllers/cart_cubit/cart_cubit.dart';
import 'package:reco_genie_task/features/shopping_feature/presentation_layer/widgets/product_items_list_view_widget.dart';


class MyCartBodyWidget extends StatelessWidget {
  const MyCartBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is RemoveProductFromCartSuccessState) {
          CartCubit.get(context).getMyCartProducts();
        }
      },
      child: Column(
fi        children: [
          SizedBox(
            height: k20V,
            width: double.maxFinite,
          ),
          Text(
            UiStrings.kMyCartWord,
            style: AppTextStyles.dmSansBold20(),
          ),
          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              if (state is GetMyCartProductsLoadingState ) {
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (state is GetMyCartProductsSuccessState) {
                return ProductItemsListViewWidget(
                  items: state.products,
                  isAddToCartButton: false,
                );
              } else if (state is GetMyCartProductsErrorState) {
                return Center(
                  child: Text(
                    state.error.userMessage,
                    style: AppTextStyles.dmSansBold20(),
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}
