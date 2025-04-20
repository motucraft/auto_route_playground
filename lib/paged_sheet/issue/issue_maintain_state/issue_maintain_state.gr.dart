// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:auto_route_playground/paged_sheet/issue/issue_maintain_state/issue_maintain_state.dart'
    as _i1;
import 'package:flutter/material.dart' as _i3;

/// generated route for
/// [_i1.FirstSheetScreen]
class FirstSheetRoute extends _i2.PageRouteInfo<FirstSheetRouteArgs> {
  FirstSheetRoute({
    _i3.Key? key,
    int? value = 0,
    List<_i2.PageRouteInfo>? children,
  }) : super(
         FirstSheetRoute.name,
         args: FirstSheetRouteArgs(key: key, value: value),
         initialChildren: children,
       );

  static const String name = 'FirstSheetRoute';

  static _i2.PageInfo page = _i2.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FirstSheetRouteArgs>(
        orElse: () => const FirstSheetRouteArgs(),
      );
      return _i1.FirstSheetScreen(key: args.key, value: args.value);
    },
  );
}

class FirstSheetRouteArgs {
  const FirstSheetRouteArgs({this.key, this.value = 0});

  final _i3.Key? key;

  final int? value;

  @override
  String toString() {
    return 'FirstSheetRouteArgs{key: $key, value: $value}';
  }
}

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i2.PageRouteInfo<void> {
  const HomeRoute({List<_i2.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i2.PageInfo page = _i2.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomeScreen();
    },
  );
}
