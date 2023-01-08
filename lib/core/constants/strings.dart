import 'package:assets_audio_player/assets_audio_player.dart';

const String homeLayout = "/homeLayout";
const String quranScreen =
    "/quranScreen"; /* 
final List<String> pagesMp3urlAbdElbaset = List<String>.generate(
    604,
    (index) =>
        "https://www.searchtruth.org/recitation/Abdullah-Basfar-32kbps/page/Page${(index + 1).toString().padLeft(3, "0")}.mp3"); */
final List<String> pagesMp3url = List<String>.generate(
    604,
    (index) =>
        "https://ia803001.us.archive.org/33/items/MohammedSiddiqAlMinshaweTheHolyQuraanPageByPage/${(index + 1).toString().padLeft(3, "0")}.ogg");
final List<String> pagesBorder = List<String>.generate(
    604, (index) => "packages/quran_20_3/assets/images/00${(index + 1)}.png");
final List<String> pagesText = List<String>.generate(
    604, (index) => "packages/quran_20_3/assets/images/000${(index + 1)}.png");
// final Map<String, String> pages = Map.fromIterables(pagesBorder, pagesText);
bool isDark = false;
const String cahseKey = "PageNumber";
const String cahseKeyForDarkMode = "cahseKeyForDarkMode";
int? pageNumberCashed;
bool? isDarkCashed;
AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer.withId("id");
bool? isOnDoubleTapInfoDismmised;
const String cahseKeyForisOnDoubleTapInfoDismmised =
    "cahseKeyForisOnDoubleTapInfoDismmised";
