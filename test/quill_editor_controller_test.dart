import 'package:flutter_test/flutter_test.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

void main() {
  group('QuillEditorController tests', () {
    test('creates controller instance successfully', () {
      final controller = QuillEditorController();
      expect(controller, isNotNull);
      expect(controller.isEnable, isTrue);
      expect(controller.toolBarKey, isNotNull);
    });

    test('onTextChanged registers listener without errors', () {
      final controller = QuillEditorController();
      String? emittedText;
      controller.onTextChanged((text) {
        emittedText = text;
      });
      expect(emittedText, isNull);
      controller.dispose();
    });

    test('onEditorLoaded registers callback without errors', () {
      final controller = QuillEditorController();
      var loaded = false;
      controller.onEditorLoaded(() {
        loaded = true;
      });
      expect(loaded, isFalse);
      controller.dispose();
    });

    test('SelectionModel fromJson parses correctly', () {
      final model = SelectionModel.fromJson({'index': 5, 'length': 10});
      expect(model.index, equals(5));
      expect(model.length, equals(10));
    });
  });
}
