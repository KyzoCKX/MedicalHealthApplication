import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'quiz1page_model.dart';
export 'quiz1page_model.dart';

class Quiz1pageWidget extends StatefulWidget {
  const Quiz1pageWidget({
    super.key,
    required this.quizRef,
    int? index,
    required this.score,
    String? status,
  })  : this.index = index ?? 1,
        this.status = status ?? 'Happy';

  final QuizzesRecord? quizRef;
  final int index;
  final int? score;
  final String status;

  static String routeName = 'quiz1page';
  static String routePath = '/quiz1page';

  @override
  State<Quiz1pageWidget> createState() => _Quiz1pageWidgetState();
}

class _Quiz1pageWidgetState extends State<Quiz1pageWidget> {
  late Quiz1pageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Quiz1pageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.selectedAns = 'none';
      _model.ansPoint = false;
      _model.ansNoPoint = false;
      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<QuestionsRecord>>(
      stream: queryQuestionsRecord(
        parent: widget.quizRef?.reference,
        queryBuilder: (questionsRecord) => questionsRecord.where(
          'index',
          isEqualTo: widget.index,
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xFF31473A),
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<QuestionsRecord> quiz1pageQuestionsRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final quiz1pageQuestionsRecord = quiz1pageQuestionsRecordList.isNotEmpty
            ? quiz1pageQuestionsRecordList.first
            : null;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Color(0xFF31473A),
            appBar: AppBar(
              backgroundColor: Color(0xFF31473A),
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              actions: [],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: 400.0,
                  height: 908.0,
                  constraints: BoxConstraints(
                    maxWidth: 400.0,
                  ),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, -1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    25.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    widget.quizRef?.emotion,
                                    'none',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        fontSize: 30.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      25.0, 5.0, 5.0, 0.0),
                                  child: Text(
                                    'Question',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      widget.index.toString(),
                                      '1',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .success,
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 6.0, 5.0, 0.0),
                                  child: Text(
                                    '/',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 25.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      widget.quizRef?.listQuestions.length
                                          .toString(),
                                      '10',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 350.0,
                              child: Divider(
                                thickness: 1.0,
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                          ],
                        ),
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      25.0, 15.0, 0.0, 15.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      quiz1pageQuestionsRecord?.question,
                                      'noQuestion',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          fontSize: 22.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                              Builder(
                                builder: (context) {
                                  final options = quiz1pageQuestionsRecord
                                          ?.options
                                          .toList() ??
                                      [];

                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: options.length,
                                    itemBuilder: (context, optionsIndex) {
                                      final optionsItem = options[optionsIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            25.0, 10.0, 25.0, 10.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.selectedAns =
                                                optionsItem.optionName;
                                            safeSetState(() {});
                                          },
                                          child: Container(
                                            width: 100.0,
                                            height: 78.0,
                                            decoration: BoxDecoration(
                                              color: optionsItem.optionName ==
                                                      _model.selectedAns
                                                  ? Color(0xFFD4BC91)
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 4.0,
                                                  color: Color(0x33000000),
                                                  offset: Offset(
                                                    0.0,
                                                    2.0,
                                                  ),
                                                )
                                              ],
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(20.0),
                                                bottomRight:
                                                    Radius.circular(20.0),
                                                topLeft: Radius.circular(20.0),
                                                topRight: Radius.circular(20.0),
                                              ),
                                              border: Border.all(
                                                color: optionsItem.optionName ==
                                                        _model.selectedAns
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      optionsItem.optionName,
                                                      'noOption',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              StreamBuilder<List<MentalStatusesRecord>>(
                                stream: queryMentalStatusesRecord(
                                  queryBuilder: (mentalStatusesRecord) =>
                                      mentalStatusesRecord.where(
                                    'userRef',
                                    isEqualTo: currentUserReference,
                                  ),
                                  singleRecord: true,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<MentalStatusesRecord>
                                      containerMentalStatusesRecordList =
                                      snapshot.data!;
                                  // Return an empty Container when the item does not exist.
                                  if (snapshot.data!.isEmpty) {
                                    return Container();
                                  }
                                  final containerMentalStatusesRecord =
                                      containerMentalStatusesRecordList
                                              .isNotEmpty
                                          ? containerMentalStatusesRecordList
                                              .first
                                          : null;

                                  return Container(
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: StreamBuilder<List<QuizzesRecord>>(
                                        stream: queryQuizzesRecord(
                                          queryBuilder: (quizzesRecord) =>
                                              quizzesRecord.where(
                                            'CreatedBy',
                                            isEqualTo:
                                                widget.quizRef?.createdBy,
                                          ),
                                          singleRecord: true,
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<QuizzesRecord>
                                              buttonQuizzesRecordList =
                                              snapshot.data!;
                                          // Return an empty Container when the item does not exist.
                                          if (snapshot.data!.isEmpty) {
                                            return Container();
                                          }
                                          final buttonQuizzesRecord =
                                              buttonQuizzesRecordList.isNotEmpty
                                                  ? buttonQuizzesRecordList
                                                      .first
                                                  : null;

                                          return FFButtonWidget(
                                            onPressed: () async {
                                              if (_model.ansPoint == true) {
                                                _model.selectedAns = 'True';
                                                safeSetState(() {});
                                                await Future.delayed(
                                                    const Duration(
                                                        milliseconds: 1200));
                                                // UpdateScore

                                                await containerMentalStatusesRecord!
                                                    .reference
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'Date': FieldValue
                                                          .arrayUnion([
                                                        functions.newCustomFunction(
                                                            containerMentalStatusesRecord
                                                                .date
                                                                .toList())
                                                      ]),
                                                      'Score':
                                                          FieldValue.arrayUnion(
                                                              [5]),
                                                    },
                                                  ),
                                                });
                                                if (widget.index ==
                                                    buttonQuizzesRecord
                                                        ?.listQuestions
                                                        .length) {
                                                  // updateQuiz_WithFinalScore
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text(
                                                            'Congralutations!'),
                                                        content: Text(
                                                            'You have done the Quiz!'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text('Ok'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );

                                                  context.pushNamed(
                                                    HomePageWidget.routeName,
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                          TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .rightToLeft,
                                                      ),
                                                    },
                                                  );
                                                } else {
                                                  context.pushNamed(
                                                    Quiz1pageWidget.routeName,
                                                    queryParameters: {
                                                      'quizRef': serializeParam(
                                                        widget.quizRef,
                                                        ParamType.Document,
                                                      ),
                                                      'index': serializeParam(
                                                        functions.indexIncrease(
                                                            widget.index),
                                                        ParamType.int,
                                                      ),
                                                      'score': serializeParam(
                                                        widget.score,
                                                        ParamType.int,
                                                      ),
                                                      'status': serializeParam(
                                                        '',
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'quizRef':
                                                          widget.quizRef,
                                                      kTransitionInfoKey:
                                                          TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .rightToLeft,
                                                      ),
                                                    },
                                                  );
                                                }
                                              } else {
                                                if (_model.selectedAns !=
                                                        null &&
                                                    _model.selectedAns != '') {
                                                  _model.selectedAns = null;
                                                  _model.ansPoint = null;
                                                  _model.ansNoPoint = null;
                                                  safeSetState(() {});
                                                  // UpdateScore

                                                  await containerMentalStatusesRecord!
                                                      .reference
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'Date': FieldValue
                                                            .arrayUnion([
                                                          functions.newCustomFunction(
                                                              containerMentalStatusesRecord
                                                                  .date
                                                                  .toList())
                                                        ]),
                                                        'Score': FieldValue
                                                            .arrayUnion([3]),
                                                      },
                                                    ),
                                                  });
                                                  await Future.delayed(
                                                      const Duration(
                                                          milliseconds: 1200));
                                                  if (widget.index ==
                                                      buttonQuizzesRecord
                                                          ?.listQuestions
                                                          .length) {
                                                    // updateQuiz_WithFinalScore
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              'Congralutations!'),
                                                          content: Text(
                                                              'You have done the Quiz!'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );

                                                    context.pushNamed(
                                                      HomePageWidget.routeName,
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .rightToLeft,
                                                        ),
                                                      },
                                                    );
                                                  } else {
                                                    context.pushNamed(
                                                      Quiz1pageWidget.routeName,
                                                      queryParameters: {
                                                        'quizRef':
                                                            serializeParam(
                                                          widget.quizRef,
                                                          ParamType.Document,
                                                        ),
                                                        'index': serializeParam(
                                                          functions
                                                              .indexIncrease(
                                                                  widget
                                                                      .index),
                                                          ParamType.int,
                                                        ),
                                                        'score': serializeParam(
                                                          widget.score,
                                                          ParamType.int,
                                                        ),
                                                        'status':
                                                            serializeParam(
                                                          widget.status,
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'quizRef':
                                                            widget.quizRef,
                                                        kTransitionInfoKey:
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .rightToLeft,
                                                        ),
                                                      },
                                                    );
                                                  }
                                                } else {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text(
                                                            'Answer the question'),
                                                        content: Text(
                                                            'Choose one option to answer the questions'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text('Ok'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                }
                                              }
                                            },
                                            text: 'Next',
                                            options: FFButtonOptions(
                                              width: 347.0,
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0xFF31473A),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 3.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              hoverColor:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              hoverBorderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 1.0,
                                              ),
                                              hoverTextColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              hoverElevation: 0.0,
                                            ),
                                            showLoadingIndicator: false,
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
