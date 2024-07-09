import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel/excel.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart' as material;
import 'package:ppdb/utils/constants_values_firebase.dart';
import '../../shared/shared_method.dart';
import '../../shared/shared_theme.dart';
import '../data/form_model/form_siswa_model.dart';
import '../data/profile_model/profile_model.dart';
import '../data/upload_files_model/upload_files_model.dart';
import '../data/user_model/users_model.dart';
import '../modules/main/controllers/main_controller.dart';
import 'file_helper.dart';
import 'format_date_time.dart';

abstract class ExportExcel {
  static final _dir = Directory('/storage/emulated/0/documents');

  static Future<List<ProfileModel>> _fetchUser(
      FirebaseFirestore firestore) async {
    List<ProfileModel> dataProfile = [];

    try {
      final usersSnapshot = await firestore
          .collection(ConstantsValuesFirebase.colUser)
          .withConverter(
            fromFirestore: (snapshot, _) =>
                UsersModel.fromJson(snapshot.data()!),
            toFirestore: (value, _) => value.toJson(),
          )
          .where(FieldPath.fromString('role'), isEqualTo: ROLE.user.name)
          .where(FieldPath.fromString('isApproved'), isEqualTo: true)
          .where(FieldPath.fromString('isConfirmed'), isEqualTo: true)
          .get();

      final users = usersSnapshot.docs;

      for (var i = 0; i < users.length; i++) {
        final dataUserSnapshot = users[i];
        final uidUser = dataUserSnapshot.id;
        final dataUser = dataUserSnapshot.data();

        final formSiswaSnapshot = await firestore
            .collection(ConstantsValuesFirebase.colStudentForm)
            .withConverter(
              fromFirestore: (snapshot, _) =>
                  FormSiswaModel.fromJson(snapshot.data()!),
              toFirestore: (value, _) => value.toJson(),
            )
            .where(FieldPath.fromString('createdBy'), isEqualTo: uidUser)
            .get();
        final uploadFilesSnapshot = await firestore
            .collection(ConstantsValuesFirebase.colUploadFiles)
            .withConverter(
              fromFirestore: (snapshot, _) =>
                  UploadFilesModel.fromJson(snapshot.data()!),
              toFirestore: (value, _) => value.toJson(),
            )
            .doc(uidUser)
            .get();

        final formSiswaModel = formSiswaSnapshot.docs.first.data();
        final uploadFilesModel = uploadFilesSnapshot.data();

        dataProfile.add(
          ProfileModel(
            user: dataUser,
            formSiswa: formSiswaModel,
            uploadFiles: uploadFilesModel,
          ),
        );
      }
    } on FirebaseException catch (e) {
      Logger().e(
        'Error: fetchUser',
        error: e,
        stackTrace: e.stackTrace,
      );
    }

    return dataProfile;
  }

