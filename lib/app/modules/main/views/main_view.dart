import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:ppdb/app/modules/widgets/main/custom_main_view.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return CustomMainView(
      actions: [
        IconButton(
          onPressed: controller.moveToProfile,
          icon: const Icon(Icons.person_rounded),
        ),
      ],
      isBack: false,
      builder: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 21,
        crossAxisSpacing: 16,
        shrinkWrap: true,
        children: controller.listMenu.map(
          (menu) {
            return builderItemMenu(
              textTheme: textTheme,
              icon: menu.icon,
              title: menu.title,
              onPressed: menu.onPressed,
            );
          },
        ).toList(),
      ),
    );
  }

  Widget builderItemMenu({
    required TextTheme textTheme,
    required IconData icon,
    required String title,
    required Function() onPressed,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton.filledTonal(
          onPressed: onPressed,
          iconSize: 52,
          icon: Icon(icon),
        ),
        const Gap(8),
        AutoSizeText(
          title,
          style: textTheme.labelLarge,
          maxLines: 1,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
