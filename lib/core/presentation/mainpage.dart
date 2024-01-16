// import 'package:flutter/material.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';

// class MainPage extends StatefulWidget {
//   final String title;
//   final String userId;

//   const MainPage({
//     required this.title,
//     required this.userId,
//     super.key,
//   });

//   @override
//   State<MainPage> createState() {
//     return _MainPageState();
//   }
// }

// class _MainPageState extends State<MainPage> {
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: Text("teste"),
//       ),
//     );
//   }
// }

// class MainPageNetwork extends StatefulWidget {
//   final MainPage mainView;

//   const MainPageNetwork({super.key, required this.mainView});

//   @override
//   State<MainPageNetwork> createState() => _MainPageNetworkState();
// }

// class _MainPageNetworkState extends State<MainPageNetwork> {
//   @override
//   Widget build(BuildContext context) {
//     return GraphQLProvider(
//       // client: ,
//       child: widget.mainView,
//     );
//   }
// }
