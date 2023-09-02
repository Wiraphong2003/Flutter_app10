import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User();

  late num id;
  late String name;
  late String username;
  late String email;
  late Map<String,dynamic> address;
  late String phone;
  late String website;
  late Map<String,dynamic> company;
  late String img;
  
  factory User.fromJson(Map<String,dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
