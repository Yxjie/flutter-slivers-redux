import 'package:json_annotation/json_annotation.dart';

part 'json_data.g.dart';

//flutter packages pub run build_runner build 生成对应.g.dart类
@JsonSerializable()
class JsonData {
  final String by;
  final int descendants;
  final int id;
  final List<int> kids;
  final int score;
  final int time;
  final String title;
  final String type;
  @JsonKey(nullable: false)
  final String url;

  JsonData(
      {this.by,
      this.descendants,
      this.id,
      this.kids,
      this.score,
      this.time,
      this.title,
      this.type,
      this.url});

  factory JsonData.fromJson(Map<String, dynamic> json) =>
      _$JsonDataFromJson(json);

  Map<String, dynamic> toJson(JsonData data) => _$JsonDataToJson(this);
}
