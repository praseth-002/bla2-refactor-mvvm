import 'package:blabla/data/repo/ride_pref/ride_pref_repo.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:flutter/material.dart';

class RidePrefState extends ChangeNotifier{
  final RidePrefRepo repo;
  RidePreference? currPref;
  List<RidePreference> preferenceHistory = [];
  RidePrefState ({required this.repo}){
    preferenceHistory = repo.preferenceHistory;
  }

  void selectPreference(RidePreference newPref) {
    if(newPref != currPref) {
      currPref = newPref;
      repo.addPreferenceToHistory(newPref);
      notifyListeners();
    }
  }
}