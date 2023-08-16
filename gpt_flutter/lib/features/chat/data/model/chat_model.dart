class ChatResponseModel {
  final String object;
  final List<ChatModel> data;

  ChatResponseModel(this.object, this.data);
}

class ChatModel {
  final String id;
  final String object;
  final int created;
  final String ownedBy;

  ChatModel(this.id, this.object, this.created, this.ownedBy);
}
