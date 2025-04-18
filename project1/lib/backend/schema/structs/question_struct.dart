// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionStruct extends FFFirebaseStruct {
  QuestionStruct({
    String? name,
    List<OptionsStruct>? options,
    int? ansPoints,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _options = options,
        _ansPoints = ansPoints,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "options" field.
  List<OptionsStruct>? _options;
  List<OptionsStruct> get options => _options ?? const [];
  set options(List<OptionsStruct>? val) => _options = val;

  void updateOptions(Function(List<OptionsStruct>) updateFn) {
    updateFn(_options ??= []);
  }

  bool hasOptions() => _options != null;

  // "ansPoints" field.
  int? _ansPoints;
  int get ansPoints => _ansPoints ?? 0;
  set ansPoints(int? val) => _ansPoints = val;

  void incrementAnsPoints(int amount) => ansPoints = ansPoints + amount;

  bool hasAnsPoints() => _ansPoints != null;

  static QuestionStruct fromMap(Map<String, dynamic> data) => QuestionStruct(
        name: data['name'] as String?,
        options: getStructList(
          data['options'],
          OptionsStruct.fromMap,
        ),
        ansPoints: castToType<int>(data['ansPoints']),
      );

  static QuestionStruct? maybeFromMap(dynamic data) =>
      data is Map ? QuestionStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'options': _options?.map((e) => e.toMap()).toList(),
        'ansPoints': _ansPoints,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'options': serializeParam(
          _options,
          ParamType.DataStruct,
          isList: true,
        ),
        'ansPoints': serializeParam(
          _ansPoints,
          ParamType.int,
        ),
      }.withoutNulls;

  static QuestionStruct fromSerializableMap(Map<String, dynamic> data) =>
      QuestionStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        options: deserializeStructParam<OptionsStruct>(
          data['options'],
          ParamType.DataStruct,
          true,
          structBuilder: OptionsStruct.fromSerializableMap,
        ),
        ansPoints: deserializeParam(
          data['ansPoints'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'QuestionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is QuestionStruct &&
        name == other.name &&
        listEquality.equals(options, other.options) &&
        ansPoints == other.ansPoints;
  }

  @override
  int get hashCode => const ListEquality().hash([name, options, ansPoints]);
}

QuestionStruct createQuestionStruct({
  String? name,
  int? ansPoints,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    QuestionStruct(
      name: name,
      ansPoints: ansPoints,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

QuestionStruct? updateQuestionStruct(
  QuestionStruct? question, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    question
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addQuestionStructData(
  Map<String, dynamic> firestoreData,
  QuestionStruct? question,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (question == null) {
    return;
  }
  if (question.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && question.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final questionData = getQuestionFirestoreData(question, forFieldValue);
  final nestedData = questionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = question.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getQuestionFirestoreData(
  QuestionStruct? question, [
  bool forFieldValue = false,
]) {
  if (question == null) {
    return {};
  }
  final firestoreData = mapToFirestore(question.toMap());

  // Add any Firestore field values
  question.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getQuestionListFirestoreData(
  List<QuestionStruct>? questions,
) =>
    questions?.map((e) => getQuestionFirestoreData(e, true)).toList() ?? [];
