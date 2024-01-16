import 'package:flutter/material.dart';
import 'package:nomabe/core/themes/nomabetokens.dart';

class NomabeTheme {
  NomabeTheme._();

  static final theme = ThemeData.from(
    colorScheme: const ColorScheme(
      primary: NomabeTokens.nomabeDarkBlue,
      secondary: NomabeTokens.nomabeTeal,
      surface: NomabeTokens.nomabeBlue,
      background: NomabeTokens.nomabeBlue,
      error: NomabeTokens.nomabeRed,
      onPrimary: NomabeTokens.nomabeGrey,
      onSecondary: NomabeTokens.nomabeBlue,
      onSurface: NomabeTokens.nomabeGrey,
      onBackground: NomabeTokens.nomabeGrey,
      onError: NomabeTokens.nomabeGrey,
      brightness: NomabeTokens.nomabeBrightnessLight,
    ),
  );

  static final inverseTheme = ThemeData.from(
    colorScheme: const ColorScheme(
      primary: NomabeTokens.nomabeOrangeShade,
      secondary: NomabeTokens.nomabeLightCoral,
      surface: NomabeTokens.nomabeLightGray,
      background: NomabeTokens.nomabeLightGray,
      error: NomabeTokens.nomabeTurquoise,
      onPrimary: NomabeTokens.nomabeGrey,
      onSecondary: NomabeTokens.nomabeWhite,
      onSurface: NomabeTokens.nomabeGrey,
      onBackground: NomabeTokens.nomabeGrey,
      onError: NomabeTokens.nomabeGrey,
      brightness: NomabeTokens.nomabeBrightnessDark,
    ),
  );
}
