import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppdb/utils/constants_assets.dart';

import '../buttons/custom_filled_button.dart';
import '../card/cards.dart';

class CustomMainView2 extends StatelessWidget {
  final Widget child;

  const CustomMainView2({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand, 
          children: [
            Positioned.fill(
              child: Image.asset(
                ConstantsAssets.imgBgHead2,
                alignment: Alignment.topCenter,
              ),
            ),
            Positioned.fill(
              bottom: 80,
              child: SingleChildScrollView(
                child: Cards.elevated(
                  outPadding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 12,
                  ),
                  child: child,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 12,
                  right: 12,
                  bottom: 12,
                ),
                child: CustomFilledButton(
                  width: double.infinity,
                  isFilledTonal: false,
                  onPressed: Get.back,
                  child: const Text('Kembali'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
