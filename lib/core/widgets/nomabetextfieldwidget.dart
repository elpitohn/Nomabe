import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nomabe/core/themes/nomabetokens.dart';
import 'package:nomabe/core/widgets/nomabepadding.dart';
import 'package:libphonenumber/libphonenumber.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../data/constants/strings.dart';

class NomabeTextFieldWidget extends StatefulWidget {
  const NomabeTextFieldWidget({
    this.textState = 0,
    this.textHint = "",
    this.searchFunction,
    Key? key,
  }) : super(key: key);

  final int textState;
  final String textHint;
  final Function? searchFunction;

  @override
  State<NomabeTextFieldWidget> createState() =>
      _GenericNomabeTextFieldWidgetState();
}

class _GenericNomabeTextFieldWidgetState extends State<NomabeTextFieldWidget> {
  Widget getWidget() {
    switch (widget.textState) {
      case 1: //Number
        return NumberView(
          textHint: widget.textHint,
        );
      case 2: //password
        return CPFView(
          textHint: widget.textHint,
        );
      case 3: //search
        return SearchView(
          searchFunction: widget.searchFunction,
        );
      default: //normal text field
        return NomabeTextFieldView(
          textHint: widget.textHint,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return NomabeLowPadding(
      child: getWidget(),
    );
  }
}

class NumberView extends StatefulWidget {
  const NumberView({
    this.textHint = "",
    Key? key,
  }) : super(key: key);

  final String textHint;

  @override
  _NumberViewState createState() => _NumberViewState();
}

class _NumberViewState extends State<NumberView> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      style: const TextStyle(color: NomabeTokens.nomabeBlack),
      validator: (number) => validatePhoneNumber(number),
      maxLines: 1,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        MaskTextInputFormatter(
          mask: '+## (##) ######-####',
          filter: {"#": RegExp(r'[0-9]')},
        ),
      ],
      keyboardType: TextInputType.phone,
      textCapitalization: TextCapitalization.none,
      decoration: InputDecoration(
        fillColor: NomabeTokens.nomabeWhite,
        hintStyle: const TextStyle(color: NomabeTokens.nomabeGrey),
        filled: true,
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.all(10),
        hintText:
            widget.textHint.isNotEmpty ? widget.textHint : '+111234567890',
      ),
    );
  }

  String? validatePhoneNumber(String? phoneNumber) {
    var phone = phoneNumber ?? '';

    Future<bool?> validate() async {
      final isValid = await PhoneNumberUtil.isValidPhoneNumber(
          phoneNumber: phone, isoCode: 'BR');
      if (isValid == null || !isValid) {
        return false;
      }

      return true;
    }

    if (phoneNumber == null || phoneNumber.isEmpty || validate() == false) {
      return CoreStrings.numberValidator;
    } else {
      return null;
    }
  }
}

class CPFView extends StatefulWidget {
  const CPFView({
    this.textHint = "",
    Key? key,
  }) : super(key: key);

  final String textHint;

  @override
  _CPFViewState createState() => _CPFViewState();
}

class _CPFViewState extends State<CPFView> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      maxLines: 1,
      style: const TextStyle(color: NomabeTokens.nomabeBlack),
      keyboardType: TextInputType.number,
      textCapitalization: TextCapitalization.none,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        MaskTextInputFormatter(
          mask: '###.###.###-##',
          filter: {"#": RegExp(r'[0-9]')},
        ),
      ],
      decoration: InputDecoration(
        fillColor: NomabeTokens.nomabeWhite,
        filled: true,
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.all(10),
        hintStyle: const TextStyle(color: NomabeTokens.nomabeGrey),
        hintText: widget.textHint.isNotEmpty
            ? widget.textHint
            : CoreStrings.passwordHintText,
      ),
    );
  }
}

class SearchView extends StatefulWidget {
  const SearchView({
    this.searchFunction,
    Key? key,
  }) : super(key: key);

  final Function? searchFunction;

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _hasFocus = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _hasFocus = _focusNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      focusNode: _focusNode,
      maxLines: 1,
      style: const TextStyle(color: NomabeTokens.nomabeBlack),
      textCapitalization: TextCapitalization.none,
      decoration: InputDecoration(
        fillColor: NomabeTokens.nomabeWhite,
        filled: true,
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.all(10),
        hintText: CoreStrings.searchHintText,
        prefixIcon: const Icon(Icons.search),
        hintStyle: const TextStyle(color: NomabeTokens.nomabeGrey),
        suffixIcon: AnimatedCrossFade(
          firstChild: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () => _controller.clear(),
          ),
          secondChild: const SizedBox(width: 0, height: 0),
          crossFadeState:
              _hasFocus ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: const Duration(milliseconds: 200),
        ),
      ),
      onFieldSubmitted: (value) {
        widget.searchFunction!();
      },
    );
  }
}

class NomabeTextFieldView extends StatefulWidget {
  const NomabeTextFieldView({
    this.textHint = "",
    Key? key,
  }) : super(key: key);

  final String textHint;

  @override
  _NomabeTextFieldViewState createState() => _NomabeTextFieldViewState();
}

class _NomabeTextFieldViewState extends State<NomabeTextFieldView> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      maxLines: 1,
      style: const TextStyle(color: NomabeTokens.nomabeLightGray),
      textCapitalization: TextCapitalization.none,
      decoration: InputDecoration(
        fillColor: NomabeTokens.nomabeWhite,
        hintStyle: const TextStyle(color: NomabeTokens.nomabeGrey),
        filled: true,
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.all(10),
        hintText:
            widget.textHint.isNotEmpty ? widget.textHint : 'Enter text...',
      ),
    );
  }
}
