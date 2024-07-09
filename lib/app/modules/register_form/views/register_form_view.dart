import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:ppdb/app/modules/widgets/textformfield/custom_dropdown_form_field.dart';
import 'package:ppdb/app/modules/widgets/textformfield/custom_textform_field.dart';

import '../../../../utils/constants_assets.dart';
import '../../../helpers/validations.dart';
import '../../widgets/buttons/custom_filled_button.dart';
import '../controllers/register_form_controller.dart';

class RegisterFormView extends GetView<RegisterFormController> {
  const RegisterFormView({super.key});

  @override
  Widget build(BuildContext context) {
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
        child: builderForm(context),
      ),
    );
  }

  Widget builderForm(BuildContext context) {
    final textTheme = context.textTheme;

    return Form(
      key: controller.formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          builderFullName(),
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
          builderBirthDate(context),
          const Gap(12),
          builderBirthCertificateRegistration(),
          const Gap(12),
          builderSpecialNeeds(textTheme),
          const Gap(12),
          builderReligion(),
          const Gap(12),
          builderPlaceAddress(),
          const Gap(12),
          Row(
            children: [
              Expanded(child: builderRT()),
              const Gap(12),
              Expanded(child: builderRW()),
            ],
          ),
          const Gap(12),
          builderNameHamlet(),
          const Gap(12),
          builderPostalCode(),
          const Gap(12),
          builderResidence(),
          const Gap(12),
          builderTransportation(),
          const Gap(12),
          builderChildTo(),
          const Gap(12),
          builderFatherName(),
          const Gap(12),
          builderNIKFather(),
          const Gap(12),
          builderMotherName(),
          const Gap(12),
          builderNIKMother(),
          const Gap(21),
          Obx(
            () => CustomFilledButton(
              width: double.infinity,
              onPressed: controller.confirm,
              state: controller.isLoading.value,
              isFilledTonal: false,
              child: const Text('Simpan'),
            ),
          ),
        ],
      ),
    );
  }

  Widget builderFullName() {
    return Obx(
      () => CustomTextFormField(
        controller: controller.fullNameC,
        focusNode: controller.fullNameF,
        title: 'Nama Lengkap*',
        hintText: 'Masukkan nama lengkap',
        suffixIconState: controller.fullName.value.isNotEmpty,
        keyboardType: TextInputType.name,
        textCapitalization: TextCapitalization.characters,
        onEditingComplete: controller.genderF.requestFocus,
        validator: (value) => Validation.formField(
          value: value,
          titleField: 'Nama Lengkap',
        ),
      ),
    );
  }

  Widget builderGender() {
    return CustomDropdownFormField(
      controller: controller.genderC,
      focusNode: controller.genderF,
      constraints: const BoxConstraints(maxHeight: 110),
      title: 'Jenis Kelamin*',
      hintText: 'Pilih Jenis Kelamin',
      items: controller.dataGender.values.toList(),
      onChanged: controller.setGender,
      validator: (value) => Validation.formField(
        value: value,
        titleField: 'Jenis Kelamin',
      ),
      type: TypeDropDown.menu,
    );
  }

  Widget builderNationality() {
    return CustomDropdownFormField(
      controller: controller.nationalityC,
      focusNode: controller.nationalityF,
      title: 'Kewarganegaraan*',
      hintText: 'Pilih Kewarganegaraan',
      isShowSearchBox: true,
      asyncItems: (_) => controller.fetchAllCountries(),
      itemAsString: (item) => '${item.unicodeFlag} ${item.name}',
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
        title: 'NIK*',
        hintText: 'Masukkan NIK',
        suffixIconState: controller.nik.value.isNotEmpty,
        keyboardType: TextInputType.number,
        maxLength: 15,
        onEditingComplete: controller.noKKF.requestFocus,
        validator: (value) => Validation.formField(
          value: value,
          titleField: 'NIK',
          isNumericOnly: true,
          minLength: 15,
          messageMinChar: 'NIK tidak valid',
        ),
      ),
    );
  }

  Widget builderNoKK() {
    return Obx(
      () => CustomTextFormField(
        controller: controller.noKKC,
        focusNode: controller.noKKF,
        title: 'Nomor KK*',
        hintText: 'Masukkan Nomor KK',
        suffixIconState: controller.noKK.value.isNotEmpty,
        keyboardType: TextInputType.number,
        maxLength: 15,
        onEditingComplete: controller.placeBirthF.requestFocus,
        validator: (value) => Validation.formField(
          value: value,
          titleField: 'Nomor KK',
          isNumericOnly: true,
          minLength: 15,
          messageMinChar: 'Nomor KK tidak valid',
        ),
      ),
    );
  }

  Widget builderPlaceBirth() {
    return Obx(
      () => CustomTextFormField(
        controller: controller.placeBirthC,
        focusNode: controller.placeBirthF,
        title: 'Tempat Lahir*',
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

  Widget builderBirthDate(BuildContext context) {
    return Obx(
      () => CustomTextFormField(
        controller: controller.dateBirthC,
        focusNode: controller.dateBirthF,
        title: 'Tanggal Lahir*',
        hintText: 'Masukkan Tanggal Lahir',
        suffixIconState: controller.dateBirth.value != null,
        keyboardType: TextInputType.none,
        onTap: () async {
          await showCupertinoModalPopup(
            context: context,
            builder: (context) => Container(
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
                  initialDateTime: controller.dateBirth.value ?? DateTime(2012),
                  minimumDate: DateTime(2012),
                  maximumDate: DateTime.now(),
                  dateOrder: DatePickerDateOrder.dmy,
                ),
              ),
            ),
          );
        },
        validator: (value) => Validation.formField(
          value: value,
          titleField: 'Tanggal Lahir',
        ),
      ),
    );
  }

  Widget builderBirthCertificateRegistration() {
    return Obx(
      () => CustomTextFormField(
        controller: controller.birthCertificateRegistrationC,
        focusNode: controller.birthCertificateRegistrationF,
        title: 'No Regis Akta Lahir*',
        hintText: 'Masukkan No Regis Akta Lahir',
        suffixIconState:
            controller.birthCertificateRegistration.value.isNotEmpty,
        keyboardType: TextInputType.number,
        validator: (value) => Validation.formField(
          value: value,
          titleField: 'No Regis Akta Lahir',
          isNumericOnly: true,
        ),
      ),
    );
  }

  Widget builderSpecialNeeds(TextTheme textTheme) {
    return Obx(
      () => CustomDropdownFormField(
        controller: controller.specialNeedsC,
        focusNode: controller.specialNeedsF,
        title: 'Berkebutuhan Khusus',
        hintText: 'Pilih Berkebutuhan Khusus',
        isShowSearchBox: true,
        suffix: InkWell(
          onTap: () => controller.setSpecialNeeds(null),
          child: Text(
            'Reset',
            style: textTheme.labelLarge,
          ),
        ),
        asyncItems: (_) => controller.fetchAllSpecialNeeds(),
        itemAsString: (item) {
          if (item.title != null && item.category != null) {
            return '${item.title} (${item.category})';
          }
          return '';
        },
        selectedItem: controller.specialNeeds.value,
        onChanged: controller.setSpecialNeeds,
      ),
    );
  }

  Widget builderReligion() {
    return CustomDropdownFormField(
      controller: controller.religionC,
      focusNode: controller.religionF,
      title: 'Agama*',
      hintText: 'Pilih Agama',
      items: controller.dataReligion,
      onChanged: controller.setReligion,
      validator: (value) => Validation.formField(
        value: value,
        titleField: 'Agama',
      ),
    );
  }

  Widget builderPlaceAddress() {
    return Obx(
      () => CustomTextFormField(
        controller: controller.addressC,
        focusNode: controller.addressF,
        title: 'Alamat Jalan*',
        hintText: 'Masukkan Alamat Jalan',
        keyboardType: TextInputType.streetAddress,
        suffixIconState: controller.address.value.isNotEmpty,
        validator: (value) => Validation.formField(
          value: value,
          titleField: 'Alamat Jalan',
        ),
      ),
    );
  }

  Widget builderRT() {
    return Obx(
      () => CustomTextFormField(
        controller: controller.rtC,
        focusNode: controller.rtF,
        title: 'RT*',
        hintText: 'Masukkan RT',
        maxLength: 3,
        suffixIconState: controller.rt.value.isNotEmpty,
        keyboardType: TextInputType.number,
        validator: (value) => Validation.formField(
          value: value,
          titleField: 'RT',
          minLength: 3,
          isNumericOnly: true,
          messageMinChar: 'Nomor RT tidak valid',
        ),
      ),
    );
  }

  Widget builderRW() {
    return Obx(
      () => CustomTextFormField(
        controller: controller.rwC,
        focusNode: controller.rwF,
        title: 'RW',
        hintText: 'Masukkan RW',
        maxLength: 3,
        keyboardType: TextInputType.number,
        suffixIconState: controller.rw.value.isNotEmpty,
        validator: (value) => Validation.formField(
          value: value,
          titleField: 'RW',
          minLength: 3,
          isNumericOnly: true,
          messageMinChar: 'Nomor RW tidak valid',
        ),
      ),
    );
  }

  Widget builderNameHamlet() {
    return Obx(
      () => CustomTextFormField(
        controller: controller.nameHamletC,
        focusNode: controller.nameHamletF,
        title: 'Nama Dusun*',
        hintText: 'Masukkan Nama Dusun',
        suffixIconState: controller.nameHamlet.value.isNotEmpty,
        keyboardType: TextInputType.streetAddress,
        validator: (value) => Validation.formField(
          value: value,
          titleField: 'Nama Dusun',
          messageMinChar: 'Nomor Nama dusun tidak valid',
        ),
      ),
    );
  }

  Widget builderPostalCode() {
    return Obx(
      () => CustomTextFormField(
        controller: controller.postalCodeC,
        focusNode: controller.postalCodeF,
        title: 'Kode Pos*',
        hintText: 'Masukkan Kode Pos',
        maxLength: 5,
        keyboardType: TextInputType.number,
        suffixIconState: controller.postalCode.value.isNotEmpty,
        validator: (value) => Validation.formField(
          value: value,
          titleField: 'Kode Pos',
          isNumericOnly: true,
          messageMinChar: 'Nomor Kode pos tidak valid',
        ),
      ),
    );
  }

  Widget builderResidence() {
    return CustomDropdownFormField(
      controller: controller.residenceC,
      focusNode: controller.residenceF,
      title: 'Tempat Tinggal*',
      hintText: 'Pilih Tempat Tinggal',
      items: controller.dataResidence,
      onChanged: controller.setResidence,
      validator: (value) => Validation.formField(
        value: value,
        titleField: 'Tempat Tinggal',
      ),
    );
  }

  Widget builderTransportation() {
    return CustomDropdownFormField(
      controller: controller.transportationC,
      focusNode: controller.transportationF,
      title: 'Transportasi*',
      hintText: 'Pilih Transportasi',
      items: controller.dataTransportation,
      onChanged: controller.setTransportation,
      validator: (value) => Validation.formField(
        value: value,
        titleField: 'Transportasi',
      ),
    );
  }

  Widget builderChildTo() {
    return Obx(
      () => CustomTextFormField(
        controller: controller.childToC,
        focusNode: controller.childToF,
        title: 'Anak ke (KK)*',
        hintText: 'Masukkan Anak ke',
        maxLength: 2,
        keyboardType: TextInputType.number,
        suffixIconState: controller.childTo.value.isNotEmpty,
        validator: (value) => Validation.formField(
          value: value,
          titleField: 'Anak ke',
          isNumericOnly: true,
          isNotZero: true,
        ),
      ),
    );
  }

  Widget builderFatherName() {
    return Obx(
      () => CustomTextFormField(
        controller: controller.fatherNameC,
        focusNode: controller.fatherNameF,
        title: 'Nama Ayah*',
        hintText: 'Masukkan Nama Ayah',
        suffixIconState: controller.fatherName.value.isNotEmpty,
        validator: (value) => Validation.formField(
          value: value,
          titleField: 'Nama Ayah',
        ),
      ),
    );
  }

  Widget builderNIKFather() {
    return Obx(
      () => CustomTextFormField(
        controller: controller.nikFatherC,
        focusNode: controller.nikFatherF,
        title: 'NIK Ayah*',
        hintText: 'Masukkan NIK Ayah',
        suffixIconState: controller.nikFather.value.isNotEmpty,
        keyboardType: TextInputType.number,
        maxLength: 15,
        validator: (value) => Validation.formField(
          value: value,
          titleField: 'NIK Ayah',
          isNumericOnly: true,
          minLength: 15,
          messageMinChar: 'NIK Ayah tidak valid',
        ),
      ),
    );
  }

  Widget builderMotherName() {
    return Obx(
      () => CustomTextFormField(
        controller: controller.motherNameC,
        focusNode: controller.motherNameF,
        title: 'Nama Ibu*',
        hintText: 'Masukkan Nama Ibu',
        suffixIconState: controller.motherName.value.isNotEmpty,
        validator: (value) => Validation.formField(
          value: value,
          titleField: 'Nama Ibu',
        ),
      ),
    );
  }

  Widget builderNIKMother() {
    return Obx(
      () => CustomTextFormField(
        controller: controller.nikMotherC,
        focusNode: controller.nikMotherF,
        title: 'NIK Ibu*',
        hintText: 'Masukkan NIK Ibu',
        suffixIconState: controller.nikMother.value.isNotEmpty,
        keyboardType: TextInputType.number,
        maxLength: 15,
        textInputAction: TextInputAction.done,
        onEditingComplete: controller.confirm,
        validator: (value) => Validation.formField(
          value: value,
          titleField: 'NIK Ibu',
          isNumericOnly: true,
          minLength: 15,
          messageMinChar: 'NIK Ibu tidak valid',
        ),
      ),
    );
  }
}
