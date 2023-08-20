import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

class UserModel {
  final String name;
  final String proilfePic;
  final String banner;
  final String uid;
  final bool isAuthenticated; //is guest
  final int krama;
  final List<String> awards;

  UserModel({
    required this.name,
    required this.proilfePic,
    required this.banner,
    required this.uid,
    required this.isAuthenticated,
    required this.krama,
    required this.awards,
  });

  UserModel copyWith({
    String? name,
    String? proilfePic,
    String? banner,
    String? uid,
    bool? isAuthenticated,
    int? krama,
    List<String>? awards,
  }) {
    return UserModel(
      name: name ?? this.name,
      proilfePic: proilfePic ?? this.proilfePic,
      banner: banner ?? this.banner,
      uid: uid ?? this.uid,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      krama: krama ?? this.krama,
      awards: awards ?? this.awards,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'proilfePic': proilfePic,
      'banner': banner,
      'uid': uid,
      'isAuthenticated': isAuthenticated,
      'krama': krama,
      'awards': awards,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      proilfePic: map['proilfePic'] ?? '',
      banner: map['banner'] ?? '',
      uid: map['uid'] ?? '',
      isAuthenticated: map['isAuthenticated'] ?? false,
      krama: map['krama']?.toInt() ?? 0,
      awards: List<String>.from(map['awards']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(name: $name, proilfePic: $proilfePic, banner: $banner, uid: $uid, isAuthenticated: $isAuthenticated, krama: $krama, awards: $awards)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is UserModel &&
        other.name == name &&
        other.proilfePic == proilfePic &&
        other.banner == banner &&
        other.uid == uid &&
        other.isAuthenticated == isAuthenticated &&
        other.krama == krama &&
        listEquals(other.awards, awards);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        proilfePic.hashCode ^
        banner.hashCode ^
        uid.hashCode ^
        isAuthenticated.hashCode ^
        krama.hashCode ^
        awards.hashCode;
  }
}
