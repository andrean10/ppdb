import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:ppdb/app/modules/widgets/buttons/custom_filled_button.dart';
import 'package:ppdb/app/modules/widgets/buttons/custom_text_button.dart';
import 'package:ppdb/utils/constants_assets.dart';

import '../../../helpers/validations.dart';
import '../../widgets/card/cards.dart';
import '../../widgets/textformfield/custom_textform_field.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ConstantsAssets.imgBg),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: builderCard(textTheme),
          ),
        ),
      ),
    );
  }

  Widget builderCard(TextTheme textTheme) {
    return Cards.elevated(
      outPadding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 32,
      ),
      inPadding: const EdgeInsets.symmetric(
        horizontal: 21,
        vertical: 42,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LayoutBuilder(builder: (context, constraints) {
            final maxWidth = constraints.maxWidth;

            return Image.asset(
              ConstantsAssets.imgLogo,
              width: maxWidth / 2.5,
            );
          }),
          const Gap(4),
          builderForm(),
          const Gap(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText(
                'Sudah Punya Akun?',
                style: textTheme.labelLarge,
              ),
              CustomTextButton(
                onPressed: controller.moveToLogin,
                child: const Text('Login'),
              ),
            ],
          ),
          const Gap(6),
          Obx(
            () => CustomFilledButton(
              width: double.infinity,
              onPressed: controller.confirm,
              isFilledTonal: false,
              state: controller.isLoading.value,
              child: const Text('Daftar'),
            ),
          ),
        ],
      ),
    );
  }

  Widget builderForm() {
    return Form(
      key: controller.formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          builderUsername(),
          const Gap(12),
          builderEmail(),
          const Gap(12),
          builderPassword(),
        ],
      ),
    );
  }

  Widget builderUsername() {
    return Obx(
      () => CustomTextFormField(
        controller: controller.usernameC,
        focusNode: controller.usernameF,
        title: 'Username',
        hintText: 'test',
        suffixIconState: controller.username.value.isNotEmpty,
        keyboardType: TextInputType.name,
        textCapitalization: TextCapitalization.none,
        validator: (value) => Validation.formField(
          value: value,
          titleField: 'Username',
        ),
      ),
    );
  }

  Widget builderEmail() {
    return Obx(
      () => CustomTextFormField(
        controller: controller.emailC,
        focusNode: controller.emailF,
        title: 'Email',
        hintText: 'test@gmail.com',
        suffixIconState: controller.email.value.isNotEmpty,
        keyboardType: TextInputType.emailAddress,
        textCapitalization: TextCapitalization.none,
        errorText: controller.errMsg.value,
        validator: (value) => Validation.formField(
          value: value,
          titleField: 'Email',
          isEmail: true,
        ),
      ),
    );
  }

  Widget builderPassword() {
    return Obx(
      () => CustomTextFormField(
        controller: controller.passwordC,
        focusNode: controller.passwordF,
        title: 'Password',
        hintText: '*******',
        keyboardType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.done,
        suffixIcon: IconButton(
          onPressed: controller.setHidePassword,
          icon: Icon(
            controller.isHidePassword.value
                ? Icons.visibility_off_rounded
                : Icons.visibility_rounded,
          ),
        ),
        obscureText: controller.isHidePassword.value,
        maxLines: 1,
        onEditingComplete: controller.confirm,
        validator: (value) => Validation.formField(
          value: value,
          titleField: 'Password',
          minLength: 6,
        ),
      ),
    );
  }
}
