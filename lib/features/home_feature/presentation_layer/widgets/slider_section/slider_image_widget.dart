import 'package:reco_genie_task/core/utils/component/general_cashed_image_widget.dart';
import 'package:reco_genie_task/core/utils/values/app_size.dart';
import 'package:flutter/material.dart';

class SliderImageWidget extends StatelessWidget {
  final String imagePath;

  const SliderImageWidget({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: k14H,vertical: k14V),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(k14R),
        child: GeneralCashedImageWidget(
          link:  imagePath,

        ),
      ),
    );
  }
}
