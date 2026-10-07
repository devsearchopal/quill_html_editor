import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

void main() {
  testWidgets('ToolBar builds custom buttons properly', (tester) async {
    final controller = QuillEditorController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ToolBar(
            controller: controller,
            customButtons: const [
              Text('CustomButton1'),
              Icon(Icons.star),
            ],
            toolBarConfig: const [],
          ),
        ),
      ),
    );

    expect(find.text('CustomButton1'), findsOneWidget);
    expect(find.byIcon(Icons.star), findsOneWidget);
  });
}
