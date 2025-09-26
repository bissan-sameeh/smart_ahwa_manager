class Drink{
  final String id;
  final String name;
  final String category;
  final String alcoholic;
  final String glass;
  final String instructions;
  final String thumbnail;

  Drink({
    required this.id,
    required this.name,
    required this.category,
    required this.alcoholic,
    required this.glass,
    required this.instructions,
    required this.thumbnail,
  });

  factory Drink.fromJson(Map<String, dynamic> json) {
    return Drink(
      id: json['idDrink'],
      name: json['strDrink'],
      category: json['strCategory'],
      alcoholic: json['strAlcoholic'],
      glass: json['strGlass'],
      instructions: json['strInstructions'],
      thumbnail: json['strDrinkThumb'],
    );
  }
}