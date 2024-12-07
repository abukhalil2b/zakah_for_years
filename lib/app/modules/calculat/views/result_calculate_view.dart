import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zakah_for_years/app/data/shared/constant.dart';
import 'package:zakah_for_years/app/modules/calculat/controllers/calculat_controller.dart';
import '../calculate_model.dart';
import 'package:oktoast/oktoast.dart';
class ResultCalculateView extends GetView<CalculatController> {
  var inputYear, inputMiqdar, nissap, dividerAmount;
  ResultCalculateView(
      {required this.inputYear,
      required this.inputMiqdar,
      required this.nissap,
      required this.dividerAmount});

  @override
  Widget build(BuildContext context) {
    controller.inputYear = inputYear;
    controller.inputMiqdar = inputMiqdar;
    controller.nissap = nissap;
    controller.dividerAmount = dividerAmount;
    List<CalculateModel> results = controller.calculate();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: DataTable(
                    columns: [
                      DataColumn(
                          numeric: true,
                          label: Text('السنة',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold))),
                      DataColumn(
                          numeric: true,
                          label: Text('المقدار',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold))),
                      DataColumn(
                          numeric: true,
                          label: Text('الفريضة',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold))),
                      DataColumn(
                          numeric: true,
                          label: Text('الزكاة',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold))),
                    ],
                    rows: results == null
                        ? [
                            DataRow(cells: [
                              DataCell(Text('')),
                              DataCell(Text('')),
                              DataCell(Text('')),
                              DataCell(Text('')),
                            ])
                          ]
                        : results
                            .map(
                              (data) => DataRow(cells: [
                                DataCell(Text('${data.year}')),
                                DataCell(
                                    Container(
                                      width: 60.0,
                                      child: Text(
                                        '${data.miqdar}',
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ), onTap: () {
                                  print('${data.miqdar}');
                                  showSnackBar(data.miqdar);
                                }),
                                DataCell(Text('${data.farida}')),
                                DataCell(Text('${data.zakah}')),
                              ]),
                            )
                            .toList(),
                  ),
                ),
              ),
              Container(
                color: kActiveCardColour,
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'المجموع',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: kLightGreyColor,
                        fontFamily: 'Helve',
                      ),
                    ),
                    Text(
                      '${controller.total}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          color: kLightGreyColor,
                          fontFamily: 'Helve',
                          fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.replay,
                          color: kLightGreyColor,
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showSnackBar(String miqdar) {
    showToast("$miqdar");
  }
}
