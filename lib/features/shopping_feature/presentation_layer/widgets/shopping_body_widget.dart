import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reco_genie_task/core/utils/constants/ui_strings.dart';
import 'package:reco_genie_task/core/utils/text_styles/style_manager.dart';
import 'package:reco_genie_task/core/utils/values/app_size.dart';
import 'package:reco_genie_task/features/shopping_feature/presentation_layer/controllers/productCubit/product_cubit.dart';
import 'package:reco_genie_task/features/shopping_feature/presentation_layer/widgets/product_items_list_view_widget.dart';

class ShoppingBodyWidget extends StatelessWidget {
  const ShoppingBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const MultiBlocListenersWidget(),

        SizedBox(
          height: k20V,
        ),
        Text(
          UiStrings.kShoppingWord,
          style: AppTextStyles.dmSansBold20(),
        ),
        BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state is GetAllProductsLoadingState) {
              return Expanded(
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (state is GetAllProductsSuccessState) {
              return ProductItemsListViewWidget(
                items: state.products,
              );
            } else if (state is GetAllProductsErrorState) {
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
    );
  }
}
