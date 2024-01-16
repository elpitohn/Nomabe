import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:nomabe/core/data/constants/strings.dart';
import 'package:nomabe/core/router/router.dart';
import 'package:nomabe/core/widgets/nomabebutton.dart';
import 'package:nomabe/core/widgets/nomabeimage.dart';
import 'package:nomabe/core/widgets/nomabepadding.dart';
import 'package:nomabe/core/widgets/nomabetextfieldwidget.dart';
import 'package:nomabe/login/constants/strings.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
          child: NomabeMidPadding(
        hasLeftPadding: true,
        hasRightPadding: true,
        child: ListView(
          shrinkWrap: true,
          children: [
            NomabeMidPadding(
                child: const NomabeImageIconResizable(
              name: "nomabe_logo",
              scale: 2.0,
              width: 200,
              height: 200,
            )),
            const NomabeTextFieldWidget(
              textState: 1,
            ),
            NomabeLowPadding(
                child: Column(
              children: [
                NomabeExpandedPrimaryButton(
                    onPressed: () {
                      NomabeRouter.router.pushNamed(RouteNameConstants.home);
                    },
                    title: LoginStrings.loginButton),
                NomabeExpandedSecondaryButton(
                    onPressed: () {
                      NomabeRouter.router
                          .pushNamed(RouteNameConstants.register);
                    },
                    title: LoginStrings.registerButton)
              ],
            ))
          ],
        ),
      )),
    );
  }
}

// class LoginPageNetwork extends StatefulWidget {
//   final LoginPage mainView;

//   const LoginPageNetwork({super.key, required this.mainView});

//   @override
//   State<LoginPageNetwork> createState() => _LoginPageNetworkState();
// }

// class _LoginPageNetworkState extends State<LoginPageNetwork> {
//   @override
//   Widget build(BuildContext context) {
//     return GraphQLProvider(
//       // client: ,
//       child: widget.mainView,
//     );
//   }
// }
