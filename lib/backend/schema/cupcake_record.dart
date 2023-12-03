import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CupcakeRecord extends FirestoreRecord {
  CupcakeRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "imageUrl" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  void _initializeFields() {
    _price = castToType<double>(snapshotData['price']);
    _name = snapshotData['name'] as String?;
    _imageUrl = snapshotData['imageUrl'] as String?;
    _description = snapshotData['description'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Cupcake');

  static Stream<CupcakeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CupcakeRecord.fromSnapshot(s));

  static Future<CupcakeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CupcakeRecord.fromSnapshot(s));

  static CupcakeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CupcakeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CupcakeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CupcakeRecord._(reference, mapFromFirestore(data));

  static CupcakeRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      CupcakeRecord.getDocumentFromData(
        {
          'price': convertAlgoliaParam(
            snapshot.data['price'],
            ParamType.double,
            false,
          ),
          'name': snapshot.data['name'],
          'imageUrl': snapshot.data['imageUrl'],
          'description': snapshot.data['description'],
        },
        CupcakeRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<CupcakeRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'Cupcake',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'CupcakeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CupcakeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCupcakeRecordData({
  double? price,
  String? name,
  String? imageUrl,
  String? description,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'price': price,
      'name': name,
      'imageUrl': imageUrl,
      'description': description,
    }.withoutNulls,
  );

  return firestoreData;
}

class CupcakeRecordDocumentEquality implements Equality<CupcakeRecord> {
  const CupcakeRecordDocumentEquality();

  @override
  bool equals(CupcakeRecord? e1, CupcakeRecord? e2) {
    return e1?.price == e2?.price &&
        e1?.name == e2?.name &&
        e1?.imageUrl == e2?.imageUrl &&
        e1?.description == e2?.description;
  }

  @override
  int hash(CupcakeRecord? e) => const ListEquality()
      .hash([e?.price, e?.name, e?.imageUrl, e?.description]);

  @override
  bool isValidKey(Object? o) => o is CupcakeRecord;
}
