// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AlbumClass {
  int? id;
  String? name;
  String? email;
  String? body;
  AlbumClass({this.id, this.name, this.email, this.body});

  AlbumClass copyWith({int? id, String? name, String? email, String? body}) {
    return AlbumClass(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'body': body,
    };
  }

  factory AlbumClass.fromMap(Map<String, dynamic> map) {
    return AlbumClass(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      body: map['body'] != null ? map['body'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AlbumClass.fromJson(String source) =>
      AlbumClass.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AlbumClass(id: $id, name: $name, email: $email, body: $body)';
  }

  @override
  bool operator ==(covariant AlbumClass other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.email == email &&
        other.body == body;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ email.hashCode ^ body.hashCode;
  }
}
