import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 🔹 Form key provider (StateProvider is enough)
final formKeyProvider = StateProvider<GlobalKey<FormState>>((ref) {
  return GlobalKey<FormState>();
});

/// 🔹 Email provider
final emailProvider = StateProvider<String>((ref) => "");

/// 🔹 Password provider
final passwordProvider = StateProvider<String>((ref) => "");

/// 🔹 Password visibility toggle provider
final isShowPassProvider = StateProvider<bool>((ref) => false);
