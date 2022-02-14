import 'dart:async';

import 'package:dished_assessment/src/content/constants/colors.dart';
import 'package:dished_assessment/src/content/constants/strings.dart';
import 'package:dished_assessment/src/features/view_model/entry_page_view_model.dart';
import 'package:dished_assessment/src/content/utilities/base_change_notifiers.dart';
import 'package:dished_assessment/src/shared/widgets/app_elevated_button.dart';
import 'package:dished_assessment/src/shared/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EntryView extends ConsumerStatefulWidget {
  const EntryView({Key? key}) : super(key: key);

  @override
  ConsumerState<EntryView> createState() => _EntryViewState();
}

class _EntryViewState extends ConsumerState<EntryView> {
  late StreamSubscription subs;
  @override
  void initState() {
    final value = ref.read(entryViewModel);
    value.initDeepLinkListener();
    super.initState();
  }

  @override
  void dispose() {
    final value = ref.read(entryViewModel);
    value.disposeDeepLinkListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.helloWorld,
                    style: textTheme.headline1,
                  ),
                  const Spacing.bigHeight(),
                  Text(
                    AppStrings.introLabel,
                    style: textTheme.headline4,
                  ),
                  const Spacing.height(100),
                  Consumer(
                    builder: (_, watch, __) {
                      final signinProvider = ref.watch(entryViewModel);
                      return AppElevatedButton(
                        isLoading: signinProvider.state.isLoading,
                        onPressed: () {
                          // signinProvider.onClickGitHubLoginButton();
                          signinProvider.navigateToHomeView();
                        },
                        label: AppStrings.login,
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
