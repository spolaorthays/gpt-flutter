import 'package:equatable/equatable.dart';

//Class for choice chat model
class ChatResponseModel extends Equatable {
  final String object;
  final List<ChatModel> data;

  const ChatResponseModel(this.object, this.data);

  @override
  List<Object?> get props => [object, data];
}

class ChatModel extends Equatable {
  final String id;
  final String object;
  final int created;
  final String ownedBy;

  const ChatModel(this.id, this.object, this.created, this.ownedBy);

  @override
  List<Object?> get props => [];
}

//Class for conversation chat
class ChatRequest extends Equatable {
  final String model;
  final List<ChatMessage> messages;

  const ChatRequest(this.model, this.messages);

  @override
  List<Object?> get props => [model, messages];
}

class ChatMessage extends Equatable {
  final String? role;
  final String? content;

  factory ChatMessage.fromJson(Map<String, dynamic> json) => ChatMessage(
        json['role'] as String?,
        json['content'] as String?,
      );

  const ChatMessage(this.role, this.content);

  @override
  List<Object?> get props => [role, content];
}

class ChatResponse extends Equatable {
  final String? id;
  final String? object;
  final int? created;
  final String? model;
  final List<ChatChoices>? choices;
  final ChatUsage? usage;

  factory ChatResponse.fromJson(Map<String, dynamic> json) => ChatResponse(
        json['id'] as String?,
        json['object'] as String?,
        json['created'] as int?,
        json['model'] as String?,
        (json['choices'] as List<dynamic>?)
            ?.map((chatChoices) => ChatChoices.fromJson(chatChoices))
            .toList(),
        ChatUsage.fromJson(json['usage']),
      );

  const ChatResponse(
    this.id,
    this.object,
    this.created,
    this.model,
    this.choices,
    this.usage,
  );

  @override
  List<Object?> get props => [id, object, created, model, choices, usage];
}

class ChatChoices extends Equatable {
  final int? index;
  final ChatMessage? message;
  final String? finishReason;

  factory ChatChoices.fromJson(Map<String, dynamic> json) => ChatChoices(
        json['index'] as int?,
        ChatMessage.fromJson(json['message']),
        json['finish_reason']
            as String?, //TODO ver esse ponto de estar com underline
      );

  const ChatChoices(this.index, this.message, this.finishReason);

  @override
  List<Object?> get props => [index, message, finishReason];
}

class ChatUsage extends Equatable {
  final int? promptTokens;
  final int? completionTokens;
  final int? totalTokens;

  factory ChatUsage.fromJson(Map<String, dynamic> json) => ChatUsage(
        json['prompt_tokens'] as int?,
        json['completion_tokens'] as int?,
        json['total_tokens'] as int?,
      );

  const ChatUsage(this.promptTokens, this.completionTokens, this.totalTokens);

  @override
  List<Object?> get props => [promptTokens, completionTokens, totalTokens];
}
