import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path/path.dart' as ph;
import 'package:ppdb/app/data/user_model/users_model.dart';
import 'package:ppdb/app/modules/init/controllers/init_controller.dart';
import 'package:ppdb/utils/constants_values_firebase.dart';
import '../../shared/shared_method.dart';
import '../../shared/shared_theme.dart';
import '../../utils/constants_assets.dart';
import '../data/profile_model/profile_model.dart';
import 'file_helper.dart';
import 'format_date_time.dart';

abstract class Receipt {
  static final _dir = Directory('/storage/emulated/0/documents');

  static Future<void> print({
    required InitController initC,
    required ProfileModel? profile,
  }) async {
    try {
      showSnackbar(
        content: 'Sedang Mengunduh...',
        backgroundColor: Get.isDarkMode
            ? SharedTheme.darkInfoColor
            : SharedTheme.lightInfoColor,
      );

      final docUserModel = await initC.firestore
          .collection(ConstantsValuesFirebase.colUser)
          .withConverter(
            fromFirestore: (snapshot, _) =>
                UsersModel.fromJson(snapshot.data()!),
            toFirestore: (value, _) => value.toJson(),
          )
          .doc(profile?.formSiswa?.createdBy)
          .get();
      final userModel = docUserModel.data();

      Logger().d('debug: userModel = ${userModel.toString()}');

      final pdf = pw.Document();

      final img = await rootBundle.load(ConstantsAssets.imgLogo);
      final imageBytes = img.buffer.asUint8List();

      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (context) {
            final form = profile?.formSiswa;

            return pw.Column(
              children: [
                pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Image(
                      pw.MemoryImage(imageBytes),
                      width: 100,
                    ),
                    pw.Text('PPDB TP 2024/2025'),
                  ],
                ),
                pw.SizedBox(height: 32),
                pw.Text(
                  'TANDA TERIMA PENDAFTARAN PPDB\nSD Negeri 034 Teluk Mega',
                  style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 21,
                  ),
                  textAlign: pw.TextAlign.center,
                ),
                pw.SizedBox(height: 21),
                pw.Align(
                  alignment: pw.Alignment.topRight,
                  child: pw.Column(
                    children: [
                      pw.Text('Nomor Pendaftaran'),
                      pw.Text('${userModel?.noRegis ?? '0'}'),
                    ],
                  ),
                ),
                pw.SizedBox(height: 32),
                pw.Row(
                  children: [
                    pw.Expanded(
                      flex: 2,
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text('Nama Lengkap'),
                          pw.Text('Jenis Kelamin'),
                          pw.Text('Kewarganegaraan'),
                          pw.Text('NIK'),
                          pw.Text('No KK'),
                          pw.Text('Tempat Lahir'),
                          pw.Text('Tanggal Lahir'),
                          pw.Text('No Regis Akta Lahir'),
                          pw.Text('Berkebutuhan Khusus'),
                          pw.Text('Agama'),
                          pw.Text('Alamat Jalan'),
                          pw.Text('RT'),
                          pw.Text('RW'),
                          pw.Text('Nama Dusun'),
                          pw.Text('Kode Pos'),
                          pw.Text('Tempat Tinggal'),
                          pw.Text('Transportasi'),
                          pw.Text('Anak ke (KK)'),
                          pw.Text('Nama Ayah'),
                          pw.Text('NIK Ayah'),
                          pw.Text('Nama Ibu'),
                          pw.Text('NIK Ibu'),
                        ],
                      ),
                    ),
                    pw.Expanded(
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: List.generate(22, (_) => pw.Text(':')),
                      ),
                    ),
                    pw.Expanded(
                      flex: 3,
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(form?.fullName ?? '-'),
                          pw.Text(form?.gender ?? '-'),
                          pw.Text(form?.nationality?.name ?? '-'),
                          pw.Text(form?.nik ?? '-'),
                          pw.Text(form?.noKK ?? '-'),
                          pw.Text(form?.placeBirth ?? '-'),
                          pw.Text(
                            (form != null && form.dateBirth != null)
                                ? FormatDateTime.dateToString(
                                    newPattern: 'dd-MMMM-yyyy',
                                    value: form.dateBirth.toString(),
                                  )
                                : '-',
                          ),
                          pw.Text(form?.birthCertificateRegistration ?? '-'),
                          pw.Text(
                            (form != null && form.specialNeeds != null)
                                ? '${form.specialNeeds!.title} ${form.specialNeeds!.category}'
                                : '-',
                          ),
                          pw.Text(form?.religion ?? '-'),
                          pw.Text(form?.address ?? '-'),
                          pw.Text(form?.rt ?? '-'),
                          pw.Text(form?.rw ?? '-'),
                          pw.Text(form?.nameHamlet ?? '-'),
                          pw.Text(form?.postalCode ?? '-'),
                          pw.Text(form?.residence ?? '-'),
                          pw.Text(form?.transportation ?? '-'),
                          pw.Text(form?.childTo ?? '-'),
                          pw.Text(form?.fatherName ?? '-'),
                          pw.Text(form?.nikFather ?? '-'),
                          pw.Text(form?.motherName ?? '-'),
                          pw.Text(form?.nikMother ?? '-'),
                        ],
                      ),
                    ),
                  ],
                ),
                pw.SizedBox(height: 32),
                pw.Align(
                  alignment: pw.Alignment.topRight,
                  child: pw.Text(
                    '(Panitia PPDB)',
                    style: const pw.TextStyle(fontSize: 18),
                  ),
                ),
                pw.SizedBox(height: 21),
                pw.Align(
                  alignment: pw.Alignment.topLeft,
                  child: pw.Text(
                    'Cek kembali data peserta\nJika ada kesalahan hubungi panitia segera',
                  ),
                ),
              ],
            );
          },
        ),
      );

      final file = File(ph.join(
          '${_dir.path}/${FileHelper.generateRandomFileName(uniqueNameFile: 'receipt', ext: 'pdf')}'))
        ..createSync(recursive: true)
        ..writeAsBytesSync(await pdf.save());

      ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();
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

      ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();
      showSnackbar(
        content: 'File gagal diunduh',
        backgroundColor: Get.theme.colorScheme.error,
        duration: 2.seconds,
      );
    }
  }
}
