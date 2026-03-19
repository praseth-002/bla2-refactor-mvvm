import 'package:blabla/data/repo/ride/ride_repo.dart';
import 'package:blabla/model/ride/ride.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/ui/states/ride_pref_state.dart';
import 'package:flutter/material.dart';

class RidesSelectionViewModel extends ChangeNotifier {
  final RidePrefState ridePrefState;
  final RideRepo rideRepo;

  RidesSelectionViewModel({
    required this.ridePrefState,
    required this.rideRepo,
  }) {
    ridePrefState.addListener(_onStateChanged);
  }

  void _onStateChanged() {
    notifyListeners();
  }

  void onFilterPressed() {}

  void onRideSelected(Ride ride) {}

  RidePreference? get currPref => ridePrefState.currPref;

  // List<Ride> get matchingRides => rideRepo.getRidesFor(currPref!);
  List<Ride> get matchingRides => currPref == null 
    ? [] 
    : rideRepo.getRidesFor(currPref!);

  void onPreferencePressed(RidePreference newPref) {
    ridePrefState.selectPreference(newPref);
  }

  @override
  void dispose() {
    ridePrefState.removeListener(_onStateChanged);
    super.dispose();
  }
}
