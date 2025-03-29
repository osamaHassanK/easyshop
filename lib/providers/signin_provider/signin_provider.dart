

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 🔹 Form key provider (StateProvider is enough)
final signInformKeyProvider = StateProvider<GlobalKey<FormState>>((ref) {
  return GlobalKey<FormState>();
});

// Providers for form fields
final firstNameProvider = StateProvider<String>((ref) => "");
final lastNameProvider = StateProvider<String>((ref) => "");
final emailProvider = StateProvider<String>((ref) => "");
final passwordProvider = StateProvider<String>((ref) => "");

/// 🔹 Password visibility toggle provider
final isShowPassProvider = StateProvider<bool>((ref) => false);