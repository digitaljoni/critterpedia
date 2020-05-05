import 'package:critterpedia/constants/month_names.dart';

class Fish {
  final int id;
  final String name;
  final int price;

  final String fileName;
  final String monthRangeNorth;
  final String monthRangeSouth;
  final String timeAvailable;
  final bool isAllDay;
  final bool isAllYear;
  final String location;
  final String rarity;
  final String catchPhrase;
  final String museumPhrase;

  Fish(
    this.id,
    this.name,
    this.price,
    this.fileName,
    this.monthRangeNorth,
    this.monthRangeSouth,
    this.timeAvailable,
    this.isAllDay,
    this.isAllYear,
    this.location,
    this.rarity,
    this.catchPhrase,
    this.museumPhrase,
  );

  Fish.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name']['name-en'],
        price = json['price'],
        fileName = json['file-name'],
        monthRangeNorth = json['availability']['month-northern'],
        monthRangeSouth = json['availability']['month-southern'],
        timeAvailable = json['availability']['time'],
        isAllDay = json['availability']['isAllDay'],
        isAllYear = json['availability']['isAllYear'],
        location = json['availability']['location'],
        rarity = json['availability']['rarity'],
        catchPhrase = json['catch-phrase'],
        museumPhrase = json['museum-phrase'];

  String get getTimeAvailable => (isAllDay) ? 'All day' : timeAvailable;
  String get getMonthAvailableNorth =>
      (isAllYear) ? 'All year' : monthNumberToName(monthRangeNorth);
  String get getMonthAvailableSouth =>
      (isAllYear) ? 'All year' : monthNumberToName(monthRangeSouth);

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
      checkAvailability(monthNumber: monthNumber, monthRange: monthRangeNorth);
  bool availableForSouth(int monthNumber) =>
      checkAvailability(monthNumber: monthNumber, monthRange: monthRangeSouth);

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
