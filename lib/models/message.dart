import 'package:warzone_companion_app/models/models.dart';

class Message {
  final String text;
  final User sender;
  final User receiver;
  final DateTime time;

  Message({
    required this.text,
    required this.sender,
    required this.receiver,
    required this.time,
  });
}