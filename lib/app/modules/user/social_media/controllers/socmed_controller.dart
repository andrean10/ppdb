import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:ppdb/app/data/socmed_model/socmed_model.dart';
import 'package:flutter_any_logo/flutter_logo.dart';
import 'package:url_launcher/url_launcher.dart';

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
          onPressed: () async {
            final uri = Uri.parse(
              'https://www.facebook.com/share/94LvBEuL2MYxuuCk/?mibextid=qi2Omg',
            );
            _launchUrl(uri);
          },
        ),
        SocmedModel(
          icons: AnyLogo.media.youtube.image(),
          title: 'Youtube',
          onPressed: () {
            final uri = Uri.parse(
              'https://youtube.com/@sdnegeri034telukmega?si=s7GjY1xm9FHmWDK4',
            );
            _launchUrl(uri);
          },
        ),
        SocmedModel(
          icons: AnyLogo.media.instagram.image(),
          title: 'Instagram',
          onPressed: () {
            final uri = Uri.parse(
              'https://www.instagram.com/twtbtls?igsh=MXZ4YXdueW1tOWRzMA==',
            );
            _launchUrl(uri);
          },
        ),
      ],
    );
  }

  void _launchUrl(Uri uri) async {
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }
}
