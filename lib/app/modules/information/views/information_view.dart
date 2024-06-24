import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../widgets/container_title/container_title.dart';
import '../../widgets/main/custom_main_view.dart';
import '../controllers/information_controller.dart';

class InformationView extends GetView<InformationController> {
  const InformationView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return CustomMainView(
      isBack: true,
      builder: Column(
        children: [
          const ContainerTitle(title: 'Informasi'),
          const Gap(32),
          AutoSizeText(
            """
\u2022 Pendaftaran 27 Juni - 01 Juli 2022
\u2022 Usia minimal sudah 6 tahun saat mendaftar
\u2022 Fotocopy KK dan KTP Orang Tua (1 lembar)
\u2022 Fotocopy Akta Kelahiran (1 lembar)
\u2022 Fotocopy Ijazah TK (1 lembar)
\u2022 Pasphoto 3x4 (1 lembar)
\u2022 Mengisi Formulir Pendaftaran
\u2022 Wa Operator jika ada kendala (082283980963 Pami Pajriani)
""",
            style: textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
