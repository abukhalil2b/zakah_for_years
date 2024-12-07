import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:zakah_for_years/app/data/shared/constant.dart';
import 'package:zakah_for_years/app/modules/calculat/views/result_calculate_view.dart';
import '../controllers/calculat_controller.dart';
import 'package:oktoast/oktoast.dart';

class CalculatView extends GetView<CalculatController> {
  CalculatView({required this.nissap, required this.dividerAmount});
  int nissap;
  double dividerAmount;
  int year = 0;
  double inputMiqdar = 0.0;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Get.put(CalculatController());
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 100.0,
                  color: kPrimaryColor,
                  child: Center(
                    child: Text(
                      'وزن الذهب يجب أن لايقل عن $nissap جرام',
                      textAlign: TextAlign.center,
                      style: kHeaderTextStyle,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Form(
                    key: _formKey,
                    child: Row(children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          style: TextStyle(fontSize: 18.0),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp("[0-9.]")),
                            LengthLimitingTextInputFormatter(6),
                          ],
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(5.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            labelText: 'وزن الذهب',
                          ),
                          validator: (inputValue) {
                            double? value = double.tryParse(inputValue!);
                            if (inputValue.isEmpty ||
                                value == null ||
                                value < nissap) {
                              return 'ادخل قيمة صحيحة';
                            }
                            return null;
                          },
                          onChanged: (inputValue) {
                            if (inputValue != '')
                              inputMiqdar = double.parse(inputValue);
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: TextFormField(
                          style: TextStyle(fontSize: 18.0),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(2),
                          ],
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(5.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            labelText: 'السنوات',
                          ),
                          validator: (inputValue) {
                            return inputValue!.isEmpty
                                ? 'ادخل قيمة صحيحة'
                                : null;
                          },
                          onChanged: (inputValue) {
                            if (inputValue != '')
                              year = int.tryParse(inputValue)!;
                          },
                        ),
                      )
                    ]),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  width: double.infinity,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(width: 1, color: kPrimaryColor),
                    ),
                    onPressed: () {

                      if (_formKey.currentState!.validate()) {
                        Get.to(() => ResultCalculateView(
                              dividerAmount: dividerAmount,
                              nissap: nissap,
                              inputMiqdar: inputMiqdar,
                              inputYear: year,
                            ));
                      } else {
                        showToast("تأكد من ادخال بيانات صحيحة");
                      }
                    },
                    child: Text(
                      'احسب',
                      style: kBottonTextStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
