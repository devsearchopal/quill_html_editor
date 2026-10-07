import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quill_html_editor/src/utils/hex_color.dart';

void main() {
  group('HexColor tests', () {
    test('isValidHex correctly identifies valid and invalid hex strings', () {
      expect(HexColor.isValidHex('#ffffff'), isTrue);
      expect(HexColor.isValidHex('#FFFFFF'), isTrue);
      expect(HexColor.isValidHex('#123456'), isTrue);
      expect(HexColor.isValidHex('#abc'), isTrue);
      expect(HexColor.isValidHex('#ABC'), isTrue);

      expect(HexColor.isValidHex('ffffff'), isFalse);
      expect(HexColor.isValidHex('#ffff'), isFalse);
      expect(HexColor.isValidHex('#fffffff'), isFalse);
      expect(HexColor.isValidHex('invalid'), isFalse);
      expect(HexColor.isValidHex(''), isFalse);
    });

    test('HexColor.fromHex converts hex strings to Color', () {
      final white = HexColor.fromHex('#FFFFFF');
      expect((white.r * 255).round(), equals(255));
      expect((white.g * 255).round(), equals(255));
      expect((white.b * 255).round(), equals(255));
      expect((white.a * 255).round(), equals(255));

      final black = HexColor.fromHex('#000000');
      expect((black.r * 255).round(), equals(0));
      expect((black.g * 255).round(), equals(0));
      expect((black.b * 255).round(), equals(0));
      expect((black.a * 255).round(), equals(255));

      final invalid = HexColor.fromHex('invalid');
      expect(invalid.toARGB32(), equals(Colors.transparent.toARGB32()));
    });

    test('getRGBA returns correct rgba list', () {
      final color = HexColor.fromHex('#FF0000');
      final rgba = color.getRGBA(color);
      expect(rgba, equals([255, 0, 0, 255]));
    });

    test('toHex extension formats correctly', () {
      const red = Color(0xFFFF0000);
      expect(red.toHex(), equals('#FF0000'));

      const blue = Color(0xFF0000FF);
      expect(blue.toHex(), equals('#0000FF'));
    });

    test('toRGBA extension formats correctly', () {
      const red = Color(0xFFFF0000);
      expect(red.toRGBA(), equals('rgba(255,0,0,1.0)'));
    });
  });
}