  static Future<void> export(FirebaseFirestore firestore) async {
    try {
      showSnackbar(
        content: 'Sedang Mengunduh...',
        backgroundColor: Get.isDarkMode
            ? SharedTheme.darkInfoColor
            : SharedTheme.lightInfoColor,
        textStyle:
            Get.textTheme.labelLarge?.copyWith(color: material.Colors.white),
      );

      // fetch users
      final dataProfile = await _fetchUser(firestore);

      // unduh data excel
      final excel = Excel.createExcel();
      final sheet = excel['Rekap Data Siswa'];

      final cellStyleHead = CellStyle(
        backgroundColorHex: ExcelColor.orange,
        leftBorder: Border(borderStyle: BorderStyle.Thick),
        rightBorder: Border(borderStyle: BorderStyle.Thick),
        topBorder: Border(
          borderStyle: BorderStyle.Thick,
        ),
        bottomBorder: Border(
          borderStyle: BorderStyle.Thick,
        ),
        bold: true,
        textWrapping: TextWrapping.Clip,
      );

      final cellStyleBody = CellStyle(
        leftBorder: Border(borderStyle: BorderStyle.Thin),
        rightBorder: Border(borderStyle: BorderStyle.Thin),
        bottomBorder: Border(
          borderStyle: BorderStyle.Thin,
        ),
        textWrapping: TextWrapping.WrapText,
      );

      final cellTitle = [
        'Username',
        'Email',
        'Nama Lengkap',
        'Jenis Kelamin',
        'Kewarganegaraan',
        'NIK',
        'No KK',
        'Tempat Lahir',
        'Tanggal Lahir',
        'No Regis Akta Lahir',
        'Berkebutuhan Khusus',
        'Agama',
        'Alamat Jalan',
        'RT',
        'RW',
        'Nama Dusun',
        'Kode Pos',
        'Tempat Tinggal',
        'Transportasi',
        'Anak ke (KK)',
        'Nama Ayah',
        'NIK Ayah',
        'Nama Ibu',
        'NIK Ibu',
        'Kartu Keluarga',
        'Akta Kelahiran',
        'Ijazah TK/RA',
        'KTP Ayah',
        'KTP Ibu',
        'Foto 3x4',
      ];

      for (var i = 0; i < cellTitle.length; i++) {
        final cell = sheet.cell(
          CellIndex.indexByColumnRow(columnIndex: i, rowIndex: 0),
        );
        cell.value = TextCellValue(cellTitle[i]);
        cell.cellStyle = cellStyleHead;
      }

      for (var i = 0; i < dataProfile.length; i++) {
        final user = dataProfile[i].user;
        final form = dataProfile[i].formSiswa;
        final uploadFile = dataProfile[i].uploadFiles;

        final columnData = <CellValue>[
          TextCellValue(user.username),
          TextCellValue(user.email),
        ];

        if (form != null) {
          columnData.addAll(
            [
              TextCellValue(form.fullName ?? ''),
              TextCellValue(form.gender ?? ''),
              TextCellValue(form.nationality?.name ?? ''),
              TextCellValue(form.nik ?? ''),
              TextCellValue(form.noKK ?? ''),
              TextCellValue(form.placeBirth ?? ''),
              (form.dateBirth != null)
                  ? TextCellValue(
                      FormatDateTime.dateToString(
                        newPattern: 'dd/MM/yyyy',
                        value: form.dateBirth.toString(),
                      ),
                    )
                  : const TextCellValue(''),
              TextCellValue(form.birthCertificateRegistration ?? ''),
              TextCellValue(form.specialNeeds != null
                  ? '${form.specialNeeds?.title}, ${form.specialNeeds?.category}'
                  : ''),
              TextCellValue(form.religion ?? ''),
              TextCellValue(form.address ?? ''),
              TextCellValue(form.rt ?? ''),
              TextCellValue(form.rw ?? ''),
              TextCellValue(form.nameHamlet ?? ''),
              TextCellValue(form.postalCode ?? ''),
              TextCellValue(form.residence ?? ''),
              TextCellValue(form.transportation ?? ''),
              TextCellValue(form.childTo ?? ''),
              TextCellValue(form.fatherName ?? ''),
              TextCellValue(form.nikFather ?? ''),
              TextCellValue(form.motherName ?? ''),
              TextCellValue(form.nikMother ?? ''),
            ],
          );
        } else {
          columnData.addAll(
            List.generate(
              23,
              (_) => const TextCellValue(''),
            ),
          );
        }

        if (uploadFile != null) {
          columnData.addAll(
            [
              TextCellValue(uploadFile.familyCard ?? ''),
              TextCellValue(uploadFile.birthCertificate ?? ''),
              TextCellValue(uploadFile.certificate ?? ''),
              TextCellValue(uploadFile.ktpFather ?? ''),
              TextCellValue(uploadFile.ktpMom ?? ''),
              TextCellValue(uploadFile.photo ?? ''),
            ],
          );
        } else {
          columnData.addAll(
            List.generate(
              6,
              (_) => const TextCellValue(''),
            ),
          );
        }

        for (var j = 0; j < columnData.length; j++) {
          var cell = sheet.cell(
            CellIndex.indexByColumnRow(columnIndex: j, rowIndex: i + 1),
          );
          cell.value = columnData[j];
          cell.cellStyle = cellStyleBody;
        }
      }

      // set default cell
      excel.setDefaultSheet(sheet.sheetName);
      final fileBytes = excel.save();

      final file = File(join(
          '${_dir.path}/${FileHelper.generateRandomFileName(uniqueNameFile: 'recap', ext: 'xlsx')}'))
        ..createSync(recursive: true)
        ..writeAsBytesSync(fileBytes!);

      material.ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();
      showSnackbar(
        content: 'File berhasil diunduh dan tersimpan di ${file.path}',
        path: file.path,
        backgroundColor: Get.isDarkMode
            ? SharedTheme.darkSuccessColor
            : SharedTheme.lightSuccessColor,
        duration: 5.seconds,
      );
    } on Exception catch (e) {
      Logger().e('Error: $e', error: e);
    }
  }
}
