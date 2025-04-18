import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({
    super.key,
    String? emotion1,
  }) : this.emotion1 = emotion1 ?? 'Happy';

  final String emotion1;

  static String routeName = 'HomePage';
  static String routePath = '/homePage';

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'gridViewOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 620.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF7C8363),
        appBar: AppBar(
          backgroundColor: Color(0xFF31473A),
          automaticallyImplyLeading: false,
          title: Text(
            'Welcome to Check-In',
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'Plus Jakarta Sans',
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Container(
                  width: double.infinity,
                  height: 181.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF7C8363),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 20.0, 15.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/emma-simpson-mNGaaLeWEp0-unsplash.jpg',
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ).animateOnPageLoad(
                    animationsMap['containerOnPageLoadAnimation']!),
              ),
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Container(
                  width: 437.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF7C8363),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 0.0, 5.0),
                      child: Text(
                        'How do you feel today?',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Plus Jakarta Sans',
                              color: Colors.white,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GridView(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 1.0,
                  ),
                  scrollDirection: Axis.vertical,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 15.0, 0.0, 15.0),
                        child: StreamBuilder<List<QuizzesRecord>>(
                          stream: queryQuizzesRecord(
                            queryBuilder: (quizzesRecord) => quizzesRecord
                                .where(
                                  'Emotion',
                                  isEqualTo: 'Happy',
                                )
                                .where(
                                  'StatusOfQuiz',
                                  isEqualTo: 'Approved',
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
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<QuizzesRecord> containerQuizzesRecordList =
                                snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final containerQuizzesRecord =
                                containerQuizzesRecordList.isNotEmpty
                                    ? containerQuizzesRecordList.first
                                    : null;

                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  Quiz1pageWidget.routeName,
                                  queryParameters: {
                                    'quizRef': serializeParam(
                                      containerQuizzesRecord,
                                      ParamType.Document,
                                    ),
                                    'index': serializeParam(
                                      1,
                                      ParamType.int,
                                    ),
                                    'score': serializeParam(
                                      2,
                                      ParamType.int,
                                    ),
                                    'status': serializeParam(
                                      'Happy',
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'quizRef': containerQuizzesRecord,
                                  },
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  image: DecorationImage(
                                    fit: BoxFit.fitWidth,
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    image: Image.asset(
                                      'assets/images/happy.jpg',
                                    ).image,
                                  ),
                                  borderRadius: BorderRadius.circular(18.0),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                    width: 3.0,
                                  ),
                                ),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: Text(
                                    'HAPPY',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 15.0, 15.0, 15.0),
                        child: StreamBuilder<List<QuizzesRecord>>(
                          stream: queryQuizzesRecord(
                            queryBuilder: (quizzesRecord) => quizzesRecord
                                .where(
                                  'Emotion',
                                  isEqualTo: 'Sad',
                                )
                                .where(
                                  'StatusOfQuiz',
                                  isEqualTo: 'Approved',
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
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<QuizzesRecord> containerQuizzesRecordList =
                                snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final containerQuizzesRecord =
                                containerQuizzesRecordList.isNotEmpty
                                    ? containerQuizzesRecordList.first
                                    : null;

                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  Quiz1pageWidget.routeName,
                                  queryParameters: {
                                    'quizRef': serializeParam(
                                      containerQuizzesRecord,
                                      ParamType.Document,
                                    ),
                                    'index': serializeParam(
                                      1,
                                      ParamType.int,
                                    ),
                                    'score': serializeParam(
                                      2,
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'quizRef': containerQuizzesRecord,
                                  },
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.asset(
                                      'assets/images/sad.jpg',
                                    ).image,
                                  ),
                                  borderRadius: BorderRadius.circular(18.0),
                                  border: Border.all(
                                    width: 3.0,
                                  ),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: Text(
                                    'SAD',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 0.0, 15.0),
                      child: StreamBuilder<List<QuizzesRecord>>(
                        stream: queryQuizzesRecord(
                          queryBuilder: (quizzesRecord) => quizzesRecord
                              .where(
                                'Emotion',
                                isEqualTo: 'Angry',
                              )
                              .where(
                                'StatusOfQuiz',
                                isEqualTo: 'Approved',
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
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<QuizzesRecord> containerQuizzesRecordList =
                              snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final containerQuizzesRecord =
                              containerQuizzesRecordList.isNotEmpty
                                  ? containerQuizzesRecordList.first
                                  : null;

                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                Quiz1pageWidget.routeName,
                                queryParameters: {
                                  'quizRef': serializeParam(
                                    containerQuizzesRecord,
                                    ParamType.Document,
                                  ),
                                  'index': serializeParam(
                                    1,
                                    ParamType.int,
                                  ),
                                  'score': serializeParam(
                                    2,
                                    ParamType.int,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'quizRef': containerQuizzesRecord,
                                },
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.asset(
                                    'assets/images/angry.jpg',
                                  ).image,
                                ),
                                borderRadius: BorderRadius.circular(18.0),
                                border: Border.all(
                                  width: 3.0,
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 1.0),
                                child: Text(
                                  'ANGRY',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 15.0, 15.0),
                      child: StreamBuilder<List<QuizzesRecord>>(
                        stream: queryQuizzesRecord(
                          queryBuilder: (quizzesRecord) => quizzesRecord
                              .where(
                                'Emotion',
                                isEqualTo: 'Peace',
                              )
                              .where(
                                'StatusOfQuiz',
                                isEqualTo: 'Approved',
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
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<QuizzesRecord> containerQuizzesRecordList =
                              snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final containerQuizzesRecord =
                              containerQuizzesRecordList.isNotEmpty
                                  ? containerQuizzesRecordList.first
                                  : null;

                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                Quiz1pageWidget.routeName,
                                queryParameters: {
                                  'quizRef': serializeParam(
                                    containerQuizzesRecord,
                                    ParamType.Document,
                                  ),
                                  'index': serializeParam(
                                    1,
                                    ParamType.int,
                                  ),
                                  'score': serializeParam(
                                    2,
                                    ParamType.int,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'quizRef': containerQuizzesRecord,
                                },
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.asset(
                                    'assets/images/peace.jpg',
                                  ).image,
                                ),
                                borderRadius: BorderRadius.circular(18.0),
                                border: Border.all(
                                  width: 3.0,
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 1.0),
                                child: Text(
                                  'PEACE',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ).animateOnPageLoad(
                    animationsMap['gridViewOnPageLoadAnimation']!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
