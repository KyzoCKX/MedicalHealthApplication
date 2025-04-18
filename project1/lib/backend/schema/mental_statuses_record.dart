import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MentalStatusesRecord extends FirestoreRecord {
  MentalStatusesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "State" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  // "Date" field.
  List<int>? _date;
  List<int> get date => _date ?? const [];
  bool hasDate() => _date != null;

  // "Score" field.
  List<int>? _score;
  List<int> get score => _score ?? const [];
  bool hasScore() => _score != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _state = snapshotData['State'] as String?;
    _date = getDataList(snapshotData['Date']);
    _score = getDataList(snapshotData['Score']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('MentalStatuses');

  static Stream<MentalStatusesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MentalStatusesRecord.fromSnapshot(s));

  static Future<MentalStatusesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MentalStatusesRecord.fromSnapshot(s));

  static MentalStatusesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MentalStatusesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MentalStatusesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MentalStatusesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MentalStatusesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MentalStatusesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMentalStatusesRecordData({
  DocumentReference? userRef,
  String? state,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'State': state,
    }.withoutNulls,
  );

  return firestoreData;
}

class MentalStatusesRecordDocumentEquality
    implements Equality<MentalStatusesRecord> {
  const MentalStatusesRecordDocumentEquality();

  @override
  bool equals(MentalStatusesRecord? e1, MentalStatusesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userRef == e2?.userRef &&
        e1?.state == e2?.state &&
        listEquality.equals(e1?.date, e2?.date) &&
        listEquality.equals(e1?.score, e2?.score);
  }

  @override
  int hash(MentalStatusesRecord? e) =>
      const ListEquality().hash([e?.userRef, e?.state, e?.date, e?.score]);

  @override
  bool isValidKey(Object? o) => o is MentalStatusesRecord;
}
