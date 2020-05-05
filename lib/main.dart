import 'package:flutter/material.dart';
import 'package:states_redux/about.dart';
import 'package:states_redux/home.dart';
import 'package:states_redux/prueba.dart';
import 'package:states_redux/redux/reducers.dart';
import 'package:states_redux/settings.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:states_redux/model/app_state.dart';
import 'package:states_redux/redux/FontSize.dart';
import 'package:states_redux/redux/Bold.dart';
import 'package:states_redux/redux/Italic.dart';

void main() {
  final _initialState = AppState(sliderFontSize: 0.5);
  final Store<AppState> _store = Store<AppState>(reducer,initialState: _initialState);
  runApp(MyApp(store:_store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  MyApp({this.store});
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => Home(),
          '/about': (context) => About(),
          '/settings': (context) => Settings(),
          '/prueba': (context) => Prueba(),
        },
      ),
    );
  }
}
