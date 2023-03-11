import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

calculateSelectedIndex(BuildContext context) {
  final String location = GoRouterState.of(context).location;
  if (location.startsWith('/setting')) {
    return 3;
  }
  if (location.startsWith('/favorite')) {
    return 2;
  }
  if (location.startsWith('/search')) {
    return 1;
  }
  if (location.startsWith('/')) {
    return 0;
  }

  return 0;
}

onItemTapped(int index, BuildContext context) {
  switch (index) {
    case 0:
      GoRouter.of(context).go('/');
      break;
    case 1:
      GoRouter.of(context).go('/search');
      break;
    case 2:
      GoRouter.of(context).go('/favorite');
      break;
    case 3:
      GoRouter.of(context).go('/setting');
      break;
  }
}
