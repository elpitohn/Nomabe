import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:nomabe/list/presentation/cubit/listcubit.dart';
import 'package:nomabe/talkwithai/presentation/widget/chatwidget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ListCubit cubit = GetIt.I.get<ListCubit>();

  final _separatorSymbol = '/////';

  @override
  void initState() {
    cubit.getProductItems();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nutri Nomabe',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: const Color.fromARGB(255, 171, 222, 244),
        ),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Nutri Nomabe'),
        ),
        body: ChatWidget(
          separatorSymbol: _separatorSymbol,
        ),
      ),
    );
  }
}
