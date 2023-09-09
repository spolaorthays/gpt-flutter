import 'package:equatable/equatable.dart';

class ChatBotResponse extends Equatable {
  final String object;
  final List<ChatBotModel> data;

  const ChatBotResponse(this.object, this.data);

  factory ChatBotResponse.fromJson(Map<String, dynamic> json) =>
      ChatBotResponse(
        json['object'] as String,
        (json['data'] as List<dynamic>)
            .map((data) => ChatBotModel.fromJson(data))
            .toList(),
      );

  @override
  List<Object?> get props => [object, data];
}

class ChatBotModel extends Equatable {
  final String id;
  final String object;
  final int created;
  final String ownedBy;

  const ChatBotModel(this.id, this.object, this.created, this.ownedBy);

  factory ChatBotModel.fromJson(Map<String, dynamic> json) => ChatBotModel(
        json['id'] as String,
        json['object'] as String,
        json['created'] as int,
        json['ownedBy'],
      );

  @override
  List<Object?> get props => [];
}
