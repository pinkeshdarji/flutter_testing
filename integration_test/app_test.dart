// Copyright 2021 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/main.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  group('Testing full app flow', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets('Add product and remove using cancel button', (tester) async {
      await tester.pumpWidget(MyApp());

      //Add
      await tester.tap(find.byIcon(Icons.shopping_cart_outlined).first);
      await tester.pumpAndSettle(Duration(seconds: 1));
      await tester.tap(find.text('Product 1'));
      expect(find.text('Added to cart.'), findsOneWidget);

      // Move to next page
      await tester.tap(find.text('Cart'));
      await tester.pumpAndSettle();

      //Remove via cancel button
      await tester.tap(find.byKey(ValueKey('remove_icon_0')));
      await tester.pumpAndSettle(Duration(seconds: 1));
      expect(find.text('Removed from cart.'), findsOneWidget);
    });

    testWidgets('Add product and remove using swipe', (tester) async {
      await tester.pumpWidget(MyApp());

      //Add
      await tester.tap(find.byIcon(Icons.shopping_cart_outlined).first);
      await tester.pumpAndSettle(Duration(seconds: 1));
      expect(find.text('Added to cart.'), findsOneWidget);

      // Move to next page
      await tester.tap(find.text('Cart'));
      await tester.pumpAndSettle();

      //Remove via swipe
      await tester.drag(find.byType(Dismissible), Offset(500.0, 0.0));
      await tester.pumpAndSettle(Duration(seconds: 1));
      expect(find.text('Removed from cart.'), findsOneWidget);
    });
  });
}
