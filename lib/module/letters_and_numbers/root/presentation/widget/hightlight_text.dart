import 'package:flutter/cupertino.dart';

/// Map of accented → unaccented characters (upper and lower case)
const Map<String, String> _accentMap = {
  'a': 'aáàảãạ',
  'ă': 'ăắằẳẵặ',
  'â': 'âấầẩẫậ',
  'e': 'eéèẻẽẹ',
  'ê': 'êếềểễệ',
  'i': 'iíìỉĩị',
  'o': 'oóòỏõọ',
  'ô': 'ôốồổỗộ',
  'ơ': 'ơớờởỡợ',
  'u': 'uúùủũụ',
  'ư': 'ưứừửữự',
  'y': 'yýỳỷỹỵ',
};

/// Remove Vietnamese accents (both uppercase and lowercase).
String _removeAccent(String source) {
  var result = source;
  _accentMap.forEach((noAccent, accents) {
    for (final ch in accents.split('')) {
      result = result.replaceAll(ch, noAccent);
      result = result.replaceAll(ch.toUpperCase(), noAccent.toUpperCase());
    }
  });
  return result;
}

List<TextSpan> highlightText(
  String text,
  List<String> keywords,
  Color highlightColor, {
  required TextStyle baseStyle,
}) {
  if (keywords.isEmpty) return [TextSpan(text: text, style: baseStyle)];

  final plain = _removeAccent(text).toLowerCase();
  final sorted =
      keywords
          .where((k) => k.trim().isNotEmpty)
          .map((k) => _removeAccent(k).toLowerCase())
          .toList()
        ..sort((a, b) => b.length.compareTo(a.length));

  // combine keywords into regex (gh|nh|tr) – remove & normalize
  final pattern = RegExp('(${sorted.map(RegExp.escape).join('|')})');

  final spans = <TextSpan>[];
  int last = 0;
  for (final m in pattern.allMatches(plain)) {
    if (last < m.start) {
      spans.add(
        TextSpan(text: text.substring(last, m.start), style: baseStyle),
      );
    }
    spans.add(
      TextSpan(
        text: text.substring(m.start, m.end),
        style: baseStyle.copyWith(color: highlightColor),
      ),
    );
    last = m.end;
  }
  if (last < text.length) {
    spans.add(TextSpan(text: text.substring(last), style: baseStyle));
  }
  return spans;
}
