import 'package:flutter/material.dart';

 
extension ThemeExtensions on BuildContext {
  
  // gradient theme

  // text theme
  TextStyle get bodyMedium => Theme.of(this).textTheme.bodyMedium!;
  TextStyle get bodySmall => Theme.of(this).textTheme.bodySmall!;
  TextStyle get titleLarge => Theme.of(this).textTheme.titleLarge!;
  TextStyle get titleMedium => Theme.of(this).textTheme.titleMedium!;
  TextStyle get titleSmall => Theme.of(this).textTheme.titleSmall!;
  TextStyle get labelLarge => Theme.of(this).textTheme.labelLarge!;
  TextStyle get labelMedium => Theme.of(this).textTheme.labelMedium!;
  TextStyle get labelSmall => Theme.of(this).textTheme.labelSmall!;
  TextStyle get headlineLarge => Theme.of(this).textTheme.headlineLarge!;
  TextStyle get headlineMedium => Theme.of(this).textTheme.headlineMedium!;
  TextStyle get headlineSmall => Theme.of(this).textTheme.headlineSmall!;
  TextStyle get displayLarge => Theme.of(this).textTheme.displayLarge!;
  TextStyle get displayMedium => Theme.of(this).textTheme.displayMedium!;

  // color extension
  Color get primary => Theme.of(this).colorScheme.primary;
  Color get onPrimary => Theme.of(this).colorScheme.onPrimary;
  Color get onPrimaryContainer => Theme.of(this).colorScheme.onPrimaryContainer;
  Color get onSurfaceVariant => Theme.of(this).colorScheme.onSurfaceVariant;
  Color get secondary => Theme.of(this).colorScheme.secondary;
  Color get onSecondary => Theme.of(this).colorScheme.onSecondary;
  Color get error => Theme.of(this).colorScheme.error;
  Color get onError => Theme.of(this).colorScheme.onError;
  Color get background => Theme.of(this).colorScheme.background;
  Color get onBackground => Theme.of(this).colorScheme.onBackground;
  Color get surface => Theme.of(this).colorScheme.surface;
  Color get onSurface => Theme.of(this).colorScheme.onSurface;
  Color get primaryContainer => Theme.of(this).colorScheme.primaryContainer;
  Color get tertiary => Theme.of(this).colorScheme.tertiary;
  Color get outline => Theme.of(this).colorScheme.outline;
  Color get inverseSurface => Theme.of(this).colorScheme.inverseSurface;
  Color get secondaryContainer => Theme.of(this).colorScheme.secondaryContainer;
  Color get onInverseSurface => Theme.of(this).colorScheme.onInverseSurface;
  Color get shadow => Theme.of(this).colorScheme.shadow;
  Color get outlineVariant => Theme.of(this).colorScheme.outlineVariant;
  Color get inversePrimary => Theme.of(this).colorScheme.inversePrimary;
  Color get surfaceVariant => Theme.of(this).colorScheme.surfaceVariant;
}
