import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chat_logic.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<ChatLogic>();
    final state = Get.find<ChatLogic>().state;

    return Container();
  }
}
