
import 'package:json_annotation/json_annotation.dart';

part 'MyDataSub2.g.dart';

@JsonSerializable()
class MyDataSub2 {
  MyDataSub2(this.my2doubleDat, this.my2bintDat);

  double my2doubleDat;
  BigInt my2bintDat;

  String log() =>
      "_MyDataSub2(/my2doubleDat:$my2doubleDat /my2bintDat:$my2bintDat)";

  factory MyDataSub2.fromJson(Map<String, dynamic> json) => _$MyDataSub2FromJson(json);

  Map<String, dynamic> toJson() => _$MyDataSub2ToJson(this);
}
