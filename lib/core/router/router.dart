import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nomabe/core/data/constants/strings.dart';
import 'package:nomabe/core/themes/nomabetheme.dart';

import '../../login/presentation/loginpage.dart';
import '../../register/presentation/registerpage.dart';
import '../presentation/mainpage.dart';

class NomabeRouter {
  static final GoRouter router = GoRouter(routes: [
    GoRoute(
      name: RouteNameConstants.login,
      path:
          "/", // Modify so the first confirms the login (maybe splash screen?)
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: MaterialApp(theme: NomabeTheme.theme, home: LoginPage()),
      ),
    ),
    GoRoute(
      name: RouteNameConstants.register,
      path: "/createAccount",
      pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: MaterialApp(theme: NomabeTheme.theme, home: RegisterPage())),
    ),
    GoRoute(
      name: RouteNameConstants.home,
      path: "/home",
      pageBuilder: (context, state) {
        final args = state.extra as Map<String, dynamic>?;

        final String title = args?["pageTitle"] ?? "";
        final String userId = args?["userId"] ?? "";

        return MaterialPage(
            key: state.pageKey,
            child: MaterialApp(
              theme: NomabeTheme.theme,
              home: MainPage(title: title, userId: userId),
            ));
      },
    ),
  ]);
}
