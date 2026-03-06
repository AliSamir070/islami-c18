import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c18/core/resources/assets_manager.dart';
import 'package:islami_c18/core/resources/colors_manager.dart';
import 'package:islami_c18/model/hadeth_model.dart';
import 'package:islami_c18/ui/hadeth_details/screen/hadeth_details_screen.dart';

class HadethItem extends StatefulWidget {
  bool isSelected;
  int index;
  HadethItem({super.key,required this.isSelected,required this.index});

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readHadethFile();
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, HadethDetailsScreen.routeName,arguments: hadethData);
      },
      child: Container(
        margin: EdgeInsetsGeometry.symmetric(
          horizontal: 8,
          vertical:widget.isSelected?0:20
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorsManager.gold
        ),
        child: Column(
          children: [
            Expanded(
              child: hadethData==null
                  ?Center(child: CircularProgressIndicator(
                color: ColorsManager.black,
              ),)
                  :Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(AssetsManager.leftCornerHadeth),
                            Image.asset(AssetsManager.rightCornerHadeth),
                          ],
                        ),
                        SizedBox(
                          width: screenWidth*0.5,
                          child: Text(hadethData!.title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: ColorsManager.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 20
                            ),),
                        )
                      ],
                    ),
                    Expanded(
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Image.asset(AssetsManager.hadethCardBack),
                            Text(hadethData!.content,
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700,height: 1.5),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Image.asset(AssetsManager.mosqueHadeth,
              width: double.infinity,
              fit: BoxFit.fill,)
          ],
        ),
      ),
    );
  }

  HadethModel? hadethData;

  readHadethFile()async{
    String hadeth = await rootBundle.loadString("assets/Hadeeth/h${widget.index+1}.txt");
    List<String> hadethLines = hadeth.split("\n");
    String title = hadethLines[0];
    hadethLines.removeAt(0);
    String content = hadethLines.join(" ");
    hadethData = HadethModel(title: title, content: content,hadethNumber: widget.index+1);
    setState(() {

    });
  }
}
