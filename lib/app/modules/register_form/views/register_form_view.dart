import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:ppdb/app/data/countries_model/countries_model.dart';
import 'package:ppdb/app/modules/widgets/textformfield/custom_dropdown_form_field.dart';
import 'package:ppdb/app/modules/widgets/textformfield/custom_textform_field.dart';

import '../../../../utils/constants_assets.dart';
import '../../../data/special_needs_model/special_needs_model.dart';
import '../../../helpers/validations.dart';
import '../controllers/register_form_controller.dart';

class RegisterFormView extends GetView<RegisterFormController> {
  const RegisterFormView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Pendaftaran'),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 4,
            vertical: 4,
          ),
          child: Image.asset(ConstantsAssets.imgLogo),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: builderForm(),
      ),
    );
  }

  Widget builderForm() {
    return Form(
      key: controller.formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          builderFullname(),
          const Gap(12),
          builderGender(),
          const Gap(12),
          builderNationality(),
          const Gap(12),
          builderNIK(),
          const Gap(12),
          builderNoKK(),
          const Gap(12),
          builderPlaceBirth(),
          const Gap(12),
          builderBirthDate(),
          const Gap(12),
          builderNoRegis(),
          const Gap(12),
          builderSpecialNeeds(),
          const Gap(12),
          builderReligion(),
          const Gap(12),
        ],
      ),
    );
  }

  Widget builderFullname() {
    return Obx(
      () => CustomTextFormField(
        controller: controller.fullNameC,
        focusNode: controller.fullNameF,
        title: 'Nama Lengkap',
        hintText: 'Masukkan nama lengkap',
        suffixIconState: controller.fullName.value.isNotEmpty,
        keyboardType: TextInputType.name,
        validator: (value) => Validation.formField(
          value: value,
          titleField: 'Nama Lengkap',
        ),
      ),
    );
  }

  Widget builderGender() {
    return CustomDropdownFormField<String>(
      controller: controller.genderC,
      focusNode: controller.genderF,
      title: 'Jenis Kelamin',
      hintText: 'Pilih Jenis Kelamin',
      items: controller.dataGender.entries
          .map(
            (e) => DropdownMenuItem(
              value: e.key,
              child: Text(e.value),
            ),
          )
          .toList(),
      onChanged: controller.setGender,
      validator: (value) => Validation.formField(
        value: value,
        titleField: 'Jenis Kelamin',
      ),
    );
  }

  Widget builderNationality() {
    return CustomDropdownFormField<CountriesModel>(
      controller: controller.nationalityC,
      focusNode: controller.nationalityF,
      title: 'Kewarganegaraan',
      hintText: 'Pilih Kewarganegaraan',
      isShowSearchBox: true,
      asyncItems: (_) => controller.fetchAllCountries(),
      itemAsString: (item) => item.name ?? '',
      onChanged: controller.setNationality,
      validator: (value) => Validation.formField(
        value: value?.name,
        titleField: 'Kewarganegaraan',
      ),
    );
  }

  Widget builderNIK() {
    return Obx(
      () => CustomTextFormField(
        controller: controller.nikC,
        focusNode: controller.nikF,
        title: 'NIK',
        hintText: 'Masukkan NIK',
        suffixIconState: controller.nik.value.isNotEmpty,
        keyboardType: TextInputType.number,
        validator: (value) => Validation.formField(
          value: value,
          titleField: 'NIK',
          isNumericOnly: true,
        ),
      ),
    );
  }

  Widget builderNoKK() {
    return Obx(
      () => CustomTextFormField(
        controller: controller.noKKC,
        focusNode: controller.noKKF,
        title: 'Nomor KK',
        hintText: 'Masukkan Nomor KK',
        suffixIconState: controller.noKK.value.isNotEmpty,
        keyboardType: TextInputType.number,
        validator: (value) => Validation.formField(
          value: value,
          titleField: 'Nomor KK',
          isNumericOnly: true,
        ),
      ),
    );
  }

  Widget builderPlaceBirth() {
    return Obx(
      () => CustomTextFormField(
        controller: controller.placeBirthC,
        focusNode: controller.placeBirthF,
        title: 'Tempat Lahir',
        hintText: 'Masukkan Tempat Lahir',
        suffixIconState: controller.placeBirth.value.isNotEmpty,
        keyboardType: TextInputType.text,
        validator: (value) => Validation.formField(
          value: value,
          titleField: 'Tempat Lahir',
        ),
      ),
    );
  }

  Widget builderBirthDate() {
    return Obx(
      () => CustomTextFormField(
        controller: controller.dateBirthC,
        focusNode: controller.dateBirthF,
        title: 'Tanggal Lahir',
        hintText: 'Masukkan Tanggal Lahir',
        suffixIconState: controller.placeBirth.value.isNotEmpty,
        keyboardType: TextInputType.datetime,
        onTap: () async {
          await showCupertinoModalPopup(
            context: Get.context!,
            builder: (context) {
              return Container(
                height: 200,
                padding: const EdgeInsets.only(top: 8),
                margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                color: CupertinoColors.systemBackground.resolveFrom(context),
                child: SafeArea(
                  top: false,
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: controller.setBirthDate,
                    initialDateTime: DateTime(1970),
                    minimumDate: DateTime(1970),
                    maximumDate: DateTime.now(),
                    dateOrder: DatePickerDateOrder.dmy,
                  ),
                ),
              );
            },
          );
        },
        validator: (value) => Validation.formField(
          value: value,
          titleField: 'Tanggal Lahir',
        ),
      ),
    );
  }

  Widget builderNoRegis() {
    return Obx(
      () => CustomTextFormField(
        controller: controller.noRegistAktaLahirC,
        focusNode: controller.noRegistAktaLahirF,
        title: 'No Regis Akta Lahir',
        hintText: 'Masukkan No Regis Akta Lahir',
        suffixIconState: controller.noRegistAktaLahir.value.isNotEmpty,
        keyboardType: TextInputType.number,
        validator: (value) => Validation.formField(
          value: value,
          titleField: 'No Regis Akta Lahir',
          isNumericOnly: true,
        ),
      ),
    );
  }

  Widget builderSpecialNeeds() {
    return CustomDropdownFormField<SpecialNeedsModel>(
      controller: controller.nationalityC,
      focusNode: controller.nationalityF,
      title: 'Berkebutuhan Khusus',
      hintText: 'Pilih Berkebutuhan Khusus',
      isShowSearchBox: true,
      asyncItems: (_) => controller.fetchAllSpecialNeeds(),
      itemAsString: (item) {
        if (item.title != null && item.category != null) {
          return '${item.title} (${item.category})';
        }
        return '';
      },
      onChanged: controller.setSpecialNeeds,
      validator: (value) => Validation.formField(
        value: value?.title,
        titleField: 'Berkebutuhan Khusus',
      ),
    );
  }

  Widget builderReligion() {
    return CustomDropdownFormField<String>(
      controller: controller.religionC,
      focusNode: controller.religionF,
      title: 'Agama',
      hintText: 'Pilih Agama',
      items: controller.dataReligion
          .map(
            (e) => DropdownMenuItem(
              value: e,
              child: Text(e),
            ),
          )
          .toList(),
      validator: (value) => Validation.formField(
        value: value,
        titleField: 'Agama',
      ),
    );
  }
}
