import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BookingListsRecord extends FirestoreRecord {
  BookingListsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "BookingTime" field.
  DateTime? _bookingTime;
  DateTime? get bookingTime => _bookingTime;
  bool hasBookingTime() => _bookingTime != null;

  // "TherapyName" field.
  String? _therapyName;
  String get therapyName => _therapyName ?? '';
  bool hasTherapyName() => _therapyName != null;

  // "Venue" field.
  String? _venue;
  String get venue => _venue ?? '';
  bool hasVenue() => _venue != null;

  // "TherapyRef" field.
  DocumentReference? _therapyRef;
  DocumentReference? get therapyRef => _therapyRef;
  bool hasTherapyRef() => _therapyRef != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "PendingStatus" field.
  String? _pendingStatus;
  String get pendingStatus => _pendingStatus ?? '';
  bool hasPendingStatus() => _pendingStatus != null;

  void _initializeFields() {
    _bookingTime = snapshotData['BookingTime'] as DateTime?;
    _therapyName = snapshotData['TherapyName'] as String?;
    _venue = snapshotData['Venue'] as String?;
    _therapyRef = snapshotData['TherapyRef'] as DocumentReference?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _pendingStatus = snapshotData['PendingStatus'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('BookingLists');

  static Stream<BookingListsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BookingListsRecord.fromSnapshot(s));

  static Future<BookingListsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BookingListsRecord.fromSnapshot(s));

  static BookingListsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BookingListsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BookingListsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BookingListsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BookingListsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BookingListsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBookingListsRecordData({
  DateTime? bookingTime,
  String? therapyName,
  String? venue,
  DocumentReference? therapyRef,
  DocumentReference? userRef,
  String? pendingStatus,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'BookingTime': bookingTime,
      'TherapyName': therapyName,
      'Venue': venue,
      'TherapyRef': therapyRef,
      'userRef': userRef,
      'PendingStatus': pendingStatus,
    }.withoutNulls,
  );

  return firestoreData;
}

class BookingListsRecordDocumentEquality
    implements Equality<BookingListsRecord> {
  const BookingListsRecordDocumentEquality();

  @override
  bool equals(BookingListsRecord? e1, BookingListsRecord? e2) {
    return e1?.bookingTime == e2?.bookingTime &&
        e1?.therapyName == e2?.therapyName &&
        e1?.venue == e2?.venue &&
        e1?.therapyRef == e2?.therapyRef &&
        e1?.userRef == e2?.userRef &&
        e1?.pendingStatus == e2?.pendingStatus;
  }

  @override
  int hash(BookingListsRecord? e) => const ListEquality().hash([
        e?.bookingTime,
        e?.therapyName,
        e?.venue,
        e?.therapyRef,
        e?.userRef,
        e?.pendingStatus
      ]);

  @override
  bool isValidKey(Object? o) => o is BookingListsRecord;
}
