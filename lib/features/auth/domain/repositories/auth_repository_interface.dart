
import 'package:fpdart/fpdart.dart';

///
abstract class AuthRepositoryInterface {
  /// Sign in with Google
  Future<Either<Failure, bool>> signInWithGoogle();

  /// Sign out
  Future<Either<Failure, bool>> signOut();

  /// Listen to auth changes
  void authStateChange(
    void Function(UserEntity? userEntity) callback,
  );

  /// Store token
  Future<void> setSession(String token);

  /// restore session from token
  Future<Either<Failure, UserEntity>> restoreSession();
}
