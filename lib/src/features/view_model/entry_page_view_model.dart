import 'dart:async';

import 'package:dished_assessment/src/content/constants/strings.dart';
import 'package:dished_assessment/src/content/utilities/base_change_notifiers.dart';
import 'package:dished_assessment/src/repository/auth_repository/i_auth_repository.dart';
import 'package:dished_assessment/src/services/base/secret_variables.dart'
    as secret_ariables;
import 'package:dished_assessment/src/services/navigation_service/i_navigation_service.dart';
import 'package:dished_assessment/src/services/snackbar_service/snackbar_service.dart';
import 'package:dished_assessment/src/shared/routing/routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';

class EntryViewModel extends BaseChangeNotifier {
  EntryViewModel(this.read);
  final Reader read;
  late StreamSubscription subs;

  Future<Object?>? navigateToHomeView() {
    read(navigationService).toNamed(Routes.homeView);
  }

  void onClickGitHubLoginButton() async {
    const String url = AppStrings.githubUri +
        '?client_id=' +
        secret_ariables.githubClientID +
        "&scope=public_repo%20read:user%20user:email";

    setState(state: AppState.loading);
    try {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } catch (error) {
      read(snackbarService).showSnackbar(error.toString());
    } finally {
      setState(state: AppState.idle);
    }
  }

  void initDeepLinkListener() async {
    subs = linkStream.listen((String? link) {
      _checkDeepLink(link);
    }, cancelOnError: true);
  }

  void _checkDeepLink(String? link) {
    if (link != null) {
      String code = link.substring(link.indexOf(RegExp('code=')) + 5);

      read(authenticationRepository)
          .loginWithGithub(code: code)
          .then((firebaseUser) {
        navigateToHomeView();
      }).catchError((e) {
        read(snackbarService).showSnackbar(e.toString());
      });
    }
  }

  void disposeDeepLinkListener() {
    subs.cancel();
    // subs = null;
  }
}

final entryViewModel = ChangeNotifierProvider(
  (ref) => EntryViewModel(ref.read),
);
