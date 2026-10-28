// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AlbumClass {
  int? userId;
  int? id;
  String? title;
  AlbumClass({this.userId, this.id, this.title});

  AlbumClass copyWith({int? userId, int? id, String? title}) {
    return AlbumClass(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'userId': userId, 'id': id, 'title': title};
  }

  factory AlbumClass.fromMap(Map<String, dynamic> map) {
    return AlbumClass(
      userId: map['userId'] != null ? map['userId'] as int : null,
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AlbumClass.fromJson(String source) =>
      AlbumClass.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AlbumClass(userId: $userId, id: $id, title: $title)';

  @override
  bool operator ==(covariant AlbumClass other) {
    if (identical(this, other)) return true;

    return other.userId == userId && other.id == id && other.title == title;
  }

  @override
  int get hashCode => userId.hashCode ^ id.hashCode ^ title.hashCode;
}
