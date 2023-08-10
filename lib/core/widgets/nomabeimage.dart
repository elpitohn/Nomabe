import 'package:flutter/material.dart';

class NomabeImageIcon extends StatelessWidget {
  const NomabeImageIcon({required this.name, super.key});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/icons/$name.png');
  }
}

class NomabeImageIconResizable extends StatelessWidget {
  const NomabeImageIconResizable(
      {required this.name,
      required this.scale,
      required this.width,
      required this.height,
      super.key});

  final String name;
  final double scale;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/icons/$name.png',
      scale: scale,
      width: width,
      height: height,
    );
  }
}

class NomabeImageIllustration extends StatelessWidget {
  const NomabeImageIllustration({required this.name, super.key});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/illustrations/$name.png');
  }
}

class NomabeImageIllustrationResizable extends StatelessWidget {
  const NomabeImageIllustrationResizable(
      {required this.name,
      required this.scale,
      required this.width,
      required this.height,
      super.key});

  final String name;
  final double scale;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/illustrations/$name.png',
      scale: scale,
      width: width,
      height: height,
    );
  }
}
