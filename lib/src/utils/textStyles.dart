import 'package:flutter/material.dart';

import '../utils/constants.dart';

abstract class TextStyles {
  static const TextStyle bottomNavigationLabelTextStyle = TextStyle(
    fontSize: Constants.bottomNavigationLabelFontSize,
    fontWeight: FontWeight.w700,
    height: Constants.bottomNavigationTextHeight,
  );
  static const TextStyle bottomNavigationScoreLabelTextStyle = TextStyle(
    fontSize: Constants.bottomNavigationScoreLabelFontSize,
    fontWeight: FontWeight.w400,
    height: Constants.bottomNavigationTextHeight,
  );
  static const TextStyle bottomNavigationScoreValueTextStyle = TextStyle(
    fontSize: Constants.bottomNavigationScoreValueFontSize,
    fontWeight: FontWeight.w400,
    height: Constants.bottomNavigationTextHeight,
  );
}
