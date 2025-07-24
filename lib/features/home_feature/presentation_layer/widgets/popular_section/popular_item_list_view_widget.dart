import 'package:reco_genie_task/features/home_feature/domain_layer/entities/popular_entity.dart';
import 'package:reco_genie_task/features/home_feature/presentation_layer/widgets/popular_section/popular_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/values/app_size.dart';

class PopularItemListViewWidget extends StatelessWidget {
  final List<PopularEntity> populars;
  const PopularItemListViewWidget({super.key, required this.populars});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: k130V,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => PopularItemWidget(popularEntity: populars[index],),
        separatorBuilder: (context, index) => SizedBox(
          width: k5H,
        ),
        itemCount: populars.length,
      ),
    );
  }
}
