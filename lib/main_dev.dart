import 'package:blabla/data/repo/location/location_repo.dart';
import 'package:blabla/data/repo/location/location_repo_mock.dart';
import 'package:blabla/data/repo/ride/ride_repo.dart';
import 'package:blabla/data/repo/ride/ride_repo_mock.dart';
import 'package:blabla/data/repo/ride_pref/ride_pref_repo.dart';
import 'package:blabla/data/repo/ride_pref/ride_pref_repo_mock.dart';
import 'package:blabla/main_common.dart';
import 'package:blabla/ui/states/ride_pref_state.dart';
import 'package:provider/provider.dart';

List<InheritedProvider> get devProviders {
  return [
    Provider<LocationRepo>(create: (_) => LocationRepoMock()),
    Provider<RideRepo>(create: (_) => RideRepoMock()),
    Provider<RidePrefRepo>(create: (_) => RidePrefRepoMock()),
    ChangeNotifierProvider<RidePrefState>(create: (context) => RidePrefState(repo: context.read<RidePrefRepo>()))
  ];
}

void main() {
  mainCommon(devProviders);
}