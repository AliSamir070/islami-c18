import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/resources/assets_manager.dart';
import '../../core/resources/colors_manager.dart';
import '../../model/intro_data_model.dart';
import '../home/screen/home_screen.dart';

class IntroBoardingScreen extends StatefulWidget {
  static const String routeName = "intro_screen";
  @override
  State<IntroBoardingScreen> createState() => _IntroBoardingScreenState();
}

class _IntroBoardingScreenState extends State<IntroBoardingScreen> {
  final controller = PageController();
  int currentPage = 0;
  bool isVisible=true;
  List<IntroDataModel> listIntro = [
    IntroDataModel(
      image: AssetsManager.introImage1,
      label: "Welcome To Islmi App",
      description: "",
    ),
    IntroDataModel(
      image: AssetsManager.introImage2,
      label: "Welcome To Islami",
      description: "We Are Very Excited To Have You In Our Community",
    ),
    IntroDataModel(
      image: AssetsManager.introImage3,
      label: "Reading the Quran",
      description: "Read, and your Lord is the Most Generous",
    ),
    IntroDataModel(
      image: AssetsManager.introImage4,
      label: "Bearish",
      description: "Praise the name of your Lord, the Most High",
    ),
    IntroDataModel(
      image: AssetsManager.introImage5,
      label: "Holy Quran Radio",
      description:
      "You can listen to the Holy Quran Radio through the application for free and easily",
    ),
  ];

  void nextPage() {
    if (currentPage < listIntro.length - 1) {
      currentPage++;
      controller.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    }
  }
  void prevPage() {
    if (currentPage > 0) {
      currentPage--;
      controller.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    if(currentPage==0){
      isVisible=false;
    }else{
      isVisible=true;
    }
    return Scaffold(
      backgroundColor: ColorsManager.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Align(
                alignment: AlignmentGeometry.center,
                child: Image.asset(
                  AssetsManager.islamiHeader,
                  width: screenWidth * 0.75,
                ),
              ),
              SizedBox(height: 25),
              Expanded(
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      listIntro[index].image,

                    );
                  },
                  controller: controller,
                  onPageChanged: (index) {
                    currentPage = index;
                  },
                  itemCount: listIntro.length,
                ),
              ),
              SizedBox(height: 10),
              Text(
                listIntro[currentPage].label,
                style: TextStyle(
                  color: ColorsManager.gold,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 40),
              Visibility(
                visible: isVisible,
                child: Text(
                  listIntro[currentPage].description,
                  style: TextStyle(
                    color: ColorsManager.gold,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: isVisible,
                    maintainAnimation: true,
                    maintainSize: true,
                    maintainState: true,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          prevPage();
                        });
                      },
                      child:Text(
                        "Back",
                        style: TextStyle(
                          color: ColorsManager.gold,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  SmoothPageIndicator(
                      controller: controller,
                      effect: ExpandingDotsEffect(
                          dotHeight: 7,
                          dotWidth: 7,
                          activeDotColor: ColorsManager.gold,
                          dotColor: Colors.white30
                      ),
                      count: 5),
                  (currentPage==listIntro.length-1)?
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
                    },
                    child: Text(
                      "Finish",
                      style: TextStyle(
                        color: ColorsManager.gold,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ):
                  TextButton(
                    onPressed: () {
                      setState(() {
                        nextPage();
                      });
                    },
                    child: Text(
                      "Next",
                      style: TextStyle(
                        color: ColorsManager.gold,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
