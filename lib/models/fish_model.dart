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
      (isAllYear) ? 'All year' : monthRangeNorth;
  String get getMonthAvailableSouth =>
      (isAllYear) ? 'All year' : monthRangeSouth;
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
