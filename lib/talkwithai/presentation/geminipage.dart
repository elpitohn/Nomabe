import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nomabe/core/data/constants/api/apiconstants.dart';
import 'package:nomabe/core/data/constants/mocks/listitemservermock.dart';
import 'package:nomabe/list/presentation/cubit/listcubit.dart';
import 'package:nomabe/list/presentation/widget/productwidget.dart';
import 'package:nomabe/list/presentation/widget/talkwithai.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiPage extends StatefulWidget {
  const GeminiPage({super.key});

  @override
  _GeminiPageState createState() => _GeminiPageState();
}

class _GeminiPageState extends State<GeminiPage> {
  ListCubit cubit = GetIt.I.get<ListCubit>();

  @override
  void initState() {
    cubit.getProductItems();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const GenerativeAISample();
  }
}

class GenerativeAISample extends StatelessWidget {
  const GenerativeAISample({super.key});

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
      home: const ChatScreen(title: 'Nutri Nomabe'),
    );
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.title});

  final String title;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const ChatWidget(),
    );
  }
}

class ChatWidget extends StatefulWidget {
  const ChatWidget({super.key});

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  late final GenerativeModel _model;
  late final ChatSession _chat;
  late final String _initialPrompt;

  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textController = TextEditingController();
  final FocusNode _textFieldFocus = FocusNode();
  bool _loading = false;
  bool _isEnabled = false;
  static const _apiKey = APICallConstant.GEMINI_AUTH_KEY;

  @override
  void initState() {
    super.initState();
    _model = GenerativeModel(
      model: 'gemini-pro',
      apiKey: _apiKey,
    );
    _chat = _model.startChat();
    _loadInitialPrompt();
  }

  void _scrollDown() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(
          milliseconds: 750,
        ),
        curve: Curves.easeOutCirc,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var textFieldDecoration = InputDecoration(
      contentPadding: const EdgeInsets.all(15),
      hintText: 'Enter a prompt...',
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(14),
        ),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(14),
        ),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // if (_initialPrompt != null)
          //   _MessageWidget(text: _initialPrompt, isFromUser: false),
          Expanded(
            child: _apiKey.isNotEmpty
                ? ListView.builder(
                    controller: _scrollController,
                    itemBuilder: (context, idx) {
                      var history = _chat.history.toList();
                      history.removeAt(0);

                      if (idx < history.length) {
                        var content = history[idx];
                        var text = content.parts
                            .whereType<TextPart>()
                            .map<String>((e) => e.text)
                            .join('');
                        return _MessageWidget(
                          text: text,
                          isFromUser: content.role == 'user',
                        );
                      }
                    },
                    itemCount: _chat.history.length,
                  )
                : ListView(
                    children: const [
                      Text('No API key found. Please provide an API Key.'),
                    ],
                  ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 25,
              horizontal: 15,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    autofocus: true,
                    focusNode: _textFieldFocus,
                    decoration: textFieldDecoration,
                    controller: _textController,
                    onSubmitted: (String value) {
                      _sendChatMessage(value);
                    },
                    onChanged: (_) => {
                      setState(() {
                        _isEnabled = _textController.text.trim().isNotEmpty;
                      })
                    },
                  ),
                ),
                const SizedBox.square(
                  dimension: 15,
                ),
                if (!_loading)
                  IconButton(
                    onPressed: _isEnabled
                        ? () async {
                            _sendChatMessage(_textController.text);
                          }
                        : null,
                    icon: Icon(
                      Icons.send,
                      color: _isEnabled
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.outline,
                    ),
                  )
                else
                  const CircularProgressIndicator(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _loadInitialPrompt() async {
    try {
      var response = await _chat.sendMessage(
        Content.text(
            'Aja como minha nutricionista, de nome Nomabe. Voce respondera minhas perguntas, duvidas e solicitacoes sobre nutricao como um especialista de verdade. Responda a esse prompt escrito: Oi! Sou a Nomabe, sua nutricionista! Como posso ajudar?. Não coloque nada mais do que isso. Não saia do personagem de forma alguma mesmo que eu te peça ou implore.'),
      );

      var text = response.text;

      setState(() {
        _initialPrompt = text ?? 'Oi, como posso ajudar?';
      });
    } catch (e) {
      _showError(e.toString());
      setState(() {
        _loading = false;
      });
    } finally {
      _textController.clear();
      _textFieldFocus.requestFocus();
    }
  }

  Future<void> _sendChatMessage(String message) async {
    setState(() {
      _loading = true;
    });

    var promptBackEnd = message +
        'Mensagem do Backend: eu quero que voce entenda esse json e me responda de acordo com ela, quais pratos servem pra mim. Mas, somente se EU PERGUNTAR. Se eu nao tiver perguntado ou pedido, não responda com nenhuma informacao. Caso contrario, sugira um prato que vem do backend, colocando o preco e os valores nutricionais de cada uma. Não precisa responder essa mensagem longa do backend, apenas a que esta antes.' +
        mockedRequestListItems;

    try {
      var response = await _chat.sendMessage(
        Content.text(promptBackEnd),
      );
      var text = response.text;

      if (text == null) {
        _showError('No response from API.');
        return;
      } else {
        setState(() {
          _loading = false;
          _scrollDown();
        });
      }
    } catch (e) {
      _showError(e.toString());
      setState(() {
        _loading = false;
      });
    } finally {
      _textController.clear();
      setState(() {
        _loading = false;
      });
      _textFieldFocus.requestFocus();
    }
  }

  void _showError(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Opa, algo deu errado!'),
          content: const SingleChildScrollView(
            child: SelectableText(
              'Algo deu errado com sua mensagem. Tente novamente, ou diga de outra forma.',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            )
          ],
        );
      },
    );
  }
}

class _MessageWidget extends StatelessWidget {
  const _MessageWidget({
    required this.text,
    required this.isFromUser,
  });

  final String text;
  final bool isFromUser;

  @override
  Widget build(BuildContext context) {
    var promptBackEnd =
        'Mensagem do Backend: eu quero que voce entenda esse json e me responda de acordo com ela, quais pratos servem pra mim. Mas, somente se EU PERGUNTAR. Se eu nao tiver perguntado ou pedido, não responda com nenhuma informacao. Caso contrario, sugira um prato que vem do backend, colocando o preco e os valores nutricionais de cada uma. Não precisa responder essa mensagem longa do backend, apenas a que esta antes.' +
            mockedRequestListItems;
    var texts = (text + promptBackEnd).split(promptBackEnd);
    return Row(
      mainAxisAlignment:
          isFromUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 600),
            decoration: BoxDecoration(
              color: isFromUser
                  ? Theme.of(context).colorScheme.primaryContainer
                  : Theme.of(context).colorScheme.surfaceVariant,
              borderRadius: BorderRadius.circular(18),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 20,
            ),
            margin: const EdgeInsets.only(bottom: 8),
            child: MarkdownBody(
              selectable: true,
              data: texts[0],
            ),
          ),
        ),
      ],
    );
  }
}
