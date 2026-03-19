import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/ui/screens/rides_selection/view_model/rides_selection_view_model.dart';
import 'package:blabla/ui/screens/rides_selection/widgets/ride_preference_modal.dart';
import 'package:blabla/ui/screens/rides_selection/widgets/rides_selection_header.dart';
import 'package:blabla/ui/screens/rides_selection/widgets/rides_selection_tile.dart';
import 'package:blabla/ui/theme/theme.dart';
import 'package:blabla/utils/animations_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RidesSelectionContent extends StatelessWidget {
  const RidesSelectionContent({super.key});

  @override
  Widget build(BuildContext context) {
    final RidesSelectionViewModel vm = context.watch<RidesSelectionViewModel>();

    void onBackTap() {
      Navigator.pop(context);
    }

    void onPreferencePressed() async {
      RidePreference? newPref = await Navigator.of(context)
          .push<RidePreference>(
            AnimationUtils.createRightToLeftRoute(
              RidePreferenceModal(initialPreference: vm.currPref!),
            ),
          );
      if (newPref != null) {
        vm.onPreferencePressed(newPref);
      }
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: BlaSpacings.m,
          right: BlaSpacings.m,
          top: BlaSpacings.s,
        ),
        child: Column(
          children: [
            RideSelectionHeader(
              ridePreference: vm.currPref!,
              onBackPressed: onBackTap,
              onFilterPressed: vm.onFilterPressed,
              onPreferencePressed: onPreferencePressed,
            ),

            SizedBox(height: 100),

            Expanded(
              child: ListView.builder(
                itemCount: vm.matchingRides.length,
                itemBuilder: (ctx, index) => RideSelectionTile(
                  ride: vm.matchingRides[index],
                  onPressed: () => vm.onRideSelected(vm.matchingRides[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
