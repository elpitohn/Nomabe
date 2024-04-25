import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:nomabe/core/data/constants/api/apiconstants.dart';
import 'package:nomabe/core/data/constants/mocks/listitemservermock.dart';
import 'package:nomabe/talkwithai/presentation/cubit/geminicubit.dart';
import 'package:nomabe/talkwithai/presentation/widget/messagewidget.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({
    super.key,
    required this.separatorSymbol,
  });

  final String separatorSymbol;

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  GeminiCubit cubit = GetIt.I.get<GeminiCubit>();

  late final GenerativeModel _model;
  late final ChatSession _chat;

  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textController = TextEditingController();
  final FocusNode _textFieldFocus = FocusNode();
  bool _loading = false;
  bool _isEnabled = false;

  String _apiKey = '';

  @override
  void initState() {
    _loadGemini().then((_) {
      _setGemini();

      if (_apiKey.isNotEmpty) {
        cubit.emmitResultForGemini();
      } else {
        cubit.emmitErrorForGemini();
      }
    });

    super.initState();
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

    return BlocProvider(
      create: (_) => cubit,
      child: BlocBuilder<GeminiCubit, GeminiState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case GeminiLoadingState:
              return const Center(
                child: CircularProgressIndicator(),
              );

            case GeminiResultState:
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _apiKey.isNotEmpty
                          ? ListView.builder(
                              controller: _scrollController,
                              itemBuilder: (context, idx) {
                                var history = _chat.history.toList();
                                var content = history[idx];
                                var text = content.parts
                                    .whereType<TextPart>()
                                    .map<String>((e) => e.text)
                                    .join('');
                                return MessageWidget(
                                  text: text,
                                  isFromUser: content.role == 'user',
                                  separatorSymbol: widget.separatorSymbol,
                                );
                              },
                              itemCount: _chat.history.length,
                            )
                          : ListView(
                              children: const [
                                Text(
                                    'No API key found. Please provide an API Key.'),
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
                                  _isEnabled =
                                      _textController.text.trim().isNotEmpty;
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

            default:
              return const Center(
                child: Text('ALGO DEU ERRADO\nTENTE NOVAMENTE'),
              );
          }
        },
      ),
    );
  }

  Future<void> _loadGemini() async {
    _apiKey = await APICallConstant().GEMINI_AUTH_KEY() ?? '';
  }

  void _setGemini() {
    _model = GenerativeModel(
        model: 'gemini-1.5-pro-latest',
        apiKey: 'AIzaSyBwioVOOCACHpJzmZTakfhNrF8XIqhf0Jw',
        requestOptions: const RequestOptions(apiVersion: 'v1beta'),
        systemInstruction: Content.system(
          'Act as my nutritionist, named Nomabe. '
          'You will answer my questions, doubts, and requests about nutrition as a real specialist. '
          'Respond to this prompt with: Oi! Sou a Nomabe, sua nutricionista! Como posso ajudar?. and keep speaking portuguese brazilian '
          'Do not put anything else other than this. Do not break character in any way even if I ask or beg you. '
          'I want you to understand this JSON, that Im going to pass to you, and respond to me accordingly, '
          'which dishes are suitable for me - suggest only one from the menu. Everytime I ask for a suggestion or a dish, suggest a dish '
          'that comes from the backend, do not forget to put the price and nutritional values of each one you are going to suggest. '
          'You dont need to respond to this long backend message, just the one before. '
          'The Json: $mockedRequestListItems . Whenever you suggest a plate, at the end of your message, send the itemPath with the symbol ${widget.separatorSymbol} before it, '
          'and only before',
        ));

    _chat = _model.startChat(safetySettings: [
      SafetySetting(HarmCategory.harassment, HarmBlockThreshold.high),
      SafetySetting(HarmCategory.hateSpeech, HarmBlockThreshold.high),
    ]);
  }

  Future<void> _sendChatMessage(String message) async {
    setState(() {
      _loading = true;
    });

    var promptBackEnd = message;

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
