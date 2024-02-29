import 'package:fms/core/constant/text_styles.dart';
import 'package:flutter/cupertino.dart' show CupertinoTheme, CupertinoThemeData;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../styles/theme.dart';
import '/core/localization/locale_manager.dart';
import '/core/mixins/extension/responsive_ui.dart';
import '/core/permission/permisson_manager.dart';
import '/core/styles/theme_manager.dart';
import '/generated/l10n.dart';

/// Extensions for general basic [Context]
extension ContextExtensions on BuildContext {
  MaterialResponsiveUiData get _mdResponsive =>
      MaterialResponsiveUiData.of(this);

  /// 	Extension for getting permission
  PermissionManager get permissionManager => watch<PermissionManager>();

  /// 	Extension for getting Locale
  Locale get locale => watch<LocaleManager>().current;

  /// Returns Material no. of Columns as per Material Design Guidlines.
  int get mdColumns => _mdResponsive.columns;

  /// Returns Material no. of Gutters as per Material Design Guidlines.
  double get mdGutter => _mdResponsive.gutter;

  /// Returns device Type  as per Material Design Guidlines.
  MobileDeviceType get mdDeviceType => _mdResponsive.deviceInfo.deviceType;

  /// Returns device size as per Material Design Guidlines.
  MobileDeviceSize get mdDeviceSize => _mdResponsive.deviceInfo.deviceSize;

  /// Returns the current window size as per Material Design Guidlines.
  WindowSize get mdWindowSize => _mdResponsive.windowSize;

  /// Check if the window size is of Mobile Type as per Material Design Guidlines.
  bool get isMobile => mdWindowSize == WindowSize.xsmall;

  /// Returns if it's a handset as per Material Design Guidlines.
  bool get isMobileTypeHandset => mdDeviceType == MobileDeviceType.handset;

  /// Returns if it's a tablet as per Material Design Guidlines.
  bool get isMobileTypeTablet => mdDeviceType == MobileDeviceType.tablet;

  /// To get a [MediaQuery] directly.
  MediaQueryData get mq => MediaQuery.of(this);

  /// Get MediaQuery Screen Size
  Size get screenSize => MediaQuery.sizeOf(this);

  /// Get MediaQuery Screen Density
  double get screenDensity => mq.devicePixelRatio;

  /// Get MediaQuery Screen Padding
  EdgeInsets get screenPadding => mq.padding;

  /// Get MediaQuery Screen Width
  double get screenWidth => mq.size.width;

  /// Get MediaQuery Screen Height
  double get screenHeight => mq.size.height;

  /// Get MediaQuery Screen Width in percentage
  double get percentWidth => screenWidth / 100;

  /// Get MediaQuery Screen height in percentage
  double get percentHeight => screenHeight / 100;

  /// Get MediaQuery safearea padding horizontally
  double get _safeAreaHorizontal => mq.padding.left + mq.padding.right;

  /// Get MediaQuery safearea padding vertically
  double get _safeAreaVertical => mq.padding.top + mq.padding.bottom;

  /// Get MediaQuery Screen Width in percentage including safe area calculation.
  double get safePercentWidth => (screenWidth - _safeAreaHorizontal) / 100;

  /// Get MediaQuery Screen Height in percentage including safe area calculation.
  double get safePercentHeight => (screenHeight - _safeAreaVertical) / 100;

  /// Gives you the power to get a portion of the height.
  /// Useful for responsive applications.
  ///
  /// [dividedBy] is for when you want to have a portion of the value you
  /// would get like for example: if you want a value that represents a third
  /// of the screen you can set it to 3, and you will get a third of the height
  ///
  /// [reducedBy] is a percentage value of how much of the height you want
  /// if you for example want 46% of the height, then you reduce it by 56%.
  double heightTransformer({double dividedBy = 1, double reducedBy = 0.0}) =>
      (screenSize.height - ((screenSize.height / 100) * reducedBy)) / dividedBy;

  /// Gives you the power to get a portion of the width.
  /// Useful for responsive applications.
  ///
  /// [dividedBy] is for when you want to have a portion of the value you
  /// would get like for example: if you want a value that represents a third
  /// of the screen you can set it to 3, and you will get a third of the width
  ///
  /// [reducedBy] is a percentage value of how much of the width you want
  /// if you for example want 46% of the width, then you reduce it by 56%.
  double widthTransformer({double dividedBy = 1, double reducedBy = 0.0}) =>
      (screenSize.width - ((screenSize.width / 100) * reducedBy)) / dividedBy;

  /// Divide the height proportionally by the given value
  double ratio(
          {double dividedBy = 1,
          double reducedByW = 0.0,
          double reducedByH = 0.0}) =>
      heightTransformer(dividedBy: dividedBy, reducedBy: reducedByH) /
      widthTransformer(dividedBy: dividedBy, reducedBy: reducedByW);

  ///Returns Orientation using [MediaQuery]
  Orientation get orientation => mq.orientation;

  /// Returns if Orientation is landscape
  bool get isLandscape => orientation == Orientation.landscape;

