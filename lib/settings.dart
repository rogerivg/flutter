import 'package:flutter/material.dart';
import 'package:states_redux/drawer_menu.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:states_redux/model/app_state.dart';
import 'package:states_redux/redux/FontSize.dart';
import 'package:states_redux/redux/Bold.dart';
import 'package:states_redux/redux/Italic.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Text('Settings'),
      ),
      drawer: DrawerMenu(),
      body: StoreConnector<AppState,AppState>(
        converter: (store)=>store.state,
        builder: (context,state){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  'Font Size: ${state.viewFontSize.toInt()}',
                  style: TextStyle(
                      fontSize: Theme.of(context).textTheme.headline.fontSize),
                ),
              ),
              Slider(
                  min: 0.5,
                  value: state.sliderFontSize,
                  onChanged: (newValue) {
                    StoreProvider.of<AppState>(context).dispatch(FontSize(newValue));
                    /*setState(() {
                      _value = newValue;
                    });
                    print(newValue);*/
                  }),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: <Widget>[
                    Checkbox(
                      value: state.bold,
                      onChanged: (newVal) {
                        StoreProvider.of<AppState>(context).dispatch(Bold(newVal));
                      },
                    ),
                    Text(
                      'Bold',
                      style: getStyle(state.bold, false),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: <Widget>[
                    Checkbox(
                        value: state.italic,
                        onChanged: (newVal) {
                          StoreProvider.of<AppState>(context).dispatch(Italic(newVal));
                        }),
                    Text(
                      'Italic',
                      style: getStyle(false, state.italic),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      ),
    );
  }

  TextStyle getStyle([bool isBold = false, bool isItalic = false]) {
    return TextStyle(
      fontSize: 18,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
    );
  }
}
