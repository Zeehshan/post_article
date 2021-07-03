part of 'utils.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static HexColor fromJson(String json) => HexColor(json);
  static List<HexColor> fromListJson(List listJson) =>
      listJson.map((e) => HexColor.fromJson(e as String)).toList();
  String toJson() => super.value.toRadixString(16);
}
