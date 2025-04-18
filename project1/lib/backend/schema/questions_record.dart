import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionsRecord extends FirestoreRecord {
  QuestionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "options" field.
  List<OptionsStruct>? _options;
  List<OptionsStruct> get options => _options ?? const [];
  bool hasOptions() => _options != null;

  // "index" field.
  int? _index;
  int get index => _index ?? 0;
  bool hasIndex() => _index != null;

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

  // "addPoints" field.
  String? _addPoints;
  String get addPoints => _addPoints ?? '';
  bool hasAddPoints() => _addPoints != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _options = getStructList(
      snapshotData['options'],
      OptionsStruct.fromMap,
    );
    _index = castToType<int>(snapshotData['index']);
    _question = snapshotData['question'] as String?;
    _addPoints = snapshotData['addPoints'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('questions')
          : FirebaseFirestore.instance.collectionGroup('questions');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('questions').doc(id);

  static Stream<QuestionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuestionsRecord.fromSnapshot(s));

  static Future<QuestionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuestionsRecord.fromSnapshot(s));

  static QuestionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuestionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuestionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuestionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuestionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuestionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuestionsRecordData({
  int? index,
  String? question,
  String? addPoints,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'index': index,
      'question': question,
      'addPoints': addPoints,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuestionsRecordDocumentEquality implements Equality<QuestionsRecord> {
  const QuestionsRecordDocumentEquality();

  @override
  bool equals(QuestionsRecord? e1, QuestionsRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.options, e2?.options) &&
        e1?.index == e2?.index &&
        e1?.question == e2?.question &&
        e1?.addPoints == e2?.addPoints;
  }

  @override
  int hash(QuestionsRecord? e) => const ListEquality()
      .hash([e?.options, e?.index, e?.question, e?.addPoints]);

  @override
  bool isValidKey(Object? o) => o is QuestionsRecord;
}
