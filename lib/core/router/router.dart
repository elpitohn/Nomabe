// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nomabe/core/data/constants/strings.dart';
import 'package:nomabe/list/presentation/listpage.dart';
import 'package:nomabe/splash/presentation/widget/splash.dart';

import '../../login/presentation/loginpage.dart';
import '../../register/presentation/registerpage.dart';

class NomabeRouter {
  static final GoRouter router = GoRouter(routes: [
    GoRoute(
      name: RouteNameConstants.splash,
      path: "/",
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: Scaffold(
          body: SplashScreen(),
        ),
      ),
    ),
    GoRoute(
      name: RouteNameConstants.login,
      path: "/login",
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const Scaffold(
          body: LoginPage(),
        ),
      ),
    ),
    GoRoute(
      name: RouteNameConstants.register,
      path: "/createAccount",
      pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const Scaffold(
            body: RegisterPage(),
          )),
    ),
    GoRoute(
      name: RouteNameConstants.home,
      path: "/home",
      pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: Scaffold(
            body: ListPage(),
          )),
    ),
    // GoRoute(
    //   name: RouteNameConstants.home,
    //   path: "/home",
    //   pageBuilder: (context, state) {
    //     final args = state.extra as Map<String, dynamic>?;

    //     final String title = args?["pageTitle"] ?? "";
    //     final String userId = args?["userId"] ?? "";

    //     return MaterialPage(
    //         key: state.pageKey,
    //         child: Scaffold(
    //           body: MainPage(title: title, userId: userId),
    //         ));
    //   },
    // ),
  ]);
}
