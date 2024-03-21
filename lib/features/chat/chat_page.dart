import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/design/app_colors.dart';
import 'package:test1/features/chat/bloc/chatbloc_bloc.dart';
import 'package:test1/features/chat/features.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController _controller = TextEditingController();
  List<Map<String, String>> _messages = [];
  void _handleSubmitted(String text) {
    _controller.clear();
    setState(() {
      _messages.add({"text": text, "prod": "User"});
      _messages.add({
        "text":
            "Welcome to Nerve Sparks, the human friendly no code AI development platform for organizations of all sizes. Our platform empowers developers and professionals alike to create and deploy powerful AI solutions without any coding required.\n\nOur mission is to democratize AI development by making it accessible to anyone, regardless of technical skill level. We believe that by lowering the barriers to entry for AI development, we can help businesses and organizations of all sizes to unlock the full potential of this transformative technology.",
        "prod": "Gpt"
      });
    });
  }

  ChatblocBloc chatblocBloc = ChatblocBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ChatblocBloc, ChatblocState>(
        bloc: chatblocBloc,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: _messages.isEmpty
                      ? [
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            "Nervesparks",
                            style: TextStyle(
                              fontSize: 40,
                              color: AppColors.Nerve,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ]
                      : []
                    ..addAll([
                      Expanded(
                        child: ListView.builder(
                          itemCount: _messages.length > 0
                              ? _messages.length
                              : 5, // If there are no messages, show 5 features
                          itemBuilder: (context, index) {
                            if (_messages.isEmpty) {
                              return Features(
                                Description: [
                                  "Remembers what user said earlier in the conversation",
                                  "Allows user to provide follow-up corrections With Ai",
                                  "Limited knowledge of world and events after 2021",
                                  "May occasionally generate incorrect information",
                                  "May occasionally produce harmful instructions or biased content"
                                ][index],
                              );
                            } else {
                              final message = _messages[index];
                              return MessageTile(
                                text: message["text"]!,
                                prod: message["prod"]!,
                              );
                            }
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.Outline),
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(6)),
                        margin: const EdgeInsets.only(
                            bottom: 5, left: 10, top: 6, right: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _controller,
                                onSubmitted: _handleSubmitted,
                                cursorColor: Colors.white,
                                decoration: InputDecoration(
                                  hintText: "Send a message.",
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: false,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            IconButton(
                              onPressed: () =>
                                  _handleSubmitted(_controller.text),
                              icon: Icon(Icons.send),
                            )
                          ],
                        ),
                      )
                    ]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class MessageTile extends StatelessWidget {
  final String text;
  final String prod;

  const MessageTile({required this.text, required this.prod});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: prod == "Gpt" ? AppColors.messageBgColor : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            prod == "Gpt" ? 'assets/logo.png' : 'assets/Imgw.png',
            height: 32,
            width: 32,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(text),
          ),
        ],
      ),
    );
  }
}
