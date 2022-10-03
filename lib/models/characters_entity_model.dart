class CharacterEntityModel {
  final int id;
  final String characterName;
  final int age;
  final String profession;
  final String imagePath;

  CharacterEntityModel({
    required this.id,
    required this.characterName,
    required this.age,
    required this.profession,
    required this.imagePath,
  });

  factory CharacterEntityModel.fromJson(Map<String, dynamic> json) {
    return CharacterEntityModel(
      id: (json['id'] as num).toInt(),
      characterName: json['name'],
      age: json['age'],
      profession: json['profession'],
      imagePath: json['img'],
    );
  }
}
