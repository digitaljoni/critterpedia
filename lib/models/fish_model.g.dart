// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fish_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fish _$FishFromJson(Map<String, dynamic> json) {
  return Fish(
    json['id'] as int,
    json['file-name'] as String,
    json['name'] == null
        ? null
        : Names.fromJson(json['name'] as Map<String, dynamic>),
    json['availability'] == null
        ? null
        : Availability.fromJson(json['availability'] as Map<String, dynamic>),
    json['shadow'] as String,
    json['price'] as int,
    json['price-cj'] as int,
    json['catch-phrase'] as String,
    json['museum-phrase'] as String,
  );
}

Map<String, dynamic> _$FishToJson(Fish instance) => <String, dynamic>{
      'id': instance.id,
      'file-name': instance.fileName,
      'name': instance.names,
      'availability': instance.availability,
      'shadow': instance.shadow,
      'price': instance.price,
      'price-cj': instance.priceCj,
      'catch-phrase': instance.catchPhrase,
      'museum-phrase': instance.museumPhrase,
    };

Names _$NamesFromJson(Map<String, dynamic> json) {
  return Names(
    json['name-en'] as String,
    json['name-jp'] as String,
  );
}

Map<String, dynamic> _$NamesToJson(Names instance) => <String, dynamic>{
      'name-en': instance.en,
      'name-jp': instance.jp,
    };

Availability _$AvailabilityFromJson(Map<String, dynamic> json) {
  return Availability(
    json['month-northern'] as String,
    json['month-southern'] as String,
    json['time'] as String,
    json['isAllDay'] as bool,
    json['isAllYear'] as bool,
    json['location'] as String,
    json['rarity'] as String,
  );
}

Map<String, dynamic> _$AvailabilityToJson(Availability instance) =>
    <String, dynamic>{
      'month-northern': instance.northernMonths,
      'month-southern': instance.southernMonths,
      'time': instance.time,
      'isAllDay': instance.isAllDay,
      'isAllYear': instance.isAllYear,
      'location': instance.location,
      'rarity': instance.rarity,
    };
