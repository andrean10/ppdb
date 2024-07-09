import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppdb/app/data/upload_files_model/upload_files_model.dart';
import 'package:ppdb/app/helpers/file_helper.dart';
import 'package:ppdb/app/modules/init/controllers/init_controller.dart';
import 'package:ppdb/utils/constants_values_firebase.dart';

import '../../../widgets/buttons/custom_text_button.dart';

class UploadFileController extends GetxController
    with GetTickerProviderStateMixin {
  late final InitController _initC;
  late final ScaffoldMessengerState sf;
  UploadTask? _uploadTask;

  final loadingValue = 0.0.obs;
  final _isSuccessful = false.obs;
  final _isPaused = false.obs;
  final _isCanceled = false.obs;

  @override
  void onInit() {
    super.onInit();
    _init();

    ever(
      loadingValue,
      (value) {
        if (sf.mounted && value.toInt() == 100) {
          Future.delayed(5.seconds, () => removeSnackbar());
        }
      },
    );
  }

  void _init() {
    if (Get.isRegistered<InitController>()) {
      _initC = Get.find<InitController>();
    }

    sf = ScaffoldMessenger.of(Get.context!);
  }

  Stream<DocumentSnapshot<UploadFilesModel>> fetchUploadFiles() {
    final uid = _initC.auth.currentUser?.uid;

    return _initC.firestore
        .collection(ConstantsValuesFirebase.colUploadFiles)
        .withConverter(
          fromFirestore: (snapshot, _) =>
              UploadFilesModel.fromJson(snapshot.data()!),
          toFirestore: (value, _) => value.toJson(),
        )
        .doc(uid)
        .snapshots();
  }

  Future<File?> pickFile(bool isPDF) async {
    final allowedExt = <String>[];

    if (isPDF) {
      allowedExt.add('pdf');
    } else {
      allowedExt.addAll(
        [
          'jpg',
          'jpeg',
          'png',
        ],
      );
    }

    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: allowedExt,
      );

      if (result != null) {
        final file = File(result.files.single.path!);
        return file;
      } else {
        return null;
      }
    } catch (e) {
      _initC.logger.e(
        'Error: pickFile',
        error: e,
      );
    }
    return null;
  }

  Future<void> builderUploadFile({
    required File data,
    required String key,
  }) async {
    Get.defaultDialog(
      title: 'Upload Berkas',
      middleText:
          'Apakah anda yakin ingin mengupload file yang telah anda pilih?',
      textConfirm: 'Iya',
      textCancel: 'Tidak',
      onConfirm: () async {
        final sizeFile = await FileHelper.checkFileSizeBasedOnMB(data);
        if (sizeFile != null && sizeFile < 3) {
          uploadFile(
            data: data,
            key: key,
          );
        } else {
          Get.back();
          Get.closeAllSnackbars();
          Get.snackbar(
            'Perhatian!',
            'Ukuran file terlalu besar',
            backgroundColor: Get.theme.colorScheme.errorContainer,
          ).show();
        }
      },
    );
  }

  void uploadFile({
    required File data,
    required String key,
  }) async {
    try {
      if (Get.isDialogOpen != null && Get.isDialogOpen!) {
        Get.back();

        sf.showMaterialBanner(_showLoadingMaterialBanner());

        final studentFilesRef = _initC.cloudStorage.ref().child(
              'student_files/${FileHelper.checkExtension(data.path)}',
            );
        _uploadTask = studentFilesRef.putFile(data);
        _uploadTask!.snapshotEvents.listen((event) async {
          switch (event.state) {
            case TaskState.running:
              loadingValue.value =
                  100 * (event.bytesTransferred / event.totalBytes);
              break;
            case TaskState.paused:
              _isPaused.value = true;
              _initC.logger.d('debg: Upload is paused');
              break;
            case TaskState.canceled:
              _isCanceled.value = true;
              _initC.logger.d('debg: Upload was canceled');
              break;
            case TaskState.success:
              try {
                _isSuccessful.value = true;
                final url = await studentFilesRef.getDownloadURL();

                final uploadFiles = await fetchUploadFiles().first;
                final data = uploadFiles.data();

                // insert url image to cloud firestore
                _initC.firestore
                    .collection(ConstantsValuesFirebase.colUploadFiles)
                    .doc(_initC.auth.currentUser?.uid)
                    .set(
                      UploadFilesModel(
                        familyCard:
                            (key == 'familyCard') ? url : data?.familyCard,
                        birthCertificate: (key == 'birthCertificate')
                            ? url
                            : data?.birthCertificate,
                        ktpFather: (key == 'ktpFather') ? url : data?.ktpFather,
                        ktpMom: (key == 'ktpMom') ? url : data?.ktpMom,
                        certificate:
                            (key == 'certificate') ? url : data?.certificate,
                        photo: (key == 'photo') ? url : data?.photo,
                      ).toJson(),
                      SetOptions(merge: true),
                    );
              } catch (e) {
                _initC.logger.e('Error: when store url to firestore', error: e);
              }

              break;
            case TaskState.error:
              _initC.logger.e('Error: when upload file = ');
              break;
          }
        });
      }
    } catch (e) {
      _initC.logger.e('Error: uploadFile = $e');
    }
  }

  MaterialBanner _showLoadingMaterialBanner() {
    final theme = Get.theme;
    final textTheme = Get.textTheme;

    return MaterialBanner(
      leading: Obx(
        () => Icon(
          (loadingValue.value == 100)
              ? Icons.check_circle_rounded
              : Icons.cloud_upload_rounded,
        ),
      ),
      content: Obx(
        () {
          final isSuccess = loadingValue.value == 100;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              AutoSizeText(
                isSuccess ? 'Sukses' : 'Sedang mengupload',
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              AutoSizeText(
                (loadingValue.value == 100)
                    ? 'Upload file berhasil'
                    : 'Loading.... ${loadingValue.value} %',
                style: textTheme.bodyMedium,
              ),
            ],
          );
        },
      ),
      actions: [
        CustomTextButton(
          onPressed: () {
            sf.hideCurrentMaterialBanner();
            _uploadTask?.cancel();
          },
          child: const Text('Cancel'),
        ),
        CustomTextButton(
          child: Obx(() => Text(_isPaused.value ? 'Resume' : 'Pause')),
          onPressed: () {
            if (_isPaused.value) {
              _uploadTask?.resume();
            } else {
              _uploadTask?.pause();
            }
          },
        ),
      ],
      backgroundColor: theme.colorScheme.primaryContainer,
    );
  }

  void removeSnackbar() {
    _isSuccessful.value = false;
    _isPaused.value = false;
    _isCanceled.value = false;
    sf.hideCurrentMaterialBanner();
  }
}
