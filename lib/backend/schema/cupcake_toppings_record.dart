import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class CupcakeToppingsRecord extends FirestoreRecord {
  CupcakeToppingsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _quantity = castToType<int>(snapshotData['quantity']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('cupcakeToppings')
          : FirebaseFirestore.instance.collectionGroup('cupcakeToppings');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('cupcakeToppings').doc();

  static Stream<CupcakeToppingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CupcakeToppingsRecord.fromSnapshot(s));

  static Future<CupcakeToppingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CupcakeToppingsRecord.fromSnapshot(s));

  static CupcakeToppingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CupcakeToppingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CupcakeToppingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CupcakeToppingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CupcakeToppingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CupcakeToppingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCupcakeToppingsRecordData({
  String? name,
  int? quantity,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'quantity': quantity,
    }.withoutNulls,
  );

  return firestoreData;
}

class CupcakeToppingsRecordDocumentEquality
    implements Equality<CupcakeToppingsRecord> {
  const CupcakeToppingsRecordDocumentEquality();

  @override
  bool equals(CupcakeToppingsRecord? e1, CupcakeToppingsRecord? e2) {
    return e1?.name == e2?.name && e1?.quantity == e2?.quantity;
  }

  @override
  int hash(CupcakeToppingsRecord? e) =>
      const ListEquality().hash([e?.name, e?.quantity]);

  @override
  bool isValidKey(Object? o) => o is CupcakeToppingsRecord;
}
