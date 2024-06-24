import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../widgets/container_title/container_title.dart';
import '../../widgets/main/custom_main_view.dart';
import '../controllers/about_controller.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return CustomMainView(
      isBack: true,
      builder: Column(
        children: [
          const ContainerTitle(title: 'Tentang Sekolah'),
          const Gap(32),
          AutoSizeText(
            """
SD Negeri 034 Teluk Mega yang beralamat di Jl. Sungai Intan, Kepenghuluan Teluk Mega, Kecamatan Tanah Putih, Kabupaten Rokan Hilir, Provinsi Riau.

Kami mendukung berbagai kegiatan siswa dengan mengadakan bermacam macam ekstakurikuler seperti Voli, Sepak Bola, Seni Tari dan Drama.

\tSekolah Juga memfasilitasi siswa dengan berbagai media pembelajaran seperti chromebook, akses internet berupa wifi di area sekolah, buku paket, serta berbagai buku reverensi di perpustakaan yang sering diperbarui.
""",
            style: textTheme.bodyMedium,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
