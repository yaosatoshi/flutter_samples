
import 'package:json_annotation/json_annotation.dart';

part 'MyDataSub1.g.dart';

@JsonSerializable()
class MyDataSub1 {
  MyDataSub1(this.my1stringDat, this.my1boolDat);

  String my1stringDat;
  bool my1boolDat;

  String log() =>
      "_MyDataSub1(/my1stringDat:$my1stringDat　/my1boolDat:$my1boolDat)";

  factory MyDataSub1.fromJson(Map<String, dynamic> json) => _$MyDataSub1FromJson(json);

  Map<String, dynamic> toJson() => _$MyDataSub1ToJson(this);
}
