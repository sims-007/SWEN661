import 'package:flutter_test/flutter_test.dart';
import 'package:careconnect_flutter/app/careconnect_app.dart';

void main() {
  testWidgets(
    'CareConnect app launches',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const CareConnectApp(),
      );

      expect(
        find.text('CareConnect'),
        findsOneWidget,
      );

      expect(
        find.text('Choose Your Theme'),
        findsOneWidget,
      );
    },
  );
}
