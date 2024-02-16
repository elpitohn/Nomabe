import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nomabe/core/data/dependency/dependencyinjection.dart';
import 'package:nomabe/core/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/themes/nomabetheme.dart';

Future<void> main() async {
  await dotenv.load();
  configureDependencies();
  runZonedGuarded(() {
    runApp(const MainApp());
  }, (error, stackTrace) {
    // Handle the error here, for example by showing an error message to the user
    print('An error occurred: $error');
  });
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: NomabeTheme.theme,
      routerConfig: NomabeRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
