import 'package:get/get.dart';
import 'package:zakah_for_years/app/modules/calculat/calculate_model.dart';

class CalculatController extends GetxController {

  double total = 0;
  int inputYear=0;
  double inputMiqdar=0;
  int nissap=0;
  double dividerAmount=1;
  List<CalculateModel> calculate() {
    double miqdar, farida, zakah, totalzakah = 0;
    List<CalculateModel> calculationList = List.empty(growable: true);

    for (int i = 1; i <= inputYear; i++) {
      miqdar = inputMiqdar;
      farida = ((miqdar ~/ dividerAmount) * dividerAmount);
      zakah = farida / 40;
      inputMiqdar = inputMiqdar - zakah;
      totalzakah = totalzakah + zakah;
      calculationList.add(CalculateModel(
          year: i.toString(),
          miqdar: miqdar.toString(),
          farida: farida.toString(),
          zakah: zakah.toString()));
      if (inputMiqdar < nissap) {
        break;
      }
    }
    total = totalzakah;
    return calculationList;
  }


}
