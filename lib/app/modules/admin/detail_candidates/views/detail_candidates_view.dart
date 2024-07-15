import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:ppdb/app/data/user_model/users_model.dart';
import 'package:ppdb/app/helpers/receipt.dart';
import 'package:ppdb/app/modules/widgets/buttons/custom_text_button.dart';
import 'package:ppdb/app/modules/widgets/container_title/container_title.dart';
import 'package:ppdb/app/modules/widgets/main/custom_main_view_2.dart';
import 'package:ppdb/shared/shared_theme.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../widgets/buttons/custom_filled_button.dart';
import '../controllers/detail_candidates_controller.dart';

class DetailCandidatesView extends GetView<DetailCandidatesController> {
  const DetailCandidatesView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final textTheme = context.textTheme;

    return CustomMainView2(
      child: Column(
        children: [
          const ContainerTitle(title: 'Detail Siswa'),
          const Gap(32),
          FutureBuilder(
            future: controller.fetchProfile(),
            builder: (context, snapshot) {
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
                final profile = snapshot.data!;
                final user = profile.user;
                final form = profile.formSiswa;
                final files = profile.uploadFiles;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    builderItem(
                      textTheme: textTheme,
                      field: 'Nama Lengkap',
                      value: form?.fullName,
                    ),
                    builderItem(
                      textTheme: textTheme,
                      field: 'Username',
                      value: user.username,
                    ),
                    builderItem(
                      textTheme: textTheme,
                      field: 'Email',
                      value: user.email,
                    ),
                    builderItem(
                      textTheme: textTheme,
                      field: 'Jenis Kelamin',
                      value: form?.gender,
                    ),
                    builderItem(
                      textTheme: textTheme,
                      field: 'Kewarganegaraan',
                      value: form?.nationality?.name,
                    ),
                    builderItem(
                      textTheme: textTheme,
                      field: 'NIK',
                      value: form?.nik,
                    ),
                    builderItem(
                      textTheme: textTheme,
                      field: 'No Regis Akta Kelahiran',
                      value: form?.birthCertificateRegistration,
                    ),
                    builderItem(
                      textTheme: textTheme,
                      field: 'Berkebutuhan Khusus',
                      value:
                          '${form?.specialNeeds?.title} (${form?.specialNeeds?.category})',
                    ),
                    builderItem(
                      textTheme: textTheme,
                      field: 'Agama',
                      value: form?.religion,
                    ),
                    builderItem(
                      textTheme: textTheme,
                      field: 'Alamat Jalan',
                      value: form?.address,
                    ),
                    builderItem(
                      textTheme: textTheme,
                      field: 'RT/RW',
                      value: '${form?.rt}/${form?.rw}',
                    ),
                    builderItem(
                      textTheme: textTheme,
                      field: 'Nama Dusun',
                      value: form?.nameHamlet,
                    ),
                    builderItem(
                      textTheme: textTheme,
                      field: 'Kode Pos',
                      value: form?.postalCode,
                    ),
                    builderItem(
                      textTheme: textTheme,
                      field: 'Tempat Tinggal',
                      value: form?.residence,
                    ),
                    builderItem(
                      textTheme: textTheme,
                      field: 'Transportasi',
                      value: form?.transportation,
                    ),
                    builderItem(
                      textTheme: textTheme,
                      field: 'Anak ke (KK)',
                      value: form?.childTo,
                    ),
                    builderItem(
                      textTheme: textTheme,
                      field: 'Nama Ayah',
                      value: form?.fatherName,
                    ),
                    builderItem(
                      textTheme: textTheme,
                      field: 'NIK Ayah',
                      value: form?.nikFather,
                    ),
                    builderItem(
                      textTheme: textTheme,
                      field: 'Nama Ibu',
                      value: form?.motherName,
                    ),
                    builderItem(
                      textTheme: textTheme,
                      field: 'NIK Ibu',
                      value: form?.nikMother,
                    ),
                    builderItemFile(
                      field: 'Kartu Keluarga',
                      path: files?.familyCard,
                    ),
                    builderItemFile(
                      field: 'Akta Kelahiran',
                      path: files?.birthCertificate,
                    ),
                    builderItemFile(
                      field: 'KTP Ayah',
                      path: files?.ktpFather,
                    ),
                    builderItemFile(
                      field: 'KTP Ibu',
                      path: files?.ktpMom,
                    ),
                    builderItemFile(
                      field: 'Ijazah TK',
                      path: files?.certificate,
                    ),
                    builderItemFile(
                      field: ' Pas Foto 3x4',
                      path: files?.photo,
                      isImage: true,
                    ),
                  ],
                );
              }

              return const AutoSizeText('Data tidak ditemukan');
            },
          ),
          const Gap(12),
          StreamBuilder(
            stream: controller.streamUser(),
            builder: (context, snapshot) => builderState(
              theme: theme,
              snapshot: snapshot,
            ),
          ),
          const Gap(16),
        ],
      ),
    );
  }

  Widget builderState({
    required ThemeData theme,
    required AsyncSnapshot<DocumentSnapshot<UsersModel>> snapshot,
  }) {
    final textTheme = theme.textTheme;

    if (snapshot.data != null &&
        snapshot.data!.exists &&
        snapshot.data!.data() != null) {
      final user = snapshot.data!.data()!;
      final isApproved = user.isApproved!;
      final isConfirmed = user.isConfirmed!;

      // Jika user diterima
      // maka status diterima muncul dan tidak ada tombol aksi
      if (isApproved && isConfirmed) {
        return Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Get.isDarkMode
                    ? SharedTheme.darkSuccessColor
                    : SharedTheme.lightSuccessColor,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(12),
              child: Text(
                'Siswa ini telah disetujui',
                textAlign: TextAlign.center,
                style: textTheme.titleMedium?.copyWith(color: Colors.white),
              ),
            ),
            const Gap(21),
            CustomFilledButton(
              onPressed: () => Receipt.print(
                initC: controller.initC,
                profile: controller.profile,
              ),
              isFilledTonal: false,
              icon: const Icon(Icons.print_rounded),
              child: const Text('Cetak Resi'),
            ),
          ],
        );
      }

      // jika user ditolak
      // maka status muncul dan tombol untuk ubah aksi
      if (!isApproved && isConfirmed) {
        // jika user menekan tombol ubah aksi
        // maka tampilan akan berubah ke mode aksi
        return Obx(
          () {
            if (controller.isChangeAction.value) {
              return builderAction(theme);
            } else {
              return Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.error,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      'Siswa ini anda tolak pendaftarannya, jika anda ingin melakukan perubahan tekan tombol dibawah',
                      textAlign: TextAlign.center,
                      style:
                          textTheme.titleMedium?.copyWith(color: Colors.white),
                    ),
                  ),
                  const Gap(12),
                  CustomFilledButton(
                    onPressed: () {
                      controller.isChangeAction.value = true;
                    },
                    isFilledTonal: true,
                    child: const Text('Ubah Aksi'),
                  )
                ],
              );
            }
          },
        );
      }

      // jika user belum di konfirmasi admin
      // maka status muncul menunggu aksi dari admin
      return Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Get.isDarkMode
                  ? SharedTheme.darkInfoColor
                  : SharedTheme.lightInfoColor,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(12),
            child: Text(
              'Menunggu persetujuan anda',
              textAlign: TextAlign.center,
              style: textTheme.titleMedium?.copyWith(color: Colors.white),
            ),
          ),
          const Gap(21),
          builderAction(theme),
        ],
      );
    }

    return Container();
  }

  Widget builderAction(ThemeData theme) {
    return Row(
      children: [
        Expanded(
          child: Obx(
            () => CustomFilledButton(
              width: double.infinity,
              onPressed: controller.decline,
              isFilledTonal: true,
              style: ButtonStyle(
                backgroundColor:
                    WidgetStatePropertyAll(theme.colorScheme.errorContainer),
              ),
              state: controller.isLoadingRejected.value,
              child: const Text('Tolak'),
            ),
          ),
        ),
        const Gap(16),
        Expanded(
          child: Obx(
            () => CustomFilledButton(
              width: double.infinity,
              onPressed: controller.approved,
              isFilledTonal: true,
              state: controller.isLoadingApproved.value,
              child: const Text('Setujui'),
            ),
          ),
        )
      ],
    );
  }

  Widget builderItem({
    required TextTheme textTheme,
    required String field,
    required String? value,
  }) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: AutoSizeText(
                field,
                style: textTheme.titleMedium,
              ),
            ),
            const Gap(18),
            Expanded(
              child: AutoSizeText(value ?? '-'),
            ),
          ],
        ),
        const Gap(8),
      ],
    );
  }

  Widget builderItemFile({
    required String field,
    required String? path,
    bool isImage = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: AutoSizeText(
                field,
                style: Get.textTheme.titleMedium,
              ),
            ),
            const Gap(4),
            CustomTextButton(
              onPressed: () => builderShowDialog(
                path: path!,
                isImage: isImage,
              ),
              isDisabled: path == null,
              child: const Text('Pratinjau'),
            ),
            const Gap(8),
          ],
        ),
        const Gap(8),
      ],
    );
  }

  void builderShowDialog({
    required String path,
    required bool isImage,
  }) {
    showDialog(
      context: Get.context!,
      builder: (context) => Dialog.fullscreen(
        child: Scaffold(
          appBar: AppBar(
            leading: const CloseButton(),
            title: const Text('Pratinjau'),
            toolbarOpacity: 0.5,
          ),
          body: (isImage)
              ? InteractiveViewer(
                  minScale: 1,
                  maxScale: 4,
                  child: Image.network(
                    path,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                )
              : SfPdfViewer.network(path),
        ),
      ),
    );
  }
}
