import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/ui/states/ride_pref_state.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier{
  final RidePrefState ridePrefState;

  HomeViewModel ({required this.ridePrefState}){
    ridePrefState.addListener(_onStateChanged);
  }
  
  void _onStateChanged(){
    notifyListeners();
  }

  RidePreference? get currPref => ridePrefState.currPref;

  List<RidePreference> get history => ridePrefState.preferenceHistory;

  void onRidePrefSelected(RidePreference selectedPreference) {
    ridePrefState.selectPreference(selectedPreference);
  }

  @override
  void dispose() {
    ridePrefState.removeListener(_onStateChanged);
    super.dispose();
  }
}