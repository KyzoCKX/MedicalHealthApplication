import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'therapist_profile_widget.dart' show TherapistProfileWidget;
import 'package:flutter/material.dart';

class TherapistProfileModel extends FlutterFlowModel<TherapistProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
