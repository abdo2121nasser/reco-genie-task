import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reco_genie_task/features/my_cart_feature/presentation_layer/controllers/cart_cubit/cart_cubit.dart';
import 'package:reco_genie_task/features/shopping_feature/presentation_layer/controllers/productCubit/product_cubit.dart';
import 'package:reco_genie_task/features/shopping_feature/presentation_layer/widgets/shopping_body_widget.dart';

import '../../../../core/services/services_locator.dart';

class ShoppingBody extends StatelessWidget {
  const ShoppingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<ProductCubit>()..getAllProduct(),
        ),
        BlocProvider(
          create: (context) => sl<CartCubit>(),
        ),
      ],
      child: ShoppingBodyWidget(),
    );
  }
}
