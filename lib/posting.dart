import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Posting extends StatefulWidget {
  const Posting({super.key});

  @override
  State<Posting> createState() => _PostingChild();
}

class _PostingChild extends State<Posting> {
  final users = [
    {
      "name": "ikeda_friends",
      "image": "insta_back.jpeg",
      "posting": [
        "images/post/ikeda_friends/message_1.jpeg", // 結婚おめでとう！！に変更
        "images/post/ikeda_friends/message_2.jpeg",
        "images/post/ikeda_friends/message_3.jpeg",
        "images/post/ikeda_friends/message_4.jpeg",
      ],
      "message": "結婚おめでとう！！！",
    },
    {
      "name": "JunjiMan",
      "image": "icon_junji.jpeg",
      "posting": [
        "images/post/junjiMan/hi-mount.jpeg",
      ],
      "message": "俺が淳二だ",
    },
  ];
  int activeIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 600,
        child: SingleChildScrollView(
          child: Column(
            children: [for (var user in users) _PostingItem(user)],
          ),
        ));
  }

  // ignore: non_constant_identifier_names
  Widget _PostingItem(user) => Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        margin: const EdgeInsets.only(right: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            // ignore: prefer_interpolation_to_compose_strings
                            "images/topIcon/" + user["image"],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        user["name"],
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.list_outlined,
                  color: Colors.black,
                  size: 30,
                ),
              ],
            ),
          ),
          Column(
            children: [
              CarouselSlider.builder(
                options: CarouselOptions(
                  // height: 300,
                  initialPage: 1,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) => setState(() {
                    activeIndex = index;
                  }),
                ),
                itemCount: user["posting"].length,
                itemBuilder: (context, index, realIndex) {
                  final path = user["posting"][index];
                  return buildImage(path, index);
                },
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.favorite_border_outlined,
                  color: Colors.black,
                  size: 30,
                ),
                (user["posting"].length > 1)
                    ? buildIndicator(user["posting"])
                    : const SizedBox(),
                const SizedBox(
                  height: 10,
                  width: 30,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
            child: Column(
              children: [
                Row(
                  children: const [
                    Text('いいね！'),
                    Text(
                      '：taiki_furuyama',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '、他',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      user["name"],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(user["message"]),
                  ],
                )
              ],
            ),
          ),
        ],
      );

  Widget buildImage(path, index) => SizedBox(
        //画像間の隙間
        width: double.infinity,
        height: 350,
        child: Image.asset(
          path,
          fit: BoxFit.cover,
        ),
      );

  Widget buildIndicator(images) => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: images.length,
        //エフェクトはドキュメントを見た方がわかりやすい
        effect: const JumpingDotEffect(
            dotHeight: 5,
            dotWidth: 5,
            activeDotColor: Colors.green,
            dotColor: Colors.black12),
      );
}
