// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MyData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyData _$MyDataFromJson(Map<String, dynamic> json) {
  return MyData(
      json['intDat'] as int,
      json['stringDat'] as String,
      (json['intListDat'] as List)?.map((e) => e as int)?.toList(),
      (json['stringListDat'] as List)?.map((e) => e as String)?.toList(),
      json['my1Dat'] == null
          ? null
          : MyDataSub1.fromJson(json['my1Dat'] as Map<String, dynamic>),
      (json['my2ListDat'] as List)
          ?.map((e) =>
              e == null ? null : MyDataSub2.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$MyDataToJson(MyData instance) => <String, dynamic>{
      'intDat': instance.intDat,
      'stringDat': instance.stringDat,
      'intListDat': instance.intListDat,
      'stringListDat': instance.stringListDat,
      'my1Dat': instance.my1Dat,
      'my2ListDat': instance.my2ListDat
    };
