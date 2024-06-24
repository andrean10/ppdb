import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:ppdb/app/data/menu_model/menu_model.dart';

import '../../../routes/app_pages.dart';

enum ROLE { ADMIN, USER }
class MainController extends GetxController {
  final listMenu = <MenuModel>[];

  final logger = Logger();

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() {
    final args = Get.arguments as ROLE;

    if (args == ROLE.ADMIN) {
      listMenu.addAll(
        [
          MenuModel(
            icon: Symbols.demography_rounded,
            title: 'Daftar Calon Siswa',
            onPressed: _moveToProspectiveStudents,
          ),
          MenuModel(
            icon: Symbols.patient_list_rounded,
            title: 'Rekapitulasi Data PD',
            onPressed: _moveToDataRecapPD,
          ),
          MenuModel(
            icon: Symbols.download_rounded,
            title: 'Unduh Data',
            onPressed: _moveToDownloadFile,
          ),
        ],
      );
    } else if (args == ROLE.USER) {
      listMenu.addAll(
        [
          MenuModel(
            icon: Symbols.campaign_rounded,
            title: 'Informasi',
            onPressed: _moveToInformation,
          ),
          MenuModel(
            icon: Symbols.task_rounded,
            title: 'Data Calon Siswa',
            onPressed: _moveToStudentData,
          ),
          MenuModel(
            icon: Symbols.upload_file_rounded,
            title: 'Unggah Berkas',
            onPressed: _moveToUploadFile,
          ),
          MenuModel(
            icon: Symbols.info_rounded,
            title: 'Tentang Sekolah',
            onPressed: _moveToAboutSchool,
          ),
          MenuModel(
            icon: Symbols.forum_rounded,
            title: 'Sosmed',
            onPressed: _moveToSosmed,
          ),
        ],
      );
    }
  }

  void _moveToInformation() => Get.toNamed(Routes.INFORMATION);

  void _moveToStudentData() {}

  void _moveToUploadFile() {}

  void _moveToAboutSchool() => Get.toNamed(Routes.ABOUT);

  void _moveToSosmed() => Get.toNamed(Routes.SOCIAL_MEDIA);

  void _moveToProspectiveStudents() {}

  void moveToProfile() {}

  void _moveToDataRecapPD() {}

  void _moveToDownloadFile() {}
}
