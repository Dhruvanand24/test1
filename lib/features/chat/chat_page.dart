import 'package:flutter/material.dart';
import 'package:test1/design/app_colors.dart';
import 'package:test1/features/chat/features.dart';

class Chat_page extends StatefulWidget {
  const Chat_page({Key? key}) : super(key: key);

  @override
  State<Chat_page> createState() => _Chat_pageState();
}

class _Chat_pageState extends State<Chat_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                Expanded(
                  child: ListView(
                    children: [
                      Features(
                        Description:
                            "Remembers what user said earlier in the conversation",
                      ),
                      Features(
                        Description:
                            "Allows user to provide follow-up corrections With Ai",
                      ),
                      Features(
                        Description:
                            "Limited knowledge of world and events after 2021",
                      ),
                      Features(
                        Description:
                            "May occasionally generate incorrect information",
                      ),
                      Features(
                        Description:
                            "May occasionally produce harmful instructions or biased content",
                      ),
                    ],
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
                  child: const Row(
                    children: [
                      Expanded(
                          child: TextField(
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                            hintText: "Send a message.",
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            filled: false),
                      )),
                      SizedBox(
                        width: 12,
                      ),
                      InkWell(child: Icon(Icons.send_rounded))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
