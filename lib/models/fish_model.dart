class Fish {
  final int id;
  final String name;
  final int price;

  Fish(this.id, this.name, this.price);

  Fish.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name']['name-en'],
        price = json['price'];
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
