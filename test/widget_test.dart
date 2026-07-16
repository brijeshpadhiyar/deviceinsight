import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:deviceinsight/features/shared/widgets/glass_card.dart';

void main() {
  testWidgets('GlassCard renders child and padding', (WidgetTester tester) async {
    const testKey = Key('test-child');
    
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: GlassCard(
            padding: EdgeInsets.all(20),
            child: SizedBox(
              key: testKey,
              width: 100,
              height: 100,
            ),
          ),
        ),
      ),
    );

    expect(find.byKey(testKey), findsOneWidget);
    expect(find.byType(GlassCard), findsOneWidget);
  });
}
