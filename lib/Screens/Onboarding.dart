import 'package:derm_aid/Screens/LogIn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    visitedInfo();
  }
  static int currentPage = 0;
  static PageController _pageController = PageController(initialPage: 0);

  final List<OnboardingItem> onboardingItems = [
    OnboardingItem(
      illustration: 'assets/images/onboard1.svg',
      title: 'Welcome to DermAid',
      text: 'The best dermatology app you have ever installed on your phone.',
    ),
    OnboardingItem(
      illustration: 'assets/images/onboard2.svg',
      title: 'AI powered Diagnosis & Online Consultation',
      text: 'You can be examined without leaving your home.',
    ),
    OnboardingItem(
      illustration: 'assets/images/onboard3.svg',
      title: 'Your skin health in good hands',
      text: 'Trusting our specialists is the best decision for your skin.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {
            currentPage = page;
          });
        },
        itemCount: onboardingItems.length,
        itemBuilder: (context, index) {
          return OnboardingItemWidget(onboardingItems[index]);
        },
      ),
    );
  }
}
class OnboardingItem {
  final String illustration;
  final String text;
  final String title;
  OnboardingItem({required this.illustration,required this.title, required this.text});
}
class OnboardingItemWidget extends StatelessWidget {
  final OnboardingItem item;
  OnboardingItemWidget(this.item);
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      color: Color.fromRGBO(74, 213, 205, 0.3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 40),
          SvgPicture.asset(
            item.illustration,
            height: size.height*0.5,
            width: double.infinity // Adjust as needed
          ),
          SizedBox(height: 20),
          Text(
            item.title,
            style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            item.text,
            style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal,color: Colors.black54),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40),
          InkWell(
            onTap: (){
              if (_OnboardingState.currentPage < 2) {
                _OnboardingState._pageController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.ease);
              } else {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LogIn()));
              }

            },
            child: Container(
              height: 70,
              decoration: BoxDecoration(shape:(_OnboardingState.currentPage!=2)? BoxShape.circle:BoxShape.rectangle,color: Color.fromRGBO(74, 213, 205, 1),),
              child: Center(
                child: (_OnboardingState.currentPage==2)?Text("Get Started",style: TextStyle(fontSize: 20,color: Colors.white),)
                    :Icon(Icons.arrow_forward_ios,size: 30,color: Colors.white,),
              ),
            ),
          ),

        ],
      ),
    );
  }
}

void visitedInfo() async{
  int viewed=1;
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref=await SharedPreferences.getInstance();
  await pref.setInt('onboard', viewed);
}
