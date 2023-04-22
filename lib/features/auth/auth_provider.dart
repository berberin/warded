
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'infrastructure/repositories/auth_repository.dart';

part 'auth_provider.g.dart';

///
/// Infrastructure dependencies
///

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  final authClient = ref.watch(supabaseClientProvider).auth;
  final prefs = ref.read(sharedPreferencesProvider).valueOrNull!;
  return AuthRepository(
    AuthTokenLocalDataSource(prefs),
    authClient,
  );
}

///
/// Application dependencies
///

/// Provides a [ValueNotifier] to the app router to redirect on auth state change
final authStateListenable = ValueNotifier<bool>(false);


///
/// Presentation dependencies
///
