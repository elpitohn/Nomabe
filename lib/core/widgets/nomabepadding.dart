import 'package:flutter/material.dart';

class NomabeLowPadding extends StatelessWidget {
  const NomabeLowPadding(
      {required this.child,
      this.hasLeftPadding = false,
      this.hasRightPadding = false,
      super.key});

  final Widget child;
  final bool hasLeftPadding;
  final bool hasRightPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 8,
          bottom: 8,
          left: hasLeftPadding ? 8 : 0,
          right: hasRightPadding ? 8 : 0),
      child: child,
    );
  }
}

class NomabeMidPadding extends StatelessWidget {
  const NomabeMidPadding(
      {required this.child,
      this.hasLeftPadding = false,
      this.hasRightPadding = false,
      super.key});

  final Widget child;
  final bool hasLeftPadding;
  final bool hasRightPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 16,
          bottom: 16,
          left: hasLeftPadding ? 16 : 0,
          right: hasRightPadding ? 16 : 0),
      child: child,
    );
  }
}

class NomabeHighadding extends StatelessWidget {
  const NomabeHighadding(
      {required this.child,
      this.hasLeftPadding = false,
      this.hasRightPadding = false,
      super.key});

  final Widget child;
  final bool hasLeftPadding;
  final bool hasRightPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 24,
          bottom: 24,
          left: hasLeftPadding ? 24 : 0,
          right: hasRightPadding ? 24 : 0),
      child: child,
    );
  }
}
