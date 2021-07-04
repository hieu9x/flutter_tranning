import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppAssets {
  AppAssets._();

  // Base
  static const String baseImg = 'assets/images';
  static const String baseIcon = 'assets/icons';

  // Images
  static const String bgSplash = '$baseImg/bg_splash.png';
  static const String bgLogo = '$baseImg/logo.jpg';
  static const String bgNotFound = '$baseImg/img_not_found.jpg';
  // Icons
  static const String icPlay = '$baseIcon/ic_play.svg';

  static Future precacheAssets(BuildContext context) async {
    await Future.wait([
      // Images
      precacheImage(const AssetImage(AppAssets.bgSplash), context),
      precacheImage(const AssetImage(AppAssets.bgLogo), context),
      precacheImage(const AssetImage(AppAssets.bgNotFound), context),
      // Icons
      precachePicture(
        ExactAssetPicture(SvgPicture.svgStringDecoder, AppAssets.icPlay),
        context,
      ),
    ]);
  }
}
