import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:ppdb/app/data/socmed_model/socmed_model.dart';
import 'package:ppdb/app/modules/widgets/buttons/custom_outlined_button.dart';
import 'package:ppdb/app/modules/widgets/container_title/container_title.dart';
import 'package:ppdb/app/modules/widgets/main/custom_main_view.dart';

import '../controllers/socmed_controller.dart';

class SocmedView extends GetView<SocmedController> {
  const SocmedView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomMainView(
      isBack: true,
      builder: Column(
        children: [
          const ContainerTitle(title: 'Social Media'),
          const Gap(32),
          ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => builderButtonSocmed(
              controller.listSocmed[index],
            ),
            separatorBuilder: (context, index) => const Gap(12),
            itemCount: controller.listSocmed.length,
          ),
        ],
      ),
    );
  }

  Widget builderButtonSocmed(SocmedModel item) {
    return CustomOutlinedButton(
      onPressed: item.onPressed,
      icon: Image(
        image: item.icons.image,
        width: 25,
        height: 25,
      ),
      child: Text(item.title),
    );
  }
}
