class IcecreamData {
  List<Icecream> icecreams;

  IcecreamData({
    required this.icecreams,
  });

  /// Factory constructor to create IcecreamData from JSON
  factory IcecreamData.fromJson(Map<String, dynamic> json) {
    return IcecreamData(
      icecreams: (json['icecreams'] as List)
          .map((item) => Icecream.fromJson(item))
          .toList(),
    );
  }

  /// Convert IcecreamData to JSON
  Map<String, dynamic> toJson() {
    return {
      'icecreams': icecreams.map((e) => e.toJson()).toList(),
    };
  }
}

class Icecream {
  int id;
  String name;
  String flavor;
  double price;
  double rating;
  bool available;
  List<String> ingredients;
  String image;
  String ? description;

  Icecream({
    required this.id,
    required this.name,
    required this.flavor,
    required this.price,
    required this.rating,
    required this.available,
    required this.ingredients,
    required this.image,
   this.description,
  });

  /// Factory constructor to create Icecream from JSON
  factory Icecream.fromJson(Map<String, dynamic> json) {
    return Icecream(
      id: json['id'],
      name: json['name'],
      flavor: json['flavor'],
      price: (json['price'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      available: json['available'],
      ingredients: List<String>.from(json['ingredients']),
      image: json['image'],
      description: json['description'],
    );
  }

  get toppings => null;

  /// Convert Icecream to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'flavor': flavor,
      'price': price,
      'rating': rating,
      'available': available,
      'ingredients': ingredients,
      'image': image,
      'description': description,
    };
  }
}
