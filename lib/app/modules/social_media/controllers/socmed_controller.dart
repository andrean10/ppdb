import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:ppdb/app/data/socmed_model/socmed_model.dart';
import 'package:flutter_any_logo/flutter_logo.dart';

class SocmedController extends GetxController {
  final listSocmed = <SocmedModel>[];
  final logger = Logger();

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() {
    listSocmed.addAll(
      [
        SocmedModel(
          icons: AnyLogo.media.facebook.image(),
          title: 'Facebook',
          onPressed: () {},
        ),
        SocmedModel(
          icons: AnyLogo.media.youtube.image(),
          title: 'Youtube',
          onPressed: () {},
        ),
        SocmedModel(
          icons: AnyLogo.media.instagram.image(),
          title: 'Instagram',
          onPressed: () {},
        ),
      ],
    );
  }
}
