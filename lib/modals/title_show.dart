class TitleShow{
  String? id;
  String? name;
  String? imageUrl;

  TitleShow({required this.id,required this.name, this.imageUrl});


  TitleShow.fromJson(Map<String, dynamic> json){
    id = json["id"]?.substring(7, 16);
    name = json["title"];
    imageUrl = json["image"]?["url"];
  }
}





