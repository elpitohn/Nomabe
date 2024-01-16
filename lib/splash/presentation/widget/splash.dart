import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nomabe/core/data/constants/strings.dart';
import 'package:nomabe/core/router/router.dart';

class SplashScreen extends StatefulWidget {
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
        opacityLevel = 1.0; // Aumenta a opacidade para 1 gradualmente
      });
    });
    // Após o fade-in, inicie o timer para o fade-out após 2 segundos
    Timer(Duration(seconds: 1), () {
      _startFadeOut();
    });
  }

  void _startFadeOut() {
    setState(() {
      opacityLevel = 0.0; // Reduz a opacidade para 0 gradualmente
    });
    // Após a transição de fade-out, navegar para a tela principal após um curto atraso
    Future.delayed(Duration(milliseconds: 500), () {
      // Substitua '/home' pela rota da sua tela principal
      NomabeRouter.router.pushReplacementNamed(RouteNameConstants.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedOpacity(
        duration: Duration(milliseconds: 500),
        opacity: opacityLevel,
        child: Center(
          // Personalize o conteúdo do seu SplashScreen aqui
          child: FlutterLogo(size: 200),
        ),
      ),
    );
  }
}
