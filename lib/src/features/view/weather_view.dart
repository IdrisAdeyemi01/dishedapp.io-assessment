import 'package:dished_assessment/src/content/constants/colors.dart';
import 'package:dished_assessment/src/content/utilities/screen_util.dart';
import 'package:dished_assessment/src/features/models/weather.dart';
import 'package:dished_assessment/src/features/view_model/weather_view_model.dart';
import 'package:dished_assessment/src/shared/widgets/datagrid_source.dart';
import 'package:dished_assessment/src/shared/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class WeatherView extends ConsumerStatefulWidget {
  const WeatherView({Key? key}) : super(key: key);

  @override
  ConsumerState<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends ConsumerState<WeatherView> {
  List<Weather> _weatherSource = [];
  late WeatherDataSource _weatherDataSource;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final weatherNotifier = ref.read(weatherViewModel);
    weatherNotifier.getCurrentWeatherDetails();

    // Future.delayed(const Duration(seconds: 1)).then((value) {
    //   weatherNotifier.getWeatherData();
    // });
    print(weatherNotifier.description);
    Future.delayed(const Duration(seconds: 5)).then((value) {
      _weatherSource = weatherNotifier.weatherSource;
      print(_weatherSource);
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    AsyncValue<Weather> weather = ref.watch(weatherFutureProvider);
    final weatherNotifier = ref.read(weatherViewModel);
    weatherNotifier.getScreenType(context);
    weatherNotifier.getCurrentWeatherDetails();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Your current location\'s weather data is as follows: ',
                    style: textTheme.headline4),
                const Spacing.bigHeight(),
                weather.when(
                  data: (weatherDetail) {
                    _weatherSource = weatherNotifier.weatherSource;
                    print(_weatherSource);
                    _weatherDataSource = WeatherDataSource(
                        gridRows: _weatherSource,
                        isSmallScreen: weatherNotifier.isSmallScreen);
                    return SfDataGrid(
                        gridLinesVisibility: GridLinesVisibility.both,
                        headerGridLinesVisibility: GridLinesVisibility.both,
                        headerRowHeight: 70,
                        rowHeight: 70,
                        defaultColumnWidth: weatherNotifier.isSmallScreen
                            ? ScreenUtil.screenWidth(context) / 2
                            : ScreenUtil.screenWidth(context) / 6,
                        source: _weatherDataSource,
                        columns: weatherNotifier.isSmallScreen
                            ? [
                                GridColumn(
                                  columnName: 'Date (mm/dd/yyyy)',
                                  label: Text(
                                    'Date (mm/dd/yyyy)',
                                    textAlign: TextAlign.left,
                                    style: textTheme.headline4!.copyWith(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                GridColumn(
                                  columnName: 'Temperature(F)',
                                  label: Text(
                                    'Temperature(F)',
                                    textAlign: TextAlign.left,
                                    style: textTheme.headline4!.copyWith(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ]
                            : [
                                GridColumn(
                                  columnName: 'Date (mm/dd/yyyy)',
                                  label: Text(
                                    'Date (mm/dd/yyyy)',
                                    style: textTheme.headline4!.copyWith(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                GridColumn(
                                  columnName: 'Temp(F)',
                                  label: Text(
                                    'Temp(F)',
                                    style: textTheme.headline4!.copyWith(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                GridColumn(
                                  columnName: 'Description',
                                  label: Text(
                                    'Description',
                                    style: textTheme.headline4!.copyWith(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                GridColumn(
                                  columnName: 'Main',
                                  label: Text(
                                    'Main',
                                    style: textTheme.headline4!.copyWith(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                GridColumn(
                                  columnName: 'Pressure',
                                  label: Text(
                                    'Pressure',
                                    style: textTheme.headline4!.copyWith(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                GridColumn(
                                  columnName: 'Humidity',
                                  label: Text(
                                    'Humidity',
                                    style: textTheme.headline4!.copyWith(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ]);
                  },
                  error: (err, stack) => const Text('An error occured'),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
