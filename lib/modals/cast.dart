class Cast{
  String? name;
  String? imageUrl;
  String? characters;

  Cast({required this.name, this.imageUrl, this.characters});

  Cast.fromJson(Map<String, dynamic> json){
    characters = json["characters"]?[0];
    name = json["name"];
    imageUrl = json["image"]?["url"];
  }
}