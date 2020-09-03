
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'MyDataSub1.dart';
import 'MyDataSub2.dart';

part 'MyData.g.dart';

@JsonSerializable()
class MyData {
  MyData(this.intDat, this.stringDat,this.intListDat,this.stringListDat,this.my1Dat,this.my2ListDat );

  int intDat;
   String stringDat;
   List<int> intListDat;
   List<String> stringListDat;
   MyDataSub1 my1Dat;
   List<MyDataSub2> my2ListDat;

  String log() {
    String my2ListLog = "[";
    my2ListDat.forEach((item) => my2ListLog += "${item.log()},");
    my2ListLog += "]";
    return "_MyData(/intDat:$intDat /stringDat:$stringDat /intListDat:$intListDat /stringListDat:$stringListDat /my1Dat:${my1Dat.log()} /my2ListDat:$my2ListLog)";
  }

  factory MyData.fromJson(Map<String, dynamic> json) => _$MyDataFromJson(json);

  Map<String, dynamic> toJson() => _$MyDataToJson(this);

  String toJsonString() => jsonEncode(toJson());

  static MyData fromJsonString(String jsonString) =>
      MyData.fromJson(jsonDecode(jsonString));
}
