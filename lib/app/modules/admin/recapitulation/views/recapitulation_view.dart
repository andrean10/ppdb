import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../../helpers/text_helper.dart';
import '../../../widgets/container_title/container_title.dart';
import '../../../widgets/main/custom_main_view_2.dart';
import '../controllers/recapitulation_controller.dart';

class RecapitulationView extends GetView<RecapitulationController> {
  const RecapitulationView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return CustomMainView2(
      child: Column(
        children: [
          const ContainerTitle(title: 'Rekapitulasi'),
          const Gap(32),
          StreamBuilder(
            stream: controller.fetchUser(),
            builder: (context, snapshot) {
              Logger().d('debug: snapshot = $snapshot');

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }

              if (snapshot.hasError && snapshot.error != null) {
                return const Center(
                  child: AutoSizeText('Ada kesalahan saat mengambil data user'),
                );
              }

              if (snapshot.hasData && snapshot.data != null) {
                final dataProfile = snapshot.data!;

                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => const Gap(12),
                  itemBuilder: (context, index) {
                    final profile = dataProfile[index];
                    final form = profile.formSiswa;

                    return ListTile(
                      leading: const Icon(
                        Icons.account_circle_rounded,
                        size: 42,
                      ),
                      title:
                          Text(TextHelper.capitalizeEachWord(form?.fullName)),
                      titleTextStyle: textTheme.titleLarge,
                      onTap: () => controller.moveToDetailCandidates(profile),
                    );
                  },
                  itemCount: dataProfile.length,
                );
              }

              if (snapshot.hasData) {
                return const Center(
                  child: AutoSizeText('Belum ada data kandidat'),
                );
              }

              return const Center(child: AutoSizeText('Data tidak ditemukan'));
            },
          ),
        ],
      ),
    );
  }
}
