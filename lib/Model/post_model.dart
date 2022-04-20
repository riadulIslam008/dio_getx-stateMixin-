import 'dart:convert';

class PostModel {
  final int userId;
  final int id;
  final String title;
  final String body;
  PostModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      userId: map['userId']?.toInt() ?? 0,
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      body: map['body'] ?? '',
    );
  }

  factory PostModel.fromJson(String source) => PostModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PostModel(userId: $userId, id: $id, title: $title, body: $body)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is PostModel &&
      other.userId == userId &&
      other.id == id &&
      other.title == title &&
      other.body == body;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
      id.hashCode ^
      title.hashCode ^
      body.hashCode;
  }
}
