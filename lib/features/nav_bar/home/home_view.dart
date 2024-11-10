import 'package:untitled3/core/custom_widgets/platforms.dart';
import 'package:untitled3/core/custom_widgets/race.dart';
import 'package:untitled3/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_logic.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<HomeLogic>();
    final state = Get.find<HomeLogic>().state;
    final items = <Widget>[
      const Icon(Icons.home, size: 30),
      const Icon(Icons.timer, size: 30),
      const Icon(Icons.card_giftcard, size: 30),
      const Icon(Icons.person, size: 30),
    ];
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Container(
            width: 390,
            height: 260,
            decoration: const BoxDecoration(color: Color(0xff6D00B5)),
            child: Column(children: [
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color(0xff6904AB)),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.search,
                            color: Colors.white,
                          )),
                    ),
                    const SizedBox(
                      width: 170,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "اهلا بك",
                          style: TextStyle(
                              color: Color(0xffBAC0CA),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Mohamed",
                          style: TextStyle(
                              color: Color(0xffFFFFFF),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.followerProfile);
                      },
                      child: const CircleAvatar(
                        backgroundImage: AssetImage("assets/images/person.png"),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 320,
                height: 138,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: const Color(0xff000000),
                    ),
                    borderRadius: BorderRadius.circular(12)),
                child: Image.asset("assets/images/Maskgroup.png",
                    fit: BoxFit.fill),
              )
            ])),

        // Banner Section
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'منصات المسابقات',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xff1B002D)),
          ),
        ),
        const SizedBox(height: 20),

        /*SizedBox(
              child: GridView(
                padding: EdgeInsets.all(16),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                children: [
                  Column(
                    children: [
                      Container(
                        width: 109,height:110,decoration:BoxDecoration(color:Color(0xffC30000),borderRadius: BorderRadius.circular(20)),
                        child:GestureDetector(child: Container(width:56,height:56,child: Image.asset("assets/images/hugeicons_youtube.png",))) ,)
                      ,SizedBox(height:10,)
                      ,Text("يوتيوب",style: TextStyle(color:Color(0xff1B002D),fontSize: 14,fontWeight: FontWeight.w400),)
                    ],
                  ),
                  Container(
                    width: 109,height:110,decoration:BoxDecoration(color:Color(0xffFE2B54),borderRadius: BorderRadius.circular(20)),
                    child:GestureDetector(child: Image.asset("assets/images/Vector.png",)) ,),
                  platformIcon(Icons.snapchat, 'سناب شاب'),
                  SizedBox(height: 40,),
                  platformIcon(Icons.storefront, 'المتاجر الإلكترونية'),
                  platformIcon(Icons.camera_alt, 'انستقرام'),
                  platformIcon(Icons.clear_all, 'منصة اكس'),
                ],
              ),
            ),*/
        SizedBox(
            width: double.infinity,
            height: 300,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PlatformsCustom(
                        text: "يوتيوب",
                        assetUrl: "assets/images/hugeicons_youtube.png",
                        color: const Color(0xC3000024)),
                    Column(
                      children: [
                        Container(
                          width: 109,
                          height: 110,
                          decoration: BoxDecoration(
                              color: const Color(0xFE2B5424),
                              borderRadius: BorderRadius.circular(20)),
                          child: GestureDetector(
                              child: Image.asset(
                            "assets/images/Vector.png",
                          )),
                        ),
                        const Text(
                          "تيك توك",
                          style: TextStyle(
                              color: Color(0xff1B002D),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                            child: Container(
                              width: 109,
                              height: 110,
                              decoration: BoxDecoration(
                                  color: const Color(0xFCFB0424),
                                  borderRadius: BorderRadius.circular(20)),
                              child: GestureDetector(
                                  child: Image.asset(
                                "assets/images/Vector4.png",
                              )),
                            ),
                            onTap: () {
                              Get.toNamed(Routes.snapchat);
                            }),
                        const Text(
                          "سناب شاب",
                          style: TextStyle(
                              color: Color(0xff1B002D),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 109,
                            height: 110,
                            decoration: BoxDecoration(
                                color: const Color(0x2600440A),
                                borderRadius: BorderRadius.circular(20)),
                            child: GestureDetector(
                                child: Container(
                                    width: 56,
                                    height: 56,
                                    child: Image.asset(
                                      "assets/images/mingcute_store-2-line.png",
                                    ))),
                          ),
                          const Text(
                            "المتاجر الالكترونية",
                            style: TextStyle(
                                color: Color(0xff1B002D),
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: 109,
                            height: 110,
                            decoration: BoxDecoration(
                                color: const Color(0x9D32EB24),
                                borderRadius: BorderRadius.circular(20)),
                            child: GestureDetector(
                                child: Image.asset(
                              "assets/images/Vector3.png",
                            )),
                          ),
                          const Text(
                            "انستقرام",
                            style: TextStyle(
                                color: Color(0xff1B002D),
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: 109,
                            height: 110,
                            decoration: BoxDecoration(
                                color: const Color(0x0F122C24),
                                borderRadius: BorderRadius.circular(20)),
                            child: GestureDetector(
                                child: Image.asset(
                              "assets/images/Vector7.png",
                            )),
                          ),
                          const Text(
                            "منصة اكس",
                            style: TextStyle(
                                color: Color(0xff1B002D),
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      )
                    ]),
              )
            ])),
        Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text("عرض الكل",
                      style: TextStyle(
                          color: Color(0xff329BEE),
                          fontSize: 12,
                          fontWeight: FontWeight.w500)),
                ),
                const Text(
                  "اشهر المسابقات",
                  style: TextStyle(
                      color: Color(0xff1B002D),
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
              ],
            ),
          ),

          SizedBox(
              height: 600,
              child: ListView.separated(
                  itemCount: 2,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: RaceCustom(
                          text: "abo-ali",
                          assetUrl: "assets/images/Ellipse13.png",
                        ),
                      ),
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      width: 10,
                    );
                  })),
          // Popular Contests Section
          /*  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'اشهر المسابقات',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),*/
          //  contestCard(
          //     'شاركنا نجاحك وستختار ٣ فائزين بالجائزة الكبرى', 'abo-ali', '4'),
          //  contestCard('شاركنا تجربتك واربح', 'mohamed', '2'),
        ]),
      ])),

      // Bottom Navigation Bar
      /* bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFF6D00B5),
        unselectedItemColor: Color(0xffBAC0CA),
        items: [

          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'الاشعارات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_esports),
            label: 'المسابقات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive),
            label: 'الارشيف',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'الرئيسية',
          ),
        ],
      ),*/
    );
  }
}

// Helper for creating platform icons
Widget platformIcon(IconData iconData, String label) {
  return Column(
    children: [
      CircleAvatar(
        radius: 30,
        backgroundColor: Colors.grey[200],
        child: Icon(iconData, size: 30, color: Colors.black),
      ),
      const SizedBox(height: 8),
      Text(label),
    ],
  );
}

// Helper for creating contest cards
Widget contestCard(String text, String username, String daysAgo) {
  return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: const ListTile(
              leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://example.com/user_image.jpg')))));
}
