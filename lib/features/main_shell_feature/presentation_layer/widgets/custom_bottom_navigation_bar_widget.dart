import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reco_genie_task/core/utils/colors/colors.dart';
import 'package:reco_genie_task/core/utils/constants/images.dart';
import 'package:reco_genie_task/core/utils/values/app_size.dart';
import 'package:reco_genie_task/features/main_shell_feature/presentation_layer/controllers/bottom_navigation_bar_bloc/bottom_navigation_bar_bloc.dart';

import '../../../../core/utils/constants/ui_strings.dart';

class CustomBottomNavigationBarWidget extends StatelessWidget {
  const CustomBottomNavigationBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBarBloc, BottomNavigationBarState>(
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: state.currentIndex,
          onTap: (index) {
            BottomNavigationBarBloc.get(context)
                .add(ChangeBodyEvent(index: index));
          },
          items: [
            BottomNavigationBarItem(
              activeIcon: Image.asset(
                kNawelImage,
                width: k40H,
                height: k40V,
              ),
              icon: const Icon(
                CupertinoIcons.home,
                color: kBlackColor,
              ),
              label: UiStrings.kHomeWord,
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket),
              label: UiStrings.kShoppingWord,
            ),const BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.shopping_cart),
              label: UiStrings.kMyCartWord,
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.local_shipping),
              label: UiStrings.kDeliverWord,
            ),

            const BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person),
              label: UiStrings.kProfileWord,
            ),
          ],
        );
      },
    );
  }
}
