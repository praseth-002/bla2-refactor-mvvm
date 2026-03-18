import 'package:blabla/model/ride_pref/ride_pref.dart';

abstract class RidePrefRepo {
  int get maxAllowedSeat;
  List<RidePreference> get preferenceHistory;
  void addPreferenceToHistory(RidePreference ridePref);
}