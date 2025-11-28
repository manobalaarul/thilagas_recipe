import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dynamic_icon_plus/flutter_dynamic_icon_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../core/theme/bloc/theme_bloc.dart';

class LightDarkWid extends StatefulWidget {
  const LightDarkWid({super.key});

  @override
  State<LightDarkWid> createState() => _LightDarkWidState();
}

class _LightDarkWidState extends State<LightDarkWid> {
  bool _isSupported = true;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    // _checkSupport();
  }

  Future<void> _checkSupport() async {
    try {
      bool supported = await FlutterDynamicIconPlus.supportsAlternateIcons;
      setState(() {
        _isSupported = supported;
      });
    } catch (e) {
      print('Error checking support: $e');
    }
  }

  Future<void> _changeIcon(String iconName, String displayName) async {
    try {
      print("hai");
      if (_isSupported) {
        setState(() {
          _loading = true;
        });

        await FlutterDynamicIconPlus.setAlternateIconName(
          iconName: iconName,
          blacklistBrands: ['Redmi'],
          blacklistManufactures: ['Xiaomi'],
          blacklistModels: ['Redmi 200A'],
        );

        setState(() {
          _loading = false;
        });
        Fluttertoast.showToast(msg: "Icon changed to $displayName");
      } else {
        _showSnackBar('Dynamic icons not supported on this device');
      }
    } catch (e) {
      setState(() {
        _loading = false;
      });
      _showSnackBar('Error changing icon: $e');
      print('Error changing icon: $e');
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: Duration(seconds: 3)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeState = context.watch<ThemeBloc>().state;
    final isDarkMode = themeState.themeMode == ThemeMode.dark;

    return InkWell(
      onTap: () async {
        context.read<ThemeBloc>().add(ToggleThemeEvent());

        await Future.delayed(Duration(milliseconds: 100));

        String iconName = isDarkMode
            ? "com.thilagas.recipe_app.DefaultIcon"
            : "com.thilagas.recipe_app.DarkIcon";
        String displayName = isDarkMode ? "Light" : "Dark";

        await _changeIcon(iconName, displayName);
      },
      child: _loading
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            )
          : Icon(
              isDarkMode ? Icons.dark_mode : Icons.light_mode,
              size: 28,
            ),
    );
  }
}
