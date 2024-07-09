import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:ppdb/app/modules/widgets/main/custom_main_view.dart';
import 'package:ppdb/shared/shared_theme.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final textTheme = context.textTheme;

    return CustomMainView(
      actions: [
        IconButton(
          onPressed: controller.logout,
          icon: const Icon(Icons.exit_to_app_rounded),
        ),
        const Gap(4),
      ],
      isBack: false,
      builder: Column(
        children: [
          Obx(
            () => GridView.count(
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
          ),
          const Gap(16),
          (controller.isUser)
              ? Obx(
                  () {
                    String state = 'Data anda sedang ditinjau';
                    Color color = SharedTheme.darkInfoColor;
                    IconData icon = Icons.pending_rounded;

                    if (controller.isApproved.value &&
                        controller.isConfirmed.value) {
                      state = 'Pendaftaran anda disetujui';
                      color = Get.isDarkMode
                          ? SharedTheme.darkSuccessColor
                          : SharedTheme.lightSuccessColor;
                      icon = Icons.check_circle_rounded;
                    } else if (!controller.isApproved.value &&
                        controller.isConfirmed.value) {
                      state =
                          'Pendaftaran anda ditolak, cek dan pastikan kelengkapan berkas anda';
                      color = theme.colorScheme.error;
                      icon = Icons.clear_rounded;
                    }

                    return Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(color: color),
                      child: Row(
                        children: [
                          Icon(
                            icon,
                            color: Colors.white,
                          ),
                          const Gap(8),
                          Expanded(
                            child: Text(
                              state,
                              style: textTheme.labelLarge?.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              : Container(),
        ],
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
          iconSize: 42,
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
