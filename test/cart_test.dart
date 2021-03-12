// Copyright 2020 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.


import 'package:flutter_testing/models/cart.dart';
import 'package:test/test.dart';

void main() {
  group('Testing Cart class', () {
    var cart = Cart();

    //Test 1
    test('A new product should be added', () {
      var product = 25;
      cart.add(product);
      expect(cart.items.contains(product), true);
    });

    // Test 2
    test('A product should be removed', () {
      var product = 45;
      cart.add(product);
      expect(cart.items.contains(product), true);
      cart.remove(product);
      expect(cart.items.contains(product), false);
    });
  });
}
