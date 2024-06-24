import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:ppdb/app/data/socmed_model/socmed_model.dart';
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
          const Gap(32),
        ],
      ),
    );
  }

  Widget builderButtonSocmed(SocmedModel item) {
    return FilledButton.tonalIcon(
      onPressed: item.onPressed,
      label: Text(item.title),
      icon: Padding(
        padding: const EdgeInsets.all(4),
        child: Image(
          image: item.icons.image,
          width: 50,
          height: 50,
        ),
      ),
    );
  }
}
