// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class SocialResultEntity extends Equatable {
  final String name;
  final String history;
  final String imgUrl;
  const SocialResultEntity({
    required this.name,
    required this.history,
    required this.imgUrl,
  });

  SocialResultEntity copyWith({
    String? name,
    String? history,
    String? imgUrl,
  }) {
    return SocialResultEntity(
      name: name ?? this.name,
      history: history ?? this.history,
      imgUrl: imgUrl ?? this.imgUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'history': history,
      'imgUrl': imgUrl,
    };
  }

  factory SocialResultEntity.fromMap(Map<String, dynamic> map) {
    return SocialResultEntity(
      name: map['name'] as String,
      history: map['history'] as String,
      imgUrl: map['imgUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SocialResultEntity.fromJson(String source) {
    final Map<String, dynamic> map = json.decode(source);
    return SocialResultEntity.fromMap(map);
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [name, history, imgUrl];
}
