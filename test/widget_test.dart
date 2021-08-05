import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:somador/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('Resultado da soma: 0'), findsOneWidget);
    expect(find.text('Resultado da soma: 5'), findsNothing);

    await tester.enterText(find.bySemanticsLabel('Primeiro número'), '3');
    await tester.enterText(find.bySemanticsLabel('Segundo número'), '2');

    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    expect(find.text('Resultado da soma: 5'), findsOneWidget);
    expect(find.text('Resultado da soma: 0'), findsNothing);
  });
}
