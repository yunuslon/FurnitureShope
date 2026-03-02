import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStateProvider with ChangeNotifier {
  static const String _hasSeenOnBoardingKey = 'has_seen_onboarding';
  bool _hasSeenOnBoarding = false;
  bool _isInitialized = false;

  bool get hasSeenOnboarding => _hasSeenOnBoarding;
  bool get isInitialized => _isInitialized;

  Future<void> initializeApp() async {
    if (_isInitialized) return;

    final prefs = await SharedPreferences.getInstance();
    _hasSeenOnBoarding = prefs.getBool(_hasSeenOnBoardingKey) ?? false;
    _isInitialized = true;
    notifyListeners();
  }

  Future<void> setOnboardingComplate() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_hasSeenOnBoardingKey, true);
    _hasSeenOnBoarding = true;
    notifyListeners();
  }
}
