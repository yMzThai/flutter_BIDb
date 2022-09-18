// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// import 'package:flutter/material.dart';
// import 'package:flutter_imdb/api/fetch_data.dart';
// import 'package:flutter_test/flutter_test.dart';

// import 'package:flutter_imdb/main.dart';

import 'package:flutter_imdb/api/fetch_data.dart';
import 'package:flutter_imdb/modals/overview_detial.dart';


void main() async{
  OverviweDetial list = await FetchData().getDetail("tt0944947");
  print("""
  title ${list.title}
 
  titleType ${list.titleType}

  year ${list.year}

  rating ${list.rating}

  genres ${list.genres}

  author ${list.author}

  detial ${list.detial}

  imageUrl ${list.imageUrl}
""");
}
