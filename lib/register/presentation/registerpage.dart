import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:nomabe/core/widgets/nomabeimage.dart';
import 'package:nomabe/register/constants/strings.dart';

import '../../core/data/constants/strings.dart';
import '../../core/router/router.dart';
import '../../core/widgets/nomabebutton.dart';
import '../../core/widgets/nomabepadding.dart';
import '../../core/widgets/nomabetextfieldwidget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() {
    return _RegisterPageState();
  }
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                scale: 1,
                width: 100,
                height: 100,
              ),
            ),
            const NomabeTextFieldWidget(
              textHint: "Nome",
            ),
            const NomabeTextFieldWidget(
              textHint: "Sobrenome",
            ),
            const NomabeTextFieldWidget(
              textState: 1,
            ),
            const NomabeTextFieldWidget(
              textState: 2,
              textHint: "Insira seu CPF",
            ),
            NomabeLowPadding(
                child: Column(
              children: [
                NomabeExpandedPrimaryButton(
                    onPressed: () {
                      NomabeRouter.router.pop();
                    },
                    title: RegisterStrings.backButton),
                NomabeExpandedSecondaryButton(
                    onPressed: () {
                      NomabeRouter.router.pushNamed(RouteNameConstants.home);
                    },
                    title: RegisterStrings.continueButton)
              ],
            ))
          ],
        ),
      )),
    );
  }
}

// class RegisterPageNetwork extends StatefulWidget {
//   final RegisterPage mainView;

//   const RegisterPageNetwork({super.key, required this.mainView});

//   @override
//   State<RegisterPageNetwork> createState() => _RegisterPageNetworkState();
// }

// class _RegisterPageNetworkState extends State<RegisterPageNetwork> {
//   @override
//   Widget build(BuildContext context) {
//     return GraphQLProvider(
//       // client: ,
//       child: widget.mainView,
//     );
//   }
// }
