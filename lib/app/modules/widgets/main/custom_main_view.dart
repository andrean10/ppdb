import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:ppdb/app/modules/widgets/buttons/custom_filled_button.dart';

import '../../../../utils/constants_assets.dart';
import '../card/cards.dart';

class CustomMainView extends StatelessWidget {
  final Widget? title;
  final List<Widget>? actions;
  final Widget builder;
  final bool isBack;

  const CustomMainView({
    this.title,
    this.actions,
    required this.builder,
    required this.isBack,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(ConstantsAssets.imgLogo),
        title: title,
        actions: actions,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // final width = constraints.maxWidth;
          final height = constraints.maxHeight;

          return Stack(
            children: [
              Container(
                width: double.infinity,
                height: height / 2,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ConstantsAssets.imgBgHead),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Cards.elevated(
                      outPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 18,
                      ),
                      inPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 16,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          builder,
                        ],
                      ),
                    ),
                    isBack
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Gap(16),
                                CustomFilledButton(
                                  width: double.infinity,
                                  isFilledTonal: false,
                                  onPressed: Get.back,
                                  child: const Text('Kembali'),
                                ),
                              ],
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
