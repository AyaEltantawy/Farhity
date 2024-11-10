import 'package:untitled3/core/custom_widgets/race.dart';
import 'package:untitled3/features/nav_bar/home/snapchat/story/story_view.dart';
import 'package:untitled3/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'snapchat_logic.dart';
import 'story/models/data.dart';
import 'widgets/story.dart';

class SnapchatPage extends StatelessWidget {
  const SnapchatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<SnapchatLogic>();
    final state = Get.find<SnapchatLogic>().state;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        Container(
          width: 390,
          decoration: BoxDecoration(color: Color(0xff6D00B5)),
          height: 100,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, top: 30),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0xff6904AB)),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      )),
                ),
                SizedBox(
                  width: 170,
                ),
                Text(
                  "سناب شاب",
                  style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0xff6904AB)),
                  child: IconButton(
                      onPressed: () {
                        Get.toNamed(Routes.navbar);
                      },
                      icon: Icon(
                        Icons.arrow_forward_outlined,
                        color: Colors.white,
                      )),
                ),
              ],
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.story, arguments: stories);
                    },
                    child: StoryCustom(
                      assetUrl1: 'assets/images/instgramstory1.png',
                      assetUrl2: 'assets/images/Ellipse11.png',
                    )),
                SizedBox(
                  width: 10,
                ),
                StoryCustom(
                    assetUrl1: 'assets/images/storyinstgram2.png',
                    assetUrl2: 'assets/images/Ellipse11.png'),
                SizedBox(
                  width: 10,
                ),
                StoryCustom(
                  assetUrl1: 'assets/images/storysnapshat3.png',
                  assetUrl2: 'assets/images/Ellipse9.png',
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("المسابقات",
                  style: TextStyle(
                      color: Color(0xff1B002D),
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 800,
                child: ListView.builder(
                  itemCount: 2,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => RaceCustom(
                    text: "abo-ali",
                    assetUrl: "assets/images/Ellipse13.png",
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
    ));
  }
}
