import 'package:chat_app_ui/chat/data/chat_model.dart';
import 'package:flutter/material.dart';

class ChatListItemWidget extends StatelessWidget {
  const ChatListItemWidget({
    super.key,
    required this.model,
  });
  final ChatModel model;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: () {},
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(model.image ?? ''),
      ),
      title: Text(
        model.name ?? '',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        model.lastMessage ?? '',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
            color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w500),
      ),
      trailing: Text(model.time ?? ''),
    );
  }
}
