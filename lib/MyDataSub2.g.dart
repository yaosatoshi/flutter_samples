// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MyDataSub2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyDataSub2 _$MyDataSub2FromJson(Map<String, dynamic> json) {
  return MyDataSub2(
      (json['my2doubleDat'] as num)?.toDouble(),
      json['my2bintDat'] == null
          ? null
          : BigInt.parse(json['my2bintDat'] as String));
}

Map<String, dynamic> _$MyDataSub2ToJson(MyDataSub2 instance) =>
    <String, dynamic>{
      'my2doubleDat': instance.my2doubleDat,
      'my2bintDat': instance.my2bintDat?.toString()
    };
