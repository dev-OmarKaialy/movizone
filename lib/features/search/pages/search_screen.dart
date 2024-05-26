import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Search'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {},
              child: SvgPicture.asset('assets/about.svg'),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextFormField(
              controller: textController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(15),
                isCollapsed: true,
                fillColor:
                    Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                filled: true,
                suffixIcon: Transform.flip(
                  flipX: true,
                  child: Row(
                    children: [
                      const Spacer(),
                      SvgPicture.asset(
                        'assets/search.svg',
                        width: 30,
                        height: 30,
                      ),
                    ],
                  ),
                ),
                suffixIconConstraints: BoxConstraints.tight(const Size(40, 30)),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            false
                ? Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/noresult.png',
                            ),
                            const Text(
                              'we are sorry, we can not find the movie :(',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              'Find your movie by Type title, categories, years, etc ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        )),
                  )
                : Expanded(
                    child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(children: [
                              SizedBox(
                                height: 120,
                                width: 80,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    'assets/movie2.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'SpiderMan',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset('assets/star.svg'),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const Text(
                                              '5',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                                'assets/ticket.svg'),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const Text(
                                              'Action',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                                'assets/clock.svg'),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const Text(
                                              '148 Minutes',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                                'assets/calendar.svg'),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const Text(
                                              '2024',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ]),
                          );
                        }),
                  )
          ],
        ),
      ),
    );
  }
}