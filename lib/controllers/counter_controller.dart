import 'package:flutter/foundation.dart';

class CounterController extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  /// カウントを1増やす
  void increment() {
    _count++;
    notifyListeners();
  }

  /// カウントを1減らす
  void decrement() {
    _count--;
    notifyListeners();
  }

  /// カウントを0に戻す
  void reset() {
    _count = 0;
    notifyListeners();
  }
}