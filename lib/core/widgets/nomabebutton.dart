import 'package:flutter/material.dart';
import 'package:nomabe/core/themes/nomabetokens.dart';
import 'package:nomabe/core/widgets/nomabepadding.dart';

class NomabeExpandedPrimaryButton extends StatelessWidget {
  NomabeExpandedPrimaryButton(
      {required this.title, required this.onPressed, super.key});

  final String title;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: NomabeTokens.nomabeDarkBlue,
            foregroundColor: NomabeTokens.nomabeWhite,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
          ),
          onPressed: () {
            onPressed?.call();
          },
          child: Text(title),
        ))
      ],
    );
  }
}

class NomabeExpandedSecondaryButton extends StatelessWidget {
  const NomabeExpandedSecondaryButton(
      {required this.title, required this.onPressed, super.key});

  final String title;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: NomabeTokens.nomabeOrangeShade,
            foregroundColor: NomabeTokens.nomabeWhite,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
          ),
          onPressed: () {
            onPressed?.call();
          },
          child: Text(title),
        ))
      ],
    );
  }
}

class NomabePrimaryButton extends StatelessWidget {
  const NomabePrimaryButton(this.onPressed, {required this.title, super.key});

  final String title;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF6200EE),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
      onPressed: () {
        onPressed?.call();
      },
      child: Text(title),
    );
  }
}

class NomabeSecondaryButton extends StatelessWidget {
  const NomabeSecondaryButton(
      {required this.title, required this.onPressed, super.key});

  final String title;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF03DAC6),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
      onPressed: () {
        onPressed?.call();
      },
      child: Text(title),
    );
  }
}
