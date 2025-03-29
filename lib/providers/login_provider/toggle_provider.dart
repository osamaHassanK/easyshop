import 'package:flutter_riverpod/flutter_riverpod.dart';

// State provider for managing selected tab index
final tabIndexProvider = StateProvider<int>((ref) => 0);
