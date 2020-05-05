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
