// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:auto_route_playground/paged_sheet/issue/issue_paged_sheet.dart'
    as _i1;

/// generated route for
/// [_i1.FirstSheetScreen]
class FirstSheetRoute extends _i2.PageRouteInfo<void> {
  const FirstSheetRoute({List<_i2.PageRouteInfo>? children})
    : super(FirstSheetRoute.name, initialChildren: children);

  static const String name = 'FirstSheetRoute';

  static _i2.PageInfo page = _i2.PageInfo(
    name,
    builder: (data) {
      return const _i1.FirstSheetScreen();
    },
  );
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
