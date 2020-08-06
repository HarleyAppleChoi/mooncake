import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mooncake/ui/ui.dart';
import 'package:bloc_test/bloc_test.dart';

// mocks
class MockHomeBloc extends MockBloc<HomeEvent, HomeState> implements HomeBloc {}

class MockNavigatorBloc extends MockBloc<NavigatorEvent, NavigatorState>
    implements NavigatorBloc {}

/// widget wrapper to make testable
Widget makeTestableWidget({Widget child}) {
  return MediaQuery(
    data: MediaQueryData(),
    child: MaterialApp(
        localizationsDelegates: [
          PostsLocalizations.delegateTest,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en'), // English, no country code
        ],
        home: Scaffold(
          body: child,
        )),
  );
}