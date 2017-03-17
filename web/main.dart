// Copyright (c) 2017, faddat. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'dart:convert';
import 'dart:core';
import 'package:serializable/serializable.dart';


void main() {
loadData();
}

void loadData() {
  var url = "https://api.steemjs.com/get_discussions_by_trending?query=%7B%22tag%22%3A%22beyondbitcoin%22%2C%20%22limit%22%3A%20%2210%22%7D";
  var request = HttpRequest.getString(url).then(onDataLoaded);
}

onDataLoaded(String responseText) {
  var jsonString = responseText;
  print(jsonString);
  String listAsJson = responseText;
  querySelector('#output').text = responseText;
  List<Map<String, dynamic>> json = JSON.decode(responseText);
  var articles = json.map((m) => new Article.fromMap(m)).toList();
}

class Article {
  int id;
  String author;
  String link;
  String body;

  Article.fromMap(Map<String, dynamic> responseText) {
    id = responseText['id'];
    author = responseText['author'];
    link = responseText['permlink'];
    body = responseText['body'];
  }
}



