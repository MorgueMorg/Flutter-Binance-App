import 'package:binance_clone/features/screens/markets/markets_screen.dart';
import 'package:binance_clone/features/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'markets',
          builder: (BuildContext context, GoRouterState state) {
            return const MarketsScreen();
          },
        ),
      ],
    ),
  ],
);
