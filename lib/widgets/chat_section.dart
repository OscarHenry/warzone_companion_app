import 'package:flutter/material.dart';
import 'package:warzone_companion_app/core/core.dart';
import 'package:warzone_companion_app/models/models.dart';
import 'package:warzone_companion_app/widgets/square_avatar.dart';

class ChatSection extends StatefulWidget {
  const ChatSection({super.key, required this.post});
  final Post post;

  @override
  State<ChatSection> createState() => _ChatSectionState();
}

class _ChatSectionState extends State<ChatSection> {
  late final List<Message> messages = List.generate(
    10,
    (index) => Message(
      text:
          '''Lorem Ipsum is simply dummy text of the printing and typesetting industry.''',
      sender: users.getRandom(),
      receiver: widget.post.user,
      time: DateTime.now(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 74),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: messages.length,
      itemBuilder: itemBuilder,
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    final message = messages[index];
    return ListTile(
      isThreeLine: true,
      dense: true,
      contentPadding: EdgeInsets.zero,
      leading: SquareAvatar(imageUrl: message.sender.image, size: 24),
      title: Text(
        message.sender.nickName,
        style: Theme.of(context)
            .textTheme
            .labelMedium!
            .apply(color: Colors.accents[index % Colors.accents.length]),
      ),
      subtitle: Text(
        message.text,
        style: Theme.of(context).textTheme.labelMedium!,
      ),
    );
  }
}
