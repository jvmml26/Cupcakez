import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class CupcakeIngredientsRecord extends FirestoreRecord {
  CupcakeIngredientsRecord._(
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
          ? parent.collection('cupcakeIngredients')
          : FirebaseFirestore.instance.collectionGroup('cupcakeIngredients');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('cupcakeIngredients').doc();

  static Stream<CupcakeIngredientsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CupcakeIngredientsRecord.fromSnapshot(s));

  static Future<CupcakeIngredientsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CupcakeIngredientsRecord.fromSnapshot(s));

  static CupcakeIngredientsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CupcakeIngredientsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CupcakeIngredientsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CupcakeIngredientsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CupcakeIngredientsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CupcakeIngredientsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCupcakeIngredientsRecordData({
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

class CupcakeIngredientsRecordDocumentEquality
    implements Equality<CupcakeIngredientsRecord> {
  const CupcakeIngredientsRecordDocumentEquality();

  @override
  bool equals(CupcakeIngredientsRecord? e1, CupcakeIngredientsRecord? e2) {
    return e1?.name == e2?.name && e1?.quantity == e2?.quantity;
  }

  @override
  int hash(CupcakeIngredientsRecord? e) =>
      const ListEquality().hash([e?.name, e?.quantity]);

  @override
  bool isValidKey(Object? o) => o is CupcakeIngredientsRecord;
}
