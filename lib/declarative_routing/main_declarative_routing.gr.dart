// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:auto_route_playground/declarative_routing/main_declarative_routing.dart'
    as _i1;

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

/// generated route for
/// [_i1.SampleBottomSheetPage]
class SampleBottomSheetRoute extends _i2.PageRouteInfo<void> {
  const SampleBottomSheetRoute({List<_i2.PageRouteInfo>? children})
    : super(SampleBottomSheetRoute.name, initialChildren: children);

  static const String name = 'SampleBottomSheetRoute';

  static _i2.PageInfo page = _i2.PageInfo(
    name,
    builder: (data) {
      return const _i1.SampleBottomSheetPage();
    },
  );
}

/// generated route for
/// [_i1.SampleDialogPage]
class SampleDialogRoute extends _i2.PageRouteInfo<void> {
  const SampleDialogRoute({List<_i2.PageRouteInfo>? children})
    : super(SampleDialogRoute.name, initialChildren: children);

  static const String name = 'SampleDialogRoute';

  static _i2.PageInfo page = _i2.PageInfo(
    name,
    builder: (data) {
      return const _i1.SampleDialogPage();
    },
  );
}
