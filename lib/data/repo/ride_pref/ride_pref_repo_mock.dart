import 'package:blabla/data/repo/ride_pref/ride_pref_repo.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';

class RidePrefRepoMock implements RidePrefRepo{
  @override
  int get maxAllowedSeat => 8;

  @override
  List<RidePreference> preferenceHistory = [];

  @override
  void addPreferenceToHistory(RidePreference ridePref) {
    preferenceHistory.add(ridePref);
  }

  
}