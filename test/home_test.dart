// Copyright 2020 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/models/cart.dart';
import 'package:flutter_testing/screens/home.dart';
import 'package:provider/provider.dart';

Widget createHomeScreen() => ChangeNotifierProvider<Cart>(
      create: (context) => Cart(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );

void main() {
  group('Home Page Widget Tests', () {
    testWidgets('Title should be visible', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.text('Shopping App Testing'), findsOneWidget);
    });

    testWidgets('Cart should be visible', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.byKey(Key('cart')), findsOneWidget);
    });

    testWidgets('Product list should be visible', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('Scroll test', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.text('Product 0'), findsOneWidget);

      await tester.fling(find.byType(ListView), Offset(0, -200), 3000);
      await tester.pumpAndSettle();

      expect(find.text('Product 0'), findsNothing);
    });

    testWidgets('Product should be added and removed', (tester) async {
      await tester.pumpWidget(createHomeScreen());

      await tester.tap(find.byIcon(Icons.shopping_cart_outlined).first);
      await tester.pumpAndSettle(Duration(seconds: 1));

      expect(find.text('Added to cart.'), findsOneWidget);

      expect(find.byIcon(Icons.shopping_cart), findsWidgets);

      await tester.tap(find.byIcon(Icons.shopping_cart).first);
      await tester.pumpAndSettle(Duration(seconds: 1));

      expect(find.text('Removed from cart.'), findsOneWidget);
    });
  });
}
