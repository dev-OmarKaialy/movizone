import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var pageController = PageController(
    initialPage: 2,
    viewportFraction: .8,
  );

  @override
  void initState() {
    Timer.periodic(Durations.extralong4 * 5, (timer) {
      pageController.animateToPage(pageController.page!.toInt() + 1,
          duration: Durations.long1, curve: Curves.easeIn);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15, top: 25),
            child: Text(
              'What do you want to watch?',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 175,
            child: Column(
              children: [
                Expanded(
                    child: PageView.builder(
                        padEnds: true,
                        controller: pageController,
                        itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    Image.asset(
                                      'assets/movie2.png',
                                      fit: BoxFit.fill,
                                      width:
                                          MediaQuery.sizeOf(context).width * .8,
                                    ),
                                    const Positioned(
                                      bottom: 40,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                            'Black-Panther Wakand Forever',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ))),
                SmoothPageIndicator(
                  controller: pageController,
                  count: 5,
                  effect: ExpandingDotsEffect(
                    dotWidth: 10,
                    dotHeight: 10,
                    spacing: 20,
                    activeDotColor: const Color(0xff12CDD9),
                    dotColor: const Color(0xff12CDD9).withOpacity(.5),
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15, bottom: 10, top: 10),
            child: Text(
              'Categories',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 15),
            height: 50,
            width: MediaQuery.sizeOf(context).width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) => SelectedCategoryWidget(
                title: 'All',
                isSelected: index.isEven,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: .8),
                itemBuilder: (context, index) => ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MovieDetails(
                                          id: '',
                                        )));
                          },
                          child: Image.asset('assets/movie2.png')),
                    )),
          )
        ],
      ),
    ));
  }
}

class SelectedCategoryWidget extends StatelessWidget {
  const SelectedCategoryWidget({
    super.key,
    required this.title,
    required this.isSelected,
  });
  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isSelected ? Colors.white24 : null,
      ),
      alignment: Alignment.center,
      child: Text(
        'All',
        style: TextStyle(
            color: isSelected ? const Color(0xff12CDD9) : Colors.white,
            fontSize: 14),
      ),
    );
  }
}
