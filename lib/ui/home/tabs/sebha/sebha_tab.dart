import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/colors_manager.dart';
class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter=0;
  int indexOfSebhaList=0;
  double angleRotation=0;
  List<String> sebhaList=["سبحان الله","الحمدالله","الله اكبر","لا اله الا الله"];
  void incrementCounter() {
    setState(() {
      counter++;
      angleRotation+=pi/2;
      if(counter>33){
        counter=0;
        if(indexOfSebhaList<sebhaList.length-1) {
          indexOfSebhaList++;
        }else{
          indexOfSebhaList=0;
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.sebhaBackground),
          fit: BoxFit.fill,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children:[
              Align(
                alignment: AlignmentGeometry.center,
                child: Image.asset(
                  AssetsManager.islamiHeader,
                  width: screenWidth * 0.75,
                ),
              ),
              SizedBox(height: 16,),
              Text("سَبِّحِ اسْمَ رَبِّكَ الأعلى ",style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w700,
                color: ColorsManager.white,
              ),),
              SizedBox(height: 16,),
              Image.asset(AssetsManager.sebhaHeader,height: 86,),

              InkWell(
                onTap:incrementCounter,
                child: Stack(
                    alignment: AlignmentGeometry.center,
                    children: [
                      Transform.rotate(
                          angle:angleRotation
                          , child: Image.asset(AssetsManager.sebhaBody)),
                      Column(
                        children: [
                          Text(sebhaList[indexOfSebhaList],style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w700,
                            color: ColorsManager.white,
                          ),),

                          Text(counter.toString(),style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w700,
                            color: ColorsManager.white,
                          ),)
                        ],
                      )
                    ]
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
