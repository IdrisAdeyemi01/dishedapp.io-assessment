import 'package:dished_assessment/src/repository/auth_repository/authentication_repository.dart';
import 'package:dished_assessment/src/services/network_service/i_network_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class IAuthenticationRepo {
  // Future<void> signup({
  //   required String firstName,
  //   required String lastName,
  //   required String email,
  //   required String password,
  // });

  // Future<void> signin({
  //   required String email,
  //   required String password,
  // });

  Future<User> loginWithGithub({required String code});
}

final authenticationRepository = Provider<IAuthenticationRepo>(
  (ref) => AuthenticationRepository(
    networkService: ref.read(networkService),
  ),
);
