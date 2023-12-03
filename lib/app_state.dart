import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<DocumentReference> _Cart = [];
  List<DocumentReference> get Cart => _Cart;
  set Cart(List<DocumentReference> value) {
    _Cart = value;
  }

  void addToCart(DocumentReference value) {
    _Cart.add(value);
  }

  void removeFromCart(DocumentReference value) {
    _Cart.remove(value);
  }

  void removeAtIndexFromCart(int index) {
    _Cart.removeAt(index);
  }

  void updateCartAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _Cart[index] = updateFn(_Cart[index]);
  }

  void insertAtIndexInCart(int index, DocumentReference value) {
    _Cart.insert(index, value);
  }

  List<double> _cartTotal = [];
  List<double> get cartTotal => _cartTotal;
  set cartTotal(List<double> value) {
    _cartTotal = value;
  }

  void addToCartTotal(double value) {
    _cartTotal.add(value);
  }

  void removeFromCartTotal(double value) {
    _cartTotal.remove(value);
  }

  void removeAtIndexFromCartTotal(int index) {
    _cartTotal.removeAt(index);
  }

  void updateCartTotalAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    _cartTotal[index] = updateFn(_cartTotal[index]);
  }

  void insertAtIndexInCartTotal(int index, double value) {
    _cartTotal.insert(index, value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
