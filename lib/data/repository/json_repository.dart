import '../json_reader/json_reader.dart';
import '../models/juzaa.dart';
import '../models/page.dart';
import '../models/surah.dart';

class JsonRepository {
  final JsonReader jsonReader;
  JsonRepository(this.jsonReader);
  Future<List<Juzaa>> getJuzaasList() async {
    List<dynamic> juzaas = [];
    await jsonReader.getJuzaasList().then((list) {
      juzaas = list;
    });
    return juzaas.map((e) => Juzaa.fromJson(e)).toList();
  }

  Future<List<Page>> getPagesList() async {
    List<dynamic> pages = [];
    await jsonReader.getPagesList().then((list) {
      pages = list;
    });

    return pages.map((e) => Page.fromJson(e)).toList();
  }

  Future<List<Surah>> getSurahsList() async {
    List<dynamic> data = [];
    await jsonReader.getSurahsList().then((value) {
      data = value;
    });
    return data.map((e) => Surah.fromJson(e)).toList();
  }
}
