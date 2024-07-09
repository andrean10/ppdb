import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:ppdb/app/modules/widgets/main/custom_main_view_2.dart';

import '../../../widgets/container_title/container_title.dart';
import '../controllers/prospective_student_data_controller.dart';

class ProspectiveStudentDataView
    extends GetView<ProspectiveStudentDataController> {
  const ProspectiveStudentDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomMainView2(
      child: Column(
        children: [
          const ContainerTitle(title: 'Data Calon Siswa'),
          const Gap(32),
          FutureBuilder(
            future: controller.fetchStudentForm(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                case ConnectionState.done:
                  if (snapshot.hasData &&
                      snapshot.data != null &&
                      snapshot.data!.docs.isNotEmpty) {
                    final dataSiswa = snapshot.data!.docs.first.data();

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        builderItem(
                          field: 'Nama Lengkap',
                          value: dataSiswa.fullName,
                        ),
                        builderItem(
                          field: 'Jenis Kelamin',
                          value: dataSiswa.gender,
                        ),
                        builderItem(
                          field: 'Kewarganegaraan',
                          value: dataSiswa.nationality?.name,
                        ),
                        builderItem(
                          field: 'NIK',
                          value: dataSiswa.nik,
                        ),
                        builderItem(
                          field: 'No Regis Akta Kelahiran',
                          value: dataSiswa.birthCertificateRegistration,
                        ),
                        builderItem(
                          field: 'Berkebutuhan Khusus',
                          value:
                              '${dataSiswa.specialNeeds?.title} (${dataSiswa.specialNeeds?.category})',
                        ),
                        builderItem(
                          field: 'Agama',
                          value: dataSiswa.religion,
                        ),
                        builderItem(
                          field: 'Alamat Jalan',
                          value: dataSiswa.address,
                        ),
                        builderItem(
                          field: 'RT/RW',
                          value: '${dataSiswa.rt}/${dataSiswa.rw}',
                        ),
                        builderItem(
                          field: 'Nama Dusun',
                          value: dataSiswa.nameHamlet,
                        ),
                        builderItem(
                          field: 'Kode Pos',
                          value: dataSiswa.postalCode,
                        ),
                        builderItem(
                          field: 'Tempat Tinggal',
                          value: dataSiswa.residence,
                        ),
                        builderItem(
                          field: 'Transportasi',
                          value: dataSiswa.transportation,
                        ),
                        builderItem(
                          field: 'Anak ke (KK)',
                          value: dataSiswa.childTo,
                        ),
                        builderItem(
                          field: 'Nama Ayah',
                          value: dataSiswa.fatherName,
                        ),
                        builderItem(
                          field: 'NIK Ayah',
                          value: dataSiswa.nikFather,
                        ),
                        builderItem(
                          field: 'Nama Ibu',
                          value: dataSiswa.motherName,
                        ),
                        builderItem(
                          field: 'NIK Ibu',
                          value: dataSiswa.nikMother,
                        ),
                      ],
                    );
                  }
                default:
                  return const AutoSizeText('Data tidak ditemukan');
              }

              return const AutoSizeText('Data tidak ditemukan');
            },
          ),
        ],
      ),
    );
  }

  Widget builderItem({
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
                style: Get.textTheme.titleMedium,
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
}
