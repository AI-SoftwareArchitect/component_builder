import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:component_builder/component_builder.dart';

void main() {
  testWidgets('iOS build wraps scroll view with CupertinoScrollbar',
      (tester) async {
    final widget = ComponentBuilder()
        .child(const Text('Hello'))
        .wrapSingleChildScrollView()
        .build(device: ComponentBuilderDevice.ios);

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: widget,
      ),
    );

    expect(find.byType(CupertinoScrollbar), findsOneWidget);
  });
}
