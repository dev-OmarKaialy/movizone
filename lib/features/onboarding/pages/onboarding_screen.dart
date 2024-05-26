import 'package:flutter/material.dart';
import 'package:movizone/core/widgets/custom_painter.dart';
import 'package:movizone/features/main/pages/main_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnbaordingData {
  final String image;
  final String title;
  final String subTitle;
  OnbaordingData({
    required this.image,
    required this.title,
    required this.subTitle,
  });
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final onBoardingList = [
    OnbaordingData(
        title: 'The biggest international and local film streaming',
        subTitle:
            ' MOVIZONE brings you the best of both international and local cinema. Start your cinematic journey with us today!',
        image: 'assets/onboarding0.png'),
    OnbaordingData(
        title: 'Offers ad-free viewing of high quality',
        subTitle:
            'Our service brings together your favorite series and films in one easy-to-use platform. Stream anytime, anywhere, and never miss an episode of the shows you love.',
        image: 'assets/onboarding1.png'),
    OnbaordingData(
        title: 'Our service brings together your favorite series',
        subTitle:
            'Experience your favorite movies without interruptions. With MOVIZON',
        image: 'assets/onboarding2.png')
  ];
  final PageController pageConrtoller = PageController(initialPage: 0);
  final ValueNotifier<int> index = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.topCenter,
      children: [
        PageView.builder(
          itemCount: onBoardingList.length,
          controller: pageConrtoller,
          onPageChanged: (value) {
            index.value = value;
          },
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                onBoardingList[index].image,
                fit: BoxFit.fitWidth,
                width: MediaQuery.sizeOf(context).width,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          height: MediaQuery.sizeOf(context).height * .45,
          width: MediaQuery.sizeOf(context).width,
          child: Container(
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xff171725),
              borderRadius: BorderRadius.circular(15),
            ),
            child: ValueListenableBuilder(
                valueListenable: index,
                builder: (context, value, _) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(onBoardingList[value].title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      Text(onBoardingList[value].subTitle,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SmoothPageIndicator(
                              controller: pageConrtoller,
                              effect: ExpandingDotsEffect(
                                dotWidth: 10,
                                dotHeight: 10,
                                spacing: 20,
                                activeDotColor: const Color(0xff12CDD9),
                                dotColor:
                                    const Color(0xff12CDD9).withOpacity(.5),
                              ),
                              count: onBoardingList.length),
                          CustomPaint(
                            painter: RPSCustomPainter(),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff12CDD9),
                                    fixedSize: const Size(70, 70),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                onPressed: () {
                                  if (pageConrtoller.page!.toInt() <
                                      onBoardingList.length - 1) {
                                    pageConrtoller.animateToPage(
                                        pageConrtoller.page!.toInt() + 1,
                                        duration: Durations.long4,
                                        curve: Curves.ease);
                                  } else {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MainScreen(),
                                      ),
                                    );
                                  }
                                },
                                child: const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xff1F1D2B),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  );
                }),
          ),
        )
      ],
    ));
  }
}
