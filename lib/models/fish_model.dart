import 'package:critterpedia/constants/month_names.dart';
import 'package:json_annotation/json_annotation.dart';
part 'fish_model.g.dart';

@JsonSerializable()
class Fish {
  final int id;

  @JsonKey(name: 'file-name')
  final String fileName;

  @JsonKey(name: 'name')
  final Names names;

  final Availability availability;

  final String shadow;
  final int price;

  @JsonKey(name: 'price-cj')
  final int priceCj;

  @JsonKey(name: 'catch-phrase')
  final String catchPhrase;

  @JsonKey(name: 'museum-phrase')
  final String museumPhrase;

  Fish(
    this.id,
    this.fileName,
    this.names,
    this.availability,
    this.shadow,
    this.price,
    this.priceCj,
    this.catchPhrase,
    this.museumPhrase,
  );

  factory Fish.fromJson(Map<String, dynamic> json) => _$FishFromJson(json);

  Map<String, dynamic> toJson() => _$FishToJson(this);

  String get name => names?.en;
  String get rarity => availability?.rarity;
  String get timeAvailable => availability?.time;
  String get northernMonths => availability?.northernMonths ?? '';
  String get southernMonths => availability?.southernMonths ?? '';
  String get location => availability?.location ?? 'Unknown';

  bool get isAllDay => availability?.isAllDay ?? false;
  bool get isAllYear => availability?.isAllYear ?? false;

  String get getTimeAvailable => (isAllDay) ? 'All day' : timeAvailable;
  String get getMonthAvailableNorth =>
      (isAllYear) ? 'All year' : monthNumberToName(northernMonths);
  String get getMonthAvailableSouth =>
      (isAllYear) ? 'All year' : monthNumberToName(southernMonths);

  String monthNumberToName(String monthRange) {
    final List<String> monthRangeList =
        monthRange.replaceAll(' ', '').split('&');

    return monthRangeList.map((String months) {
      return months.split('-').map((String month) {
        return monthNames[month];
      }).join('-');
    }).join(' & ');
  }
}

@JsonSerializable()
class Names {
  @JsonKey(name: 'name-en')
  final String en;

  @JsonKey(name: 'name-jp')
  final String jp;

  Names(
    this.en,
    this.jp,
  );

  factory Names.fromJson(Map<String, dynamic> json) => _$NamesFromJson(json);

  Map<String, dynamic> toJson() => _$NamesToJson(this);
}

@JsonSerializable()
class Availability {
  @JsonKey(name: 'month-northern')
  final String northernMonths;

  @JsonKey(name: 'month-southern')
  final String southernMonths;

  final String time;

  final bool isAllDay;
  final bool isAllYear;

  final String location;
  final String rarity;

  Availability(
    this.northernMonths,
    this.southernMonths,
    this.time,
    this.isAllDay,
    this.isAllYear,
    this.location,
    this.rarity,
  );

  factory Availability.fromJson(Map<String, dynamic> json) =>
      _$AvailabilityFromJson(json);

  Map<String, dynamic> toJson() => _$AvailabilityToJson(this);
}

class AllFish {
  final Map<String, Fish> fishMap;

  AllFish(this.fishMap);

  AllFish.fromJson(Map<String, dynamic> json)
      : fishMap = json.map(
          (String k, dynamic v) => MapEntry(
            k,
            Fish.fromJson(v),
          ),
        );

  List<Fish> get getList => fishMap.values.toList();
}
