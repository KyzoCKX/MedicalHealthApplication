import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'login_user_widget.dart' show LoginUserWidget;
import 'package:flutter/material.dart';

class LoginUserModel extends FlutterFlowModel<LoginUserWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for emailaddresscreate widget.
  FocusNode? emailaddresscreateFocusNode;
  TextEditingController? emailaddresscreateTextController;
  String? Function(BuildContext, String?)?
      emailaddresscreateTextControllerValidator;
  // State field(s) for passwordsCreate widget.
  FocusNode? passwordsCreateFocusNode;
  TextEditingController? passwordsCreateTextController;
  late bool passwordsCreateVisibility;
  String? Function(BuildContext, String?)?
      passwordsCreateTextControllerValidator;
  // State field(s) for roledropdown widget.
  String? roledropdownValue;
  FormFieldController<String>? roledropdownValueController;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordsCreateVisibility = false;
    passwordVisibility = false;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    emailaddresscreateFocusNode?.dispose();
    emailaddresscreateTextController?.dispose();

    passwordsCreateFocusNode?.dispose();
    passwordsCreateTextController?.dispose();

    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}
