import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_app/module/home_module/model/home_model.dart';

import '../../module/favorite_module/favorite_screen.dart';

import '../../module/home_module/screen/home_detail_screen.dart';
import '../../module/home_module/screen/home_screen.dart';
import '../../module/main_navbar/scaffold_navbar.dart';
import '../../module/search_module/search_screen.dart';
import '../../module/setting_module/setting_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');
const _scaffoldKey = ValueKey<String>('App scaffold');
// const loginInfo = LogInScreen();

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: <RouteBase>[
    // GoRoute(

    //   path: '/splash_screen',
    //   pageBuilder: (context, state) => CustomTransitionPage(
    //     child: const OnboardingScreen(),
    //     transitionsBuilder: (context, animation, secondaryAnimation, child) =>
    //         FadeTransition(
    //       opacity: animation,
    //       child: child,
    //     ),
    //   ),
    // ),

    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      pageBuilder: (context, state, widget) => CustomTransitionPage(
        child: ScaffoldWithNavBar(child: widget),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          pageBuilder: (context, state) => CustomTransitionPage(
            child: const HomeScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(
              key: _scaffoldKey,
              opacity: animation,
              child: child,
            ),
          ),
          builder: (BuildContext context, GoRouterState state) {
            return const HomeScreen();
          },
          routes: <RouteBase>[
            GoRoute(
              // path: ':id',
              path: 'detail',
              name: 'DetailBook',
              // parentNavigatorKey: _rootNavigatorKey,
              pageBuilder: (context, state) => CustomTransitionPage(
                child: HomeDetailScreen(
                  homeModel: state.extra as HomeModel,
                ),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) =>
                        FadeTransition(
                  key: _scaffoldKey,
                  opacity: animation,
                  child: child,
                ),
              ),
            ),
          ],
        ),
        // GoRoute(
        //   path: '/wishlist',
        //   pageBuilder: (context, state) => CustomTransitionPage(
        //     child: const ScreenWishlist(),
        //     transitionDuration: const Duration(seconds: 2),
        //     transitionsBuilder:
        //         (context, animation, secondaryAnimation, child) => child,
        //   ),
        //   routes: <RouteBase>[
        //     GoRoute(
        //       path: ':id',
        //       name: 'DetailWishlist',
        //       parentNavigatorKey: _rootNavigatorKey,
        //       builder: (BuildContext context, GoRouterState state) {
        //         return DetailsScreen(
        //           appModel: state.extra as AppModel,
        //         );
        //       },
        //     ),
        //   ],
        // ),
        GoRoute(
          path: '/search',
          pageBuilder: (context, state) => CustomTransitionPage(
            child: const SearchScreen(),
            transitionDuration: const Duration(seconds: 2),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) => child,
          ),
        ),
        GoRoute(
          path: '/favorite',
          pageBuilder: (context, state) => CustomTransitionPage(
            child: const FavoriteScreen(),
            transitionDuration: const Duration(seconds: 2),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) => child,
          ),
        ),
        GoRoute(
          path: '/setting',
          pageBuilder: (context, state) => CustomTransitionPage(
            child: const SettingScreen(),
            transitionDuration: const Duration(seconds: 2),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) => child,
          ),
        ),
      ],
    ),
  ],
);
