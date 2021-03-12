// Copyright 2020 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

/// The [Cart] class holds a list of cart items saved by the user.
class Cart extends ChangeNotifier {
  final List<int> _cartItems = [];

  List<int> get items => _cartItems;

  void add(int itemNo) {
    _cartItems.add(itemNo);
    notifyListeners();
  }

  void remove(int itemNo) {
    _cartItems.remove(itemNo);
    notifyListeners();
  }
}
