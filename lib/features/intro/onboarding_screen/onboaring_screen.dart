import 'package:untitled3/core/custom_widgets/submitBtn.dart';
import 'package:untitled3/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              children: [
                buildOnboardingPage1(),
                buildOnboardingPage2(),
                buildOnboardingPage3(),
              ],
            ),
          ),
          /* Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) => buildDot(index)),
          ),*/
        ],
      ),
    );
  }

  Widget buildDot(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.purple : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget buildOnboardingPage1() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 235.89,
              height: 222.73,
              child: Image.asset(
                "assets/images/group1.png",
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            const Text(
              "! اهلا بكم في عالم فرحتي للمسابقات ",
              style: TextStyle(
                  color: Color(0xff1B002D),
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding:
                  EdgeInsets.only(top: 10, left: 47, right: 27, bottom: 20),
              child: SizedBox(
                width: 312,
                height: 50,
                child: Text(
                  "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى",
                  style: TextStyle(
                      color: Color(0xff777777),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) => buildDot(index)),
            ),
            const SizedBox(
              height: 180,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 109,
                  height: 56,
                  decoration: BoxDecoration(
                      color: const Color(0xffF9F9F9),
                      borderRadius: BorderRadius.circular(12)),
                  child: IconButton(
                      onPressed: () {
                        Get.toNamed(Routes.register);
                      },
                      icon: const Text(
                        "تخطي",
                        style: TextStyle(color: Color(0xff777777)),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: SizedBox(
                      width: 225,
                      height: 56,
                      child: SubmitBtn(
                          onTap: () {
                            Get.to(buildOnboardingPage2());
                          },
                          text: "التالي")),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildOnboardingPage2() {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 235.89,
            height: 222.73,
            child: Image.asset(
              "assets/images/group2.png",
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          const Text(
            "هذا النص هو مثال لنص في نفس المساحة ",
            style: TextStyle(
                color: Color(0xff1B002D),
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10, left: 47, right: 27, bottom: 20),
            child: SizedBox(
              width: 342,
              height: 50,
              child: Text(
                "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى",
                style: TextStyle(
                    color: Color(0xff777777),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          /* Text(
              " تم توليد هذا النص من مولد النص العربى",
              style: TextStyle(
                  color: Color(0xff777777),
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),*/
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) => buildDot(index)),
          ),
          const SizedBox(
            height: 180,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 109,
                height: 56,
                decoration: BoxDecoration(
                    color: const Color(0xffF9F9F9),
                    borderRadius: BorderRadius.circular(12)),
                child: IconButton(
                    onPressed: () {
                      Get.toNamed(Routes.register);
                    },
                    icon: const Text(
                      "تخطي",
                      style: TextStyle(color: Color(0xff777777)),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: SizedBox(
                    width: 225,
                    height: 56,
                    child: SubmitBtn(
                        onTap: () {
                          Get.to(buildOnboardingPage3());
                        },
                        text: "التالي")),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildOnboardingPage3() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.register);
      },
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 235.89,
              height: 222.73,
              child: Image.asset(
                "assets/images/group3.png",
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 35),
            const Text(
              "هذا النص هو مثال لنص في نفس المساحة ",
              style: TextStyle(
                  color: Color(0xff1B002D),
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding:
                  EdgeInsets.only(top: 10, left: 40, right: 10, bottom: 20),
              child: SizedBox(
                width: 325,
                height: 45,
                child: Text(
                  "هذا النص هو مثال لنص يمكن أن يستبدل في نفس          المساحة، لقد تم توليد هذا النص من مولد النص العربى",
                  style: TextStyle(
                      color: Color(0xff777777),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            /* Text(
                " تم توليد هذا النص من مولد النص العربى",
                style: TextStyle(
                    color: Color(0xff777777),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),*/
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) => buildDot(index)),
            ),
            const SizedBox(
              height: 60,
            ),
            /*    Container(
              width: 109,
              height: 56,
              color: Colors.white,
              child: IconButton(
                  onPressed: () {
                    Get.toNamed(Routes.register);
                  },
                  icon: Text(
                    "تخطي",
                    style: TextStyle(color: Color(0xff777777)),
                  )),
            )*/
            const SizedBox(
              height: 160,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                    width: 340,
                    height: 56,
                    child: SubmitBtn(
                        onTap: () {
                          Get.toNamed(Routes.register);
                        },
                        text: "دخول التطبيق")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
