import 'package:dished_assessment/src/content/constants/colors.dart';
import 'package:dished_assessment/src/content/constants/strings.dart';
import 'package:dished_assessment/src/content/utilities/base_change_notifiers.dart';
import 'package:dished_assessment/src/features/view_model/home_view_model.dart';
import 'package:dished_assessment/src/shared/widgets/app_elevated_button.dart';
import 'package:dished_assessment/src/shared/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeView extends HookWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    var latitude = useState(0.0);
    var longitude = useState(0.0);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.welcome,
                  style: textTheme.headline3,
                ),
                const Spacing.smallHeight(),
                Text(
                  AppStrings.name,
                  style: textTheme.headline1,
                ),
                const Spacing.largeHeight(),
                Text(
                  AppStrings.yourGithubPageURL,
                  style: textTheme.headline3,
                ),
                const Spacing.smallHeight(),
                Text(
                  AppStrings.githubURL,
                  style: textTheme.headline3!
                      .copyWith(color: AppColors.wooDogTextColor),
                ),
                const Spacing.bigHeight(),
                Text(
                  AppStrings.checkLocationLabel,
                  style: textTheme.headline4,
                ),
                const Spacing.largeHeight(),
                Consumer(
                  builder: (_, ref, __) {
                    final signinProvider = ref.watch(homeViewModel);
                    return Column(
                      children: [
                        AppElevatedButton(
                          isLoading: signinProvider.state.isLoading,
                          onPressed: () async {
                            var currentPosition =
                                await signinProvider.checkCurrentLocation();
                            latitude.value = currentPosition[0];
                            longitude.value = currentPosition[1];
                          },
                          label: AppStrings.checkLocation,
                        ),
                        const Spacing.bigHeight(),
                        AppElevatedButton(
                          isLoading: signinProvider.state.isLoading,
                          onPressed: () {
                            signinProvider.navigateToWeatherView();
                          },
                          label: AppStrings.moveToWeather,
                        ),
                      ],
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
