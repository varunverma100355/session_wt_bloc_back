import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'contact.g.dart';

@JsonSerializable()
@HiveType(typeId: 101)
class Contact {

  @JsonKey(name: '_id')
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? firstName;
  @HiveField(2)
  String? lastName;
  @HiveField(3)
  String? email;
  @HiveField(4)
  String? image;
  @HiveField(5)
  String? createdAt;
  @HiveField(6)
  String? updatedAt;
  @HiveField(7)
  int? createdBy;
  @HiveField(8)
  int? updatedBy;

  Contact();

  static Contact fromJson(Map<String, dynamic> json) => _$ContactFromJson(json);

  Map<String, dynamic> toJson() => _$ContactToJson(this);
}
