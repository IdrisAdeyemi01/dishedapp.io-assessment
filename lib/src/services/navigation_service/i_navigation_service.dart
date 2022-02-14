import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'navigation_service.dart';

abstract class INavigationService {
  GlobalKey<NavigatorState> get navigatorKey;

  Future<T?>? toNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  });

  Future<T?>? pushReplace<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  });

  void back<T extends Object?>([T? result]);

  Future<dynamic> showBottomSheet<T>({
    required Widget builderWidget,
    Color? backgroundColor,
    bool? isScrolledControlled,
    ShapeBorder? shape,
    BoxConstraints? constraints,
  });

  Future<dynamic> showCustomDialog<T>({required Widget alertWidget});
}

final navigationService = Provider<INavigationService>(
  (ref) => NavigationService(),
);
