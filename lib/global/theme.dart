import 'package:flutter/material.dart';
import 'package:news_api/global/breakpoints.dart';

extension BuildContextX<T> on BuildContext {
  /// Width of the MediaQuery
  double get width => MediaQuery.of(this).size.width;

  /// Height of the MediaQuery
  double get height => MediaQuery.of(this).size.height;

  /// Size of the MediaQuery
  Size get size => MediaQuery.of(this).size;

  /// Theme of the Context
  ThemeData get theme => Theme.of(this);

  /// Flag for small screen sizes
  bool get isScreenSmall =>
      MediaQuery.of(this).size.width <= NewsApiBreakpoints.small;

  /// Flag for medium screen sizes
  bool get isScreenMedium =>
      MediaQuery.of(this).size.width > NewsApiBreakpoints.small &&
      MediaQuery.of(this).size.width <= NewsApiBreakpoints.medium;

  /// Flag for large screen sizes
  bool get isScreenLarge =>
      MediaQuery.of(this).size.width > NewsApiBreakpoints.medium;
}
