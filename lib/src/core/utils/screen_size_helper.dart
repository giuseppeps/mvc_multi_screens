import 'package:flutter/widgets.dart';

enum ScreenType { small, medium, large }

class ScreenSizeHelper {
  static ScreenType getScreenType(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < 600) {
      return ScreenType.small;
    } else if (width < 1200) {
      return ScreenType.medium;
    } else {
      return ScreenType.large;
    }
  }
}
