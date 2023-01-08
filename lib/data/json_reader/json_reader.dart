import 'dart:convert';

import 'package:flutter/services.dart';

class JsonReader {
  Future<List<dynamic>> getJuzaasList() async {
    final String response = await rootBundle.loadString("assets/juzaa.json");
    final data = await json.decode(response);
    return data["Juzaas"];
  }

  Future<List<dynamic>> getPagesList() async {
    final String response = await rootBundle.loadString("assets/page.json");
    final data = await json.decode(response);
    return data["pages"];
  }

  Future<List<dynamic>> getSurahsList() async {
    final String response = await rootBundle.loadString("assets/surah.json");
    final data = await json.decode(response);
    return data["surahs"];
  }
}
