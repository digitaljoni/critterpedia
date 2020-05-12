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

  bool availableForNorth(int monthNumber) =>
      checkAvailability(monthNumber: monthNumber, monthRange: northernMonths);
  bool availableForSouth(int monthNumber) =>
      checkAvailability(monthNumber: monthNumber, monthRange: southernMonths);

  bool checkAvailability({int monthNumber, String monthRange}) {
    if (isAllYear) {
      return true;
    }

    bool isAvailable = false;

    final List<String> monthRangeList =
        monthRange.replaceAll(' ', '').split('&');

    for (int i = 0; i < monthRangeList.length; i++) {
      final List<String> monthFromTo = monthRangeList[i].split('-');

      final int from = int.parse(monthFromTo[0]);

      if (monthFromTo.length == 1) {
        if (monthNumber == from) {
          isAvailable = true;
        }
      } else {
        final int to = int.parse(monthFromTo[1]);

        if (to > from) {
          if (monthNumber <= to && monthNumber >= from) {
            isAvailable = true;
          }
        } else {
          // if from > to

          if (!(monthNumber < from && monthNumber > to)) {
            isAvailable = true;
          }
        }
      }
    }

    return isAvailable;
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

  List<Fish> getListForMonth({int month, String hemisphere}) {
    if (hemisphere == 'North') {
      return getList
          .where((Fish fish) => fish.availableForNorth(month))
          .toList();
    }

    return getList.where((Fish fish) => fish.availableForSouth(month)).toList();
  }
}
