import 'dart:convert';

import 'package:flutter_imdb/api/constant.dart';
import 'package:flutter_imdb/modals/cast.dart';
import 'package:flutter_imdb/modals/overview_detial.dart';
import 'package:flutter_imdb/modals/title_show.dart';
import 'package:http/http.dart' as http;



class FetchData {

  Future<List<TitleShow>> find(String text) async {
    final String data = await _fetch(ApiConstant.urlFind, text);
    Map map = json.decode(data);
    final List<dynamic> list = map["results"] ?? [];
    List<TitleShow> titleShows = [];
    for(var i = 0; i<list.length;i++){
      titleShows.add(TitleShow.fromJson(list[i]));
    }
    return titleShows;
  }

  Future<List<Cast>> getCast(String text) async {
    final String data = await _fetch(ApiConstant.urlCast, text);
    Map map = json.decode(data);
    final List<dynamic> list = map["cast"] ?? [];
    List<Cast> cast = [];
    for(var i = 0; i<list.length;i++){
      cast.add(Cast.fromJson(list[i]));
    }
    return cast;
  }

  Future<OverviweDetial> getDetail(String text) async {
    final String data = await _fetch(ApiConstant.urlOverViewDetail, text);
    Map map = json.decode(data);
    OverviweDetial detail = OverviweDetial.fromJson(map);
    return detail;
  }

  Future<String> _fetch(String url,String text) async{
    
    final Uri uri = Uri.parse('$url$text');
        final response = await http.get(
          uri,
          headers: ApiConstant.headers,
        );
    return response.body;
  }
}


