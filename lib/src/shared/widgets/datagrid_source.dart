import 'package:dished_assessment/src/content/constants/colors.dart';
import 'package:dished_assessment/src/features/models/weather.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class WeatherDataSource extends DataGridSource {
  var date = DateFormat.yMd('en_US').format(DateTime.now());

  late List<DataGridRow> dataGridRows;

  WeatherDataSource(
      {required List<Weather> gridRows, required bool isSmallScreen}) {
    dataGridRows = gridRows.map((dataGridRow) {
      return DataGridRow(
        cells: isSmallScreen
            ? [
                DataGridCell(columnName: 'Date (mm/dd/yyyy)', value: date),
                DataGridCell(
                    columnName: 'Temperature(F)',
                    value: dataGridRow.temperature),
              ]
            : [
                DataGridCell(columnName: 'Date (mm/dd/yyyy)', value: date),
                DataGridCell(
                    columnName: 'Temperature(F)',
                    value: dataGridRow.temperature),
                DataGridCell(
                    columnName: 'Description', value: dataGridRow.description),
                DataGridCell(columnName: 'Main', value: dataGridRow.main),
                DataGridCell(
                    columnName: 'Pressure', value: dataGridRow.pressure),
                DataGridCell(
                    columnName: 'Humidity', value: dataGridRow.humidity),
              ],
      );
    }).toList();
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row
          .getCells()
          .map((cell) => Text(
                cell.value.toString(),
                textAlign: TextAlign.left,
                style: const TextStyle(color: AppColors.black),
              ))
          .toList(),
    );
  }
}
