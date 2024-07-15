import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import "package:ppdb/app/modules/widgets/buttons/custom_text_button.dart";
import 'package:ppdb/app/modules/widgets/container_title/container_title.dart';
import 'package:ppdb/app/modules/widgets/main/custom_main_view_2.dart';
import 'package:ppdb/shared/shared_method.dart';
import 'package:ppdb/shared/shared_theme.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../controllers/upload_file_controller.dart';

class UploadFileView extends GetView<UploadFileController> {
  const UploadFileView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return CustomMainView2(
      child: Column(
        children: [
          const ContainerTitle(title: 'Unggah Berkas'),
          const Gap(32),
          StreamBuilder(
            stream: controller.fetchUploadFiles(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }

              if (snapshot.hasError && snapshot.error != null) {
                showSnackbar(
                  content: 'Ada kesalahan saat mengecek unggahan berkas',
                  backgroundColor: theme.colorScheme.error,
                );
              }

              final data = snapshot.data?.data();

              return Column(
                children: [
                  builderItemUpload(
                    theme: theme,
                    title: 'Kartu Keluarga',
                    subtitle: '*Format .pdf maksimal 3 MB',
                    state: data?.familyCard != null,
                    onPressed: () async {
                      if (data?.familyCard != null) {
                        builderShowDialog(
                          context: context,
                          file: data!.familyCard!,
                          isPDF: true,
                        );
                      } else {
                        final data = await controller.pickFile(true);

                        if (data != null) {
                          if (data.path.isPDFFileName) {
                            controller.builderUploadFile(
                              data: data,
                              key: 'familyCard',
                            );
                          } else {
                            showSnackbar(
                              content:
                                  'File yang anda kirim tidak sesuai format! Cek kembali file yang anda kirim',
                              backgroundColor: theme.colorScheme.error,
                              duration: 3.seconds,
                            );
                          }
                        }
                      }
                    },
                  ),
                  const Gap(12),
                  builderItemUpload(
                    theme: theme,
                    title: 'Akta Kelahiran',
                    subtitle: '*Format .pdf maksimal 3 MB',
                    state: data?.birthCertificate != null,
                    onPressed: () async {
                      if (data?.birthCertificate != null) {
                        builderShowDialog(
                          context: context,
                          file: data!.birthCertificate!,
                          isPDF: true,
                        );
                      } else {
                        final data = await controller.pickFile(true);

                        if (data != null) {
                          if (data.path.isPDFFileName) {
                            controller.builderUploadFile(
                              data: data,
                              key: 'birthCertificate',
                            );
                          } else {
                            showSnackbar(
                              content:
                                  'File yang anda kirim tidak sesuai format! Cek kembali file yang anda kirim',
                              backgroundColor: theme.colorScheme.error,
                              duration: 3.seconds,
                            );
                          }
                        }
                      }
                    },
                  ),
                  const Gap(12),
                  builderItemUpload(
                    theme: theme,
                    title: 'KTP Ayah',
                    subtitle: '*Format .pdf maksimal 3 MB',
                    state: data?.ktpFather != null,
                    onPressed: () async {
                      if (data?.ktpFather != null) {
                        builderShowDialog(
                          context: context,
                          file: data!.ktpFather!,
                          isPDF: true,
                        );
                      } else {
                        final data = await controller.pickFile(true);

                        if (data != null) {
                          if (data.path.isPDFFileName) {
                            controller.builderUploadFile(
                              data: data,
                              key: 'ktpFather',
                            );
                          } else {
                            showSnackbar(
                              content:
                                  'File yang anda kirim tidak sesuai format! Cek kembali file yang anda kirim',
                              backgroundColor: theme.colorScheme.error,
                              duration: 3.seconds,
                            );
                          }
                        }
                      }
                    },
                  ),
                  const Gap(12),
                  builderItemUpload(
                    theme: theme,
                    title: 'KTP Ibu',
                    subtitle: '*Format .pdf maksimal 3 MB',
                    state: data?.ktpMom != null,
                    onPressed: () async {
                      if (data?.ktpMom != null) {
                        builderShowDialog(
                          context: context,
                          file: data!.ktpMom!,
                          isPDF: true,
                        );
                      } else {
                        final data = await controller.pickFile(true);

                        if (data != null) {
                          if (data.path.isPDFFileName) {
                            controller.builderUploadFile(
                              data: data,
                              key: 'ktpMom',
                            );
                          }
                        } else {
                          showSnackbar(
                            content:
                                'File yang anda kirim tidak sesuai format! Cek kembali file yang anda kirim',
                            backgroundColor: theme.colorScheme.error,
                            duration: 3.seconds,
                          );
                        }
                      }
                    },
                  ),
                  const Gap(12),
                  builderItemUpload(
                    theme: theme,
                    title: 'Ijazah',
                    subtitle: '*Format .pdf maksimal 3 MB',
                    state: data?.certificate != null,
                    onPressed: () async {
                      if (data?.certificate != null) {
                        builderShowDialog(
                          context: context,
                          file: data!.certificate!,
                          isPDF: true,
                        );
                      } else {
                        final data = await controller.pickFile(true);

                        if (data != null) {
                          if (data.path.isPDFFileName) {
                            controller.builderUploadFile(
                              data: data,
                              key: 'certificate',
                            );
                          } else {
                            showSnackbar(
                              content:
                                  'File yang anda kirim tidak sesuai format! Cek kembali file yang anda kirim',
                              backgroundColor: theme.colorScheme.error,
                              duration: 3.seconds,
                            );
                          }
                        }
                      }
                    },
                  ),
                  const Gap(12),
                  builderItemUpload(
                    theme: theme,
                    title: 'Pas Foto 3x4',
                    subtitle: '*Format .jpg/.jpeg/.png maksimal 3 MB',
                    state: data?.photo != null,
                    onPressed: () async {
                      if (data?.photo != null) {
                        Get.dialog(
                          Stack(
                            children: [
                              Positioned.fill(
                                child: InteractiveViewer(
                                  minScale: 1,
                                  maxScale: 4,
                                  child: Image.network(data!.photo!),
                                ),
                              ),
                              IconButton.filled(
                                onPressed: Get.back,
                                icon: const Icon(Icons.close_rounded),
                              )
                            ],
                          ),
                        );
                      } else {
                        final data = await controller.pickFile(false);

                        if (data != null) {
                          if (data.path.isPDFFileName) {
                            controller.builderUploadFile(
                              data: data,
                              key: 'photo',
                            );
                          } else {
                            showSnackbar(
                              content:
                                  'File yang anda kirim tidak sesuai format! Cek kembali file yang anda kirim',
                              backgroundColor: theme.colorScheme.error,
                              duration: 3.seconds,
                            );
                          }
                        }
                      }
                    },
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }

  void builderShowDialog({
    required BuildContext context,
    required String file,
    required bool isPDF,
  }) {
    final isApproved = controller.profileModel?.user.isApproved ?? false;

    showDialog(
      context: context,
      builder: (context) => Dialog.fullscreen(
        child: Scaffold(
          appBar: AppBar(
            leading: const CloseButton(),
            title: const Text('Pratinjau'),
            actions: [
              (!isApproved)
                  ? CustomTextButton(
                      onPressed: () async {
                        final data = await controller.pickFile(isPDF);

                        if (data != null) {
                          if (data.path.isPDFFileName) {
                            Get.back();
                            controller.builderUploadFile(
                              data: data,
                              key: 'familyCard',
                            );
                          } else {
                            showSnackbar(
                              content:
                                  'File yang anda kirim tidak sesuai format! Cek kembali file yang anda kirim',
                              backgroundColor: Get.theme.colorScheme.error,
                              duration: 3.seconds,
                            );
                          }
                        }
                      },
                      child: const Text('Ganti File'),
                    )
                  : Container(),
            ],
          ),
          body: SfPdfViewer.network(file),
        ),
      ),
    );
  }

  Widget builderItemUpload({
    required ThemeData theme,
    required String title,
    required String subtitle,
    required bool state,
    required Function() onPressed,
  }) {
    final textTheme = theme.textTheme;

    return ListTile(
      key: Key(title),
      contentPadding: EdgeInsets.zero,
      leading: Icon(
        state ? Icons.check_circle_rounded : Icons.cancel_rounded,
        color: state ? SharedTheme.lightSuccessColor : theme.colorScheme.error,
      ),
      title: Text(title),
      titleTextStyle: textTheme.titleMedium,
      subtitle: Text(subtitle),
      subtitleTextStyle: textTheme.labelSmall,
      trailing: CustomTextButton(
        onPressed: onPressed,
        child: Text(state ? 'Pratinjau' : 'Lengkapi'),
      ),
    );
  }
}