  /// True if width be larger than 800
  bool get canShowNavRail => screenWidth > 800;

  /// 	Extension for getting Theme
  ThemeData get theme => watch<ThemeManager>().current.theme;

  /// Extension for getting [CupertinoThemeData]
  CupertinoThemeData get cupertinoTheme => CupertinoTheme.of(this);

  /// Extension for getting textTheme
  AppTextTheme get textTheme => Theme.of(this).extension<AppTextTheme>()!;

  ColorScheme get colors => theme.colorScheme;

  ///
  /// The foreground color for widgets (knobs, text, overscroll edge effect, etc).
  ///
  /// Accent color is also known as the secondary color.
  ///
  ///

  Color get accentColor => theme.colorScheme.secondary;

  ///
  /// The background color for major parts of the app (toolbars, tab bars, etc).
  ///
  Color get primaryColor => theme.primaryColor;

  ///
  /// A color that contrasts with the [primaryColor].
  ///
  Color get backgroundColor => theme.colorScheme.background;

  ///
  /// The default color of [MaterialType.canvas] [Material].
  ///
  Color get canvasColor => theme.canvasColor;

  ///
  /// The default color of [MaterialType.card] [Material].
  ///
  Color get cardColor => theme.cardColor;

  ///
  /// The default brightness of the [Theme].
  ///
  Brightness get brightness => theme.brightness;

  /// If the [ThemeData] of the current [BuildContext] is dark
  bool get isDarkMode => theme.brightness == Brightness.dark;

  /// Extension for navigation to next page
  /// Returns The state from the closest instance of this class that encloses the given context.
  ///
  /// It is used for routing in flutter
  ///
  NavigatorState? get navigator => Navigator.of(this);

  ///
  /// Pushes the built widget to the screen using the material fade in animation
  ///
  /// Will return a value when the built widget calls [pop]
  ///
  Future<T?> push<T>(WidgetBuilder builder) async {
    return await Modular.to.push(MaterialPageRoute(builder: builder));
  }

  ///
  /// Removes the top most Widget in the navigator's stack
  ///
  /// Will return the [result] to the caller of [push]
  ///
  void pop<T>([T? result]) => Modular.to.pop(result);

  ///
  /// Pushes the built widget to the screen using the material fade in animation
  ///
  Future<T?> nextRoute<T extends Object?>(
    String page, {
    Object? arguments,
    bool forRoot = false,
  }) =>
      _nextPage(page, arguments: arguments, forRoot: forRoot);

  /// Pushes and replacing the built widget to the screen using the material fade in animation
  Future<T?> nextReplacementRoute<T extends Object?>(
    String page, {
    Object? arguments,
    bool forRoot = false,
  }) =>
      _nextReplacementPage(page, arguments: arguments, forRoot: forRoot);

  /// Removing all the widgets till defined rule, and pushes the built widget to the screen using the material fade in animation
  Future<T?> nextAndRemoveUntilRoute<T extends Object?>(
    String page, {
    Object? arguments,
    bool forRoot = false,
  }) =>
      _nextAndRemoveUntilPage(page, arguments: arguments, forRoot: forRoot);

  /// Action Extension
  bool? invokeAction(Intent intent) => Actions.invoke(this, intent) as bool?;

  /// Returns The state from the closest instance of this class that encloses the given context.
  /// It is used for validating forms
  FormState? get form => Form.of(this);

  ///
  /// Returns The current [Language] of the app as specified in the [Localizations] widget.
  ///
  L get language => L.of(this);

  /// Returns The state from the closest instance of this class that encloses the given context.
  ///
  /// It is used for showing widgets on top of everything.
  ///
  OverlayState? get overlay => Overlay.of(this);

  ///
  /// Insert the given widget into the overlay.
  /// The newly inserted widget will always be at the top.
  ///
  OverlayEntry addOverlay(WidgetBuilder builder) {
    final entry = OverlayEntry(builder: builder);
    overlay!.insert(entry);
    return entry;
  }

  ///
  /// Returns the closest instance of [ScaffoldState] in the widget tree,
  /// which can be use to get information about that scaffold.
  ///
  /// If there is no [Scaffold] in scope, then this will throw an exception.
  ///
  ScaffoldState get scaffold => Scaffold.of(this);
}

Future<T?> _nextPage<T extends Object?>(
  String page, {
  Object? arguments,
  bool forRoot = false,
}) async =>
    await Modular.to.pushNamed(page, arguments: arguments, forRoot: forRoot);
Future<T?> _nextReplacementPage<T extends Object?>(
  String page, {
  Object? arguments,
  bool forRoot = false,
}) async =>
    await Modular.to
        .pushReplacementNamed(page, arguments: arguments, forRoot: forRoot);
Future<T?> _nextAndRemoveUntilPage<T extends Object?>(
  String page, {
  Object? arguments,
  bool forRoot = false,
}) async =>
    await Modular.to.pushNamedAndRemoveUntil(page, (route) => false,
        arguments: arguments, forRoot: forRoot);
