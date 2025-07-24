import 'package:reco_genie_task/core/utils/values/app_size.dart';
import 'package:reco_genie_task/features/home_feature/presentation_layer/widgets/service_section/service_image_container_widget.dart';
import 'package:reco_genie_task/features/home_feature/presentation_layer/widgets/service_section/service_info_widget.dart';
import 'package:flutter/material.dart';

import '../../../domain_layer/entities/service_entity.dart';

class ServiceItemWidget extends StatelessWidget {
  final ServiceEntity service;
  const ServiceItemWidget({
    super.key, required this.service,
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [ServiceImageContainerWidget(imageLink:service.imageLink,),
        SizedBox(height: k5V,),
        ServiceInfoWidget(
        category: service.category,
        offer: service.offer,
      )],
    );
  }
}
