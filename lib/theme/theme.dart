import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff00696c),
      surfaceTint: Color(0xff00696c),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff9cf1f4),
      onPrimaryContainer: Color(0xff002021),
      secondary: Color(0xffFEC0AA),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffffdbcf),
      onSecondaryContainer: Color(0xff380d00),
      tertiary: Color(0xff4d5f7c),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffd5e3ff),
      onTertiaryContainer: Color(0xff071c36),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfff4fbfa),
      onSurface: Color(0xff161d1d),
      onSurfaceVariant: Color(0xff3f4949),
      outline: Color(0xff6f7979),
      outlineVariant: Color(0xffbec8c8),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3232),
      inversePrimary: Color(0xff80d4d7),
      primaryFixed: Color(0xff9cf1f4),
      onPrimaryFixed: Color(0xff002021),
      primaryFixedDim: Color(0xff80d4d7),
      onPrimaryFixedVariant: Color(0xff004f52),
      secondaryFixed: Color(0xffffdbcf),
      onSecondaryFixed: Color(0xff380d00),
      secondaryFixedDim: Color(0xffffb59a),
      onSecondaryFixedVariant: Color(0xff72361e),
      tertiaryFixed: Color(0xffd5e3ff),
      onTertiaryFixed: Color(0xff071c36),
      tertiaryFixedDim: Color(0xffb5c7e9),
      onTertiaryFixedVariant: Color(0xff354763),
      surfaceDim: Color(0xffd5dbdb),
      surfaceBright: Color(0xfff4fbfa),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff5f4),
      surfaceContainer: Color(0xffe9efef),
      surfaceContainerHigh: Color(0xffe3e9e9),
      surfaceContainerHighest: Color(0xffdde4e3),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff004b4d),
      surfaceTint: Color(0xff00696c),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff238184),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff6d321a),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffa96247),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff31435f),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff637594),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff4fbfa),
      onSurface: Color(0xff161d1d),
      onSurfaceVariant: Color(0xff3b4545),
      outline: Color(0xff576161),
      outlineVariant: Color(0xff737d7d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3232),
      inversePrimary: Color(0xff80d4d7),
      primaryFixed: Color(0xff238184),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff00676a),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xffa96247),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff8c4a31),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff637594),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff4b5d7a),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd5dbdb),
      surfaceBright: Color(0xfff4fbfa),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff5f4),
      surfaceContainer: Color(0xffe9efef),
      surfaceContainerHigh: Color(0xffe3e9e9),
      surfaceContainerHighest: Color(0xffdde4e3),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff002728),
      surfaceTint: Color(0xff00696c),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff004b4d),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff421201),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff6d321a),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff0f233d),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff31435f),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff4fbfa),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff1c2626),
      outline: Color(0xff3b4545),
      outlineVariant: Color(0xff3b4545),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3232),
      inversePrimary: Color(0xffa6fafd),
      primaryFixed: Color(0xff004b4d),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff003334),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff6d321a),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff501c07),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff31435f),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff1a2d48),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd5dbdb),
      surfaceBright: Color(0xfff4fbfa),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff5f4),
      surfaceContainer: Color(0xffe9efef),
      surfaceContainerHigh: Color(0xffe3e9e9),
      surfaceContainerHighest: Color(0xffdde4e3),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff80d4d7),
      surfaceTint: Color(0xff80d4d7),
      onPrimary: Color(0xff003738),
      primaryContainer: Color(0xff004f52),
      onPrimaryContainer: Color(0xff9cf1f4),
      secondary: Color(0xffffb59a),
      onSecondary: Color(0xff55200a),
      secondaryContainer: Color(0xff72361e),
      onSecondaryContainer: Color(0xffffdbcf),
      tertiary: Color(0xffb5c7e9),
      onTertiary: Color(0xff1e314c),
      tertiaryContainer: Color(0xff354763),
      onTertiaryContainer: Color(0xffd5e3ff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff0e1415),
      onSurface: Color(0xffdde4e3),
      onSurfaceVariant: Color(0xffbec8c8),
      outline: Color(0xff899393),
      outlineVariant: Color(0xff3f4949),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdde4e3),
      inversePrimary: Color(0xff00696c),
      primaryFixed: Color(0xff9cf1f4),
      onPrimaryFixed: Color(0xff002021),
      primaryFixedDim: Color(0xff80d4d7),
      onPrimaryFixedVariant: Color(0xff004f52),
      secondaryFixed: Color(0xffffdbcf),
      onSecondaryFixed: Color(0xff380d00),
      secondaryFixedDim: Color(0xffffb59a),
      onSecondaryFixedVariant: Color(0xff72361e),
      tertiaryFixed: Color(0xffd5e3ff),
      onTertiaryFixed: Color(0xff071c36),
      tertiaryFixedDim: Color(0xffb5c7e9),
      onTertiaryFixedVariant: Color(0xff354763),
      surfaceDim: Color(0xff0e1415),
      surfaceBright: Color(0xff343a3a),
      surfaceContainerLowest: Color(0xff090f0f),
      surfaceContainerLow: Color(0xff161d1d),
      surfaceContainer: Color(0xff1a2121),
      surfaceContainerHigh: Color(0xff252b2b),
      surfaceContainerHighest: Color(0xff303636),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff84d8dc),
      surfaceTint: Color(0xff80d4d7),
      onPrimary: Color(0xff001a1b),
      primaryContainer: Color(0xff479da1),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffffbba3),
      onSecondary: Color(0xff2f0a00),
      secondaryContainer: Color(0xffca7d60),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffb9cced),
      onTertiary: Color(0xff021630),
      tertiaryContainer: Color(0xff7f92b1),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff0e1415),
      onSurface: Color(0xfff6fcfc),
      onSurfaceVariant: Color(0xffc2cdcd),
      outline: Color(0xff9ba5a5),
      outlineVariant: Color(0xff7b8585),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdde4e3),
      inversePrimary: Color(0xff005153),
      primaryFixed: Color(0xff9cf1f4),
      onPrimaryFixed: Color(0xff001415),
      primaryFixedDim: Color(0xff80d4d7),
      onPrimaryFixedVariant: Color(0xff003d3f),
      secondaryFixed: Color(0xffffdbcf),
      onSecondaryFixed: Color(0xff260700),
      secondaryFixedDim: Color(0xffffb59a),
      onSecondaryFixedVariant: Color(0xff5d260f),
      tertiaryFixed: Color(0xffd5e3ff),
      onTertiaryFixed: Color(0xff001129),
      tertiaryFixedDim: Color(0xffb5c7e9),
      onTertiaryFixedVariant: Color(0xff243752),
      surfaceDim: Color(0xff0e1415),
      surfaceBright: Color(0xff343a3a),
      surfaceContainerLowest: Color(0xff090f0f),
      surfaceContainerLow: Color(0xff161d1d),
      surfaceContainer: Color(0xff1a2121),
      surfaceContainerHigh: Color(0xff252b2b),
      surfaceContainerHighest: Color(0xff303636),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffeaffff),
      surfaceTint: Color(0xff80d4d7),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff84d8dc),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffff9f8),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffffbba3),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffbfaff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffb9cced),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff0e1415),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfff3fdfd),
      outline: Color(0xffc2cdcd),
      outlineVariant: Color(0xffc2cdcd),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdde4e3),
      inversePrimary: Color(0xff003031),
      primaryFixed: Color(0xffa0f5f8),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xff84d8dc),
      onPrimaryFixedVariant: Color(0xff001a1b),
      secondaryFixed: Color(0xffffe0d6),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffffbba3),
      onSecondaryFixedVariant: Color(0xff2f0a00),
      tertiaryFixed: Color(0xffdce7ff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffb9cced),
      onTertiaryFixedVariant: Color(0xff021630),
      surfaceDim: Color(0xff0e1415),
      surfaceBright: Color(0xff343a3a),
      surfaceContainerLowest: Color(0xff090f0f),
      surfaceContainerLow: Color(0xff161d1d),
      surfaceContainer: Color(0xff1a2121),
      surfaceContainerHigh: Color(0xff252b2b),
      surfaceContainerHighest: Color(0xff303636),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.surface,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
