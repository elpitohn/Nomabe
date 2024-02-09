import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nomabe/core/data/constants/strings.dart';
import 'package:nomabe/core/router/router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double opacityLevel = 0.0;

  @override
  void initState() {
    super.initState();
    _startFadeIn();
  }

  void _startFadeIn() {
    Future.delayed(Duration.zero, () {
      setState(() {
        opacityLevel = 1.0;
      });
    });
    Timer(const Duration(seconds: 1), () {
      _startFadeOut();
    });
  }

  void _startFadeOut() {
    setState(() {
      opacityLevel = 0.0;
    });
    Future.delayed(const Duration(milliseconds: 500), () {
      NomabeRouter.router.pushReplacementNamed(RouteNameConstants.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: opacityLevel,
        child: const Center(
          child: FlutterLogo(size: 200),
        ),
      ),
    );
  }
}
