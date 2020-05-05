import 'package:states_redux/model/app_state.dart';
import 'package:states_redux/redux/FontSize.dart';
import 'package:states_redux/redux/Italic.dart';
import 'package:states_redux/redux/Bold.dart';

AppState reducer(AppState prevState, dynamic action ){
  AppState newState = AppState.fromAppState(prevState);
  if(action is FontSize){
    newState.sliderFontSize = action.payload;
  }
  else if(action is Bold){
    newState.bold = action.payload;
  }
  else if(action is Italic){
    newState.italic = action.payload;
  }
  return newState;
}

