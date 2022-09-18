class OverviweDetial{
  String? title;
  String? titleType;
  int? year;
  double? rating;
  List<dynamic>? genres;
  String? author;
  String? detial;
  String? imageUrl;

  OverviweDetial({
    required this.title,
    required this.titleType,
    required this.year,
    required this.rating,
    required this.genres,
    required this.author,
    required this.detial,
    this.imageUrl
  });

  OverviweDetial.fromJson(Map<dynamic, dynamic> json){
    title = json["title"]?["title"];
    titleType = json["title"]?["titleType"];
    year = json["title"]?["year"];
    rating = json["ratings"]?["rating"];
    genres = json["genres"];
    author = json["plotSummary"]?["author"];
    detial = json["plotSummary"]?["text"];
    imageUrl = json["title"]?["image"]?["url"];

  }

}

