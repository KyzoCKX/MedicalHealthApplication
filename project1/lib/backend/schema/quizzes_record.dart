import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuizzesRecord extends FirestoreRecord {
  QuizzesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "StatusOfQuiz" field.
  String? _statusOfQuiz;
  String get statusOfQuiz => _statusOfQuiz ?? '';
  bool hasStatusOfQuiz() => _statusOfQuiz != null;

  // "Emotion" field.
  String? _emotion;
  String get emotion => _emotion ?? '';
  bool hasEmotion() => _emotion != null;

  // "DateReference" field.
  DateTime? _dateReference;
  DateTime? get dateReference => _dateReference;
  bool hasDateReference() => _dateReference != null;

  // "listQuestions" field.
  List<DocumentReference>? _listQuestions;
  List<DocumentReference> get listQuestions => _listQuestions ?? const [];
  bool hasListQuestions() => _listQuestions != null;

  // "results" field.
  List<DocumentReference>? _results;
  List<DocumentReference> get results => _results ?? const [];
  bool hasResults() => _results != null;

  // "numQuestions" field.
  int? _numQuestions;
  int get numQuestions => _numQuestions ?? 0;
  bool hasNumQuestions() => _numQuestions != null;

  // "totalPoints" field.
  int? _totalPoints;
  int get totalPoints => _totalPoints ?? 0;
  bool hasTotalPoints() => _totalPoints != null;

  // "CreatedBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  void _initializeFields() {
    _statusOfQuiz = snapshotData['StatusOfQuiz'] as String?;
    _emotion = snapshotData['Emotion'] as String?;
    _dateReference = snapshotData['DateReference'] as DateTime?;
    _listQuestions = getDataList(snapshotData['listQuestions']);
    _results = getDataList(snapshotData['results']);
    _numQuestions = castToType<int>(snapshotData['numQuestions']);
    _totalPoints = castToType<int>(snapshotData['totalPoints']);
    _createdBy = snapshotData['CreatedBy'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Quizzes');

  static Stream<QuizzesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuizzesRecord.fromSnapshot(s));

  static Future<QuizzesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuizzesRecord.fromSnapshot(s));

  static QuizzesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuizzesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuizzesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuizzesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuizzesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuizzesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuizzesRecordData({
  String? statusOfQuiz,
  String? emotion,
  DateTime? dateReference,
  int? numQuestions,
  int? totalPoints,
  DocumentReference? createdBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'StatusOfQuiz': statusOfQuiz,
      'Emotion': emotion,
      'DateReference': dateReference,
      'numQuestions': numQuestions,
      'totalPoints': totalPoints,
      'CreatedBy': createdBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuizzesRecordDocumentEquality implements Equality<QuizzesRecord> {
  const QuizzesRecordDocumentEquality();

  @override
  bool equals(QuizzesRecord? e1, QuizzesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.statusOfQuiz == e2?.statusOfQuiz &&
        e1?.emotion == e2?.emotion &&
        e1?.dateReference == e2?.dateReference &&
        listEquality.equals(e1?.listQuestions, e2?.listQuestions) &&
        listEquality.equals(e1?.results, e2?.results) &&
        e1?.numQuestions == e2?.numQuestions &&
        e1?.totalPoints == e2?.totalPoints &&
        e1?.createdBy == e2?.createdBy;
  }

  @override
  int hash(QuizzesRecord? e) => const ListEquality().hash([
        e?.statusOfQuiz,
        e?.emotion,
        e?.dateReference,
        e?.listQuestions,
        e?.results,
        e?.numQuestions,
        e?.totalPoints,
        e?.createdBy
      ]);

  @override
  bool isValidKey(Object? o) => o is QuizzesRecord;
}
