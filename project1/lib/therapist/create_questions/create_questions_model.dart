import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'create_questions_widget.dart' show CreateQuestionsWidget;
import 'package:flutter/material.dart';

class CreateQuestionsModel extends FlutterFlowModel<CreateQuestionsWidget> {
  ///  Local state fields for this page.

  String? addPoints;

  List<OptionsStruct> questionOptions = [];
  void addToQuestionOptions(OptionsStruct item) => questionOptions.add(item);
  void removeFromQuestionOptions(OptionsStruct item) =>
      questionOptions.remove(item);
  void removeAtIndexFromQuestionOptions(int index) =>
      questionOptions.removeAt(index);
  void insertAtIndexInQuestionOptions(int index, OptionsStruct item) =>
      questionOptions.insert(index, item);
  void updateQuestionOptionsAtIndex(
          int index, Function(OptionsStruct) updateFn) =>
      questionOptions[index] = updateFn(questionOptions[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  QuestionsRecord? questions;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
