import 'dart:convert';

import 'package:dished_assessment/src/repository/auth_repository/i_auth_repository.dart';
import 'package:dished_assessment/src/services/base/secret_variables.dart';
import 'package:dished_assessment/src/services/network_service/i_network_service.dart';
import 'package:dished_assessment/src/shared/shared_models/github_helper_models.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';

class AuthenticationRepository implements IAuthenticationRepo {
  final INetworkService networkService;
  AuthenticationRepository({required this.networkService});
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Future<auth.User> loginWithGithub({required String code}) async {
    final uri = networkService.getAPI.loginWithGithub;

    final response = await networkService.post(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      // }, inputJson: {
      //   "client_id": githubClientID,
      //   "client_secret": githubClientSecret,
      //   "code": code,
      // }
      inputJson: GitHubLoginRequest(
        clientId: githubClientID,
        clientSecret: githubClientSecret,
        code: code,
      ).toJson(),
    );

    GitHubLoginResponse loginResponse =
        GitHubLoginResponse.fromJson(json.decode(response.body));

    //FIREBASE SIGNIN
    final auth.AuthCredential credential = auth.GithubAuthProvider.credential(
        loginResponse.accessToken.toString());

    final auth.User? user =
        (await _firebaseAuth.signInWithCredential(credential)).user;
    return user!;
  }
}
