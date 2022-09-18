class ApiConstant{
  
  //get X-RapidAPI-Key form [https://rapidapi.com/apidojo/api/imdb8]
  static const String key = "your X-RapidAPI-Key";

  static const String urlFind = "https://imdb8.p.rapidapi.com/title/find?q=";
  static const String urlCast = "https://imdb8.p.rapidapi.com/title/get-full-credits?tconst=";
  static const String urlOverViewDetail = "https://imdb8.p.rapidapi.com/title/get-overview-details?tconst=";
  static const String host = "imdb8.p.rapidapi.com";
  static const Map<String, String> headers = {
        'X-RapidAPI-Key': key,
        'X-RapidAPI-Host': host
      };
}