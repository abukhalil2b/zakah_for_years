import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zakah_for_years/app/data/shared/constant.dart';
import 'package:zakah_for_years/app/data/shared/widgets.dart';
import 'package:zakah_for_years/app/modules/calculat/views/calculat_view.dart';

class HomeView extends StatelessWidget {
  // colorFilter: ColorFilter.mode(
  // Colors.white.withOpacity(0.6), BlendMode.screen)
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: IndexPage()),
    );
  }
}

class IndexPage extends StatelessWidget {
  var _url = 'https://oman.gold-price-today.com/';
  void _launchURL() async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Color(0xffe79686),
            image: DecorationImage(
              image: AssetImage('assets/img/btn_bg.png'),
            ),
          ),
          width: double.infinity,
          height: 100.0,
          child: Center(
            child: Text(
              'حساب زكاة السنوات الماضية للذهب والفضة',
              textAlign: TextAlign.center,
              style: kHeaderTextStyle,
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: ReuseCard(
                  onPress: () {
                    Get.to(()=>CalculatView(dividerAmount: 17,nissap: 85,));
                  },
                  cardChild: IconContent(
                      icon: Icons.calculate,
                      lable: 'حساب الزكاة على قول المقدار 85 جرام'),
                  colour: kActiveCardColour,
                ),
              ),
              Expanded(
                child: ReuseCard(
                  onPress: () {
                    Get.to(()=>CalculatView(dividerAmount: 16,nissap: 80,));
                  },
                  cardChild: IconContent(
                      icon: Icons.calculate,
                      lable: 'حساب الزكاة على قول المقدار 80 جرام'),
                  colour: kActiveCardColour,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ReuseCard(
            onPress: () {
              Get.to(()=>CalculatView(dividerAmount: 28,nissap: 595,));
            },
            cardChild:
                IconContent(icon: Icons.calculate, lable: 'حساب زكاة الفضة'),
            colour: kActiveCardColour,
          ),
        ),
        Expanded(
          child: ReuseCard(
            onPress: _launchURL,
            cardChild:
                IconContent(icon: Icons.info, lable: 'معرفة سعر الذهب اليوم'),
            colour: kActiveCardColour,
          ),
        ),
      ],
    );
  }
}
