import 'dart:ui';
import 'package:flutter_test/flutter_test.dart';
import 'package:quill_html_editor/src/utils/string_util.dart';
import 'package:quill_html_editor/src/utils/url_validator.dart';

void main() {
  group('StringUtil tests', () {
    test('getCssFontWeight returns correct weight string', () {
      expect(StringUtil.getCssFontWeight(FontWeight.bold),
          equals('FontWeight.700'));
      expect(StringUtil.getCssFontWeight(FontWeight.normal),
          equals('FontWeight.400'));
      expect(StringUtil.getCssFontWeight(null), equals('FontWeight.400'));
    });

    test('getCssFontStyle returns correct style name', () {
      expect(StringUtil.getCssFontStyle(FontStyle.italic), equals('italic'));
      expect(StringUtil.getCssFontStyle(FontStyle.normal), equals('normal'));
      expect(StringUtil.getCssFontStyle(null), equals('normal'));
    });

    test('getCssTextAlign returns correct align name', () {
      expect(StringUtil.getCssTextAlign(TextAlign.center), equals('center'));
      expect(StringUtil.getCssTextAlign(TextAlign.start), equals('start'));
      expect(StringUtil.getCssTextAlign(null), equals('start'));
    });

    test('sanitizeVideoUrl handles YouTube URLs', () {
      const ytUrl = 'https://www.youtube.com/watch?v=dQw4w9WgXcQ';
      expect(StringUtil.sanitizeVideoUrl(ytUrl),
          equals('https://www.youtube.com/embed/dQw4w9WgXcQ'));

      const ytShortEmbed = 'https://youtu.be/dQw4w9WgXcQ';
      expect(StringUtil.getYoutubeEmbedLink(ytShortEmbed),
          equals('https://www.youtube.com/embed/dQw4w9WgXcQ'));
    });

    test('sanitizeVideoUrl handles Vimeo URLs', () {
      const vimeoUrl = 'https://vimeo.com/123456789';
      expect(StringUtil.sanitizeVideoUrl(vimeoUrl),
          equals('https://player.vimeo.com/video/123456789'));
    });

    test('sanitizeVideoUrl returns original for other URLs', () {
      const regularUrl = 'https://example.com/video.mp4';
      expect(StringUtil.sanitizeVideoUrl(regularUrl), equals(regularUrl));
    });
  });

  group('url_validator tests', () {
    test('hasValidUrl returns true for valid URLs', () {
      expect(hasValidUrl('https://flutter.dev'), isTrue);
      expect(hasValidUrl('http://google.com'), isTrue);
      expect(hasValidUrl('https://sub.domain.org/path?query=1'), isTrue);
    });

    test('hasValidUrl returns false for invalid URLs', () {
      expect(hasValidUrl('invalid-url'), isFalse);
      expect(hasValidUrl('ftp://example.com'), isFalse);
      expect(hasValidUrl(''), isFalse);
    });
  });
}
