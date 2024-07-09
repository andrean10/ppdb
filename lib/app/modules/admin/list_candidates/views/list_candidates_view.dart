import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:ppdb/app/data/user_model/users_model.dart';
import 'package:ppdb/app/helpers/text_helper.dart';
import 'package:ppdb/shared/shared_theme.dart';

import '../../../widgets/container_title/container_title.dart';
import '../../../widgets/main/custom_main_view_2.dart';
import '../controllers/list_candidates_controller.dart';

class ListCandidatesView extends GetView<ListCandidatesController> {
  const ListCandidatesView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final textTheme = context.textTheme;

    return CustomMainView2(
      child: Column(
        children: [
          const ContainerTitle(title: 'Daftar Calon'),
          const Gap(32),
          StreamBuilder(
            stream: controller.fetchCandidates(),
            builder: (context, snapshot) {
              Logger().d('debug: snapshot = ${snapshot.connectionState}');
              Logger().d('debug: snapshot = ${snapshot.toString()}');

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }

              if (snapshot.hasError && snapshot.error != null) {
                Logger().e(
                  'Error: ',
                  error: snapshot.error,
                  stackTrace: snapshot.stackTrace,
                );

                return const Center(
                  child: AutoSizeText('Ada kesalahan saat mengambil data user'),
                );
              }

              if (snapshot.hasData && snapshot.data != null) {
                final dataProfile = snapshot.data!;

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final profile = dataProfile[index];
                    final user = profile.user;
                    final form = profile.formSiswa;

                    return ListTile(
                      leading: const Icon(
                        Icons.account_circle_rounded,
                        size: 42,
                      ),
                      title:
                          Text(TextHelper.capitalizeEachWord(form?.fullName)),
                      subtitle: builderState(
                        theme: theme,
                        user: user,
                      ),
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

  Widget builderState({
    required ThemeData theme,
    required UsersModel user,
  }) {
    final textTheme = theme.textTheme;

    WidgetStatePropertyAll<Color> color;
    String text;
    Color textColor;

    // jika user sudah dikonfirmasi status bisa diterima atau ditolak
    if (user.isConfirmed!) {
      if (user.isApproved!) {
        color = WidgetStatePropertyAll(
          Get.isDarkMode
              ? SharedTheme.darkSuccessColor
              : SharedTheme.lightSuccessColor,
        );
        text = 'Pendaftaran Diterima';
        textColor = theme.colorScheme.surface;
      } else {
        color = WidgetStatePropertyAll(
          theme.colorScheme.error,
        );
        text = 'Pendaftaran Ditolak';
        textColor = theme.colorScheme.surface;
      }
    }
    // jika user belum di konfirmasi oleh admin maka status menunggu`
    else {
      color = WidgetStatePropertyAll(
        Get.isDarkMode ? SharedTheme.darkInfoColor : SharedTheme.lightInfoColor,
      );
      text = 'Menunggu Persetujuan Anda';
      textColor = Colors.white;
    }

    return Align(
      alignment: Alignment.topLeft,
      child: Chip(
        label: Text(text),
        labelStyle: textTheme.labelLarge?.copyWith(color: textColor),
        color: color,
        side: BorderSide.none,
      ),
    );
  }
}
