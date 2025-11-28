import 'package:flutter/material.dart';
import 'package:in_app_update/in_app_update.dart';

class UpdateChecker {
  static Future<void> checkForUpdate(BuildContext context) async {
    try {
      final info = await InAppUpdate.checkForUpdate();

      if (info.updateAvailability == UpdateAvailability.updateAvailable) {
        // Flexible update (can continue using the app)
        await InAppUpdate.startFlexibleUpdate().then((_) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Update downloaded. Restarting...')),
          );
        });

        // Complete update
        await InAppUpdate.completeFlexibleUpdate();
      }
    } catch (e) {
      print("Update error: $e");
    }
  }
}
