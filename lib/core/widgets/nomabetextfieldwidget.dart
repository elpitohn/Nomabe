import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:nomabe/core/themes/nomabetokens.dart';
import 'package:nomabe/core/widgets/nomabepadding.dart';

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
      case 1: //email
        return EmailView(
          textHint: widget.textHint,
        );
      case 2: //password
        return PasswordView(
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

class EmailView extends StatefulWidget {
  const EmailView({
    this.textHint = "",
    Key? key,
  }) : super(key: key);

  final String textHint;

  @override
  _EmailViewState createState() => _EmailViewState();
}

class _EmailViewState extends State<EmailView> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      style: const TextStyle(color: NomabeTokens.nomabeBlack),
      validator: (email) =>
          EmailValidator.validate(email!) ? null : CoreStrings.emailValidator,
      maxLines: 1,
      textCapitalization: TextCapitalization.none,
      decoration: InputDecoration(
        fillColor: NomabeTokens.nomabeWhite,
        hintStyle: const TextStyle(color: NomabeTokens.nomabeGrey),
        filled: true,
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.all(10),
        hintText:
            widget.textHint.isNotEmpty ? widget.textHint : 'email@email.com',
      ),
    );
  }
}

class PasswordView extends StatefulWidget {
  const PasswordView({
    this.textHint = "",
    Key? key,
  }) : super(key: key);

  final String textHint;

  @override
  _PasswordViewState createState() => _PasswordViewState();
}

class _PasswordViewState extends State<PasswordView> {
  final TextEditingController _controller = TextEditingController();

  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      obscureText: _isObscured,
      maxLines: 1,
      style: const TextStyle(color: NomabeTokens.nomabeBlack),
      textCapitalization: TextCapitalization.none,
      decoration: InputDecoration(
        fillColor: NomabeTokens.nomabeWhite,
        filled: true,
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.all(10),
        hintStyle: const TextStyle(color: NomabeTokens.nomabeGrey),
        hintText: widget.textHint.isNotEmpty
            ? widget.textHint
            : CoreStrings.passwordHintText,
        suffixIcon: IconButton(
          icon: Icon(_isObscured ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              _isObscured = !_isObscured;
            });
          },
        ),
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
