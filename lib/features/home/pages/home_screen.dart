import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movizone/core/unified_api/status.dart';
import 'package:movizone/core/widgets/about_me.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/unified_api/api_variables.dart';
import '../bloc/home_bloc.dart';
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

  final ValueNotifier<int> selectedGenre = ValueNotifier(0);
  @override
  void initState() {
    Timer.periodic(Durations.extralong4 * 5, (timer) {
      pageController.animateToPage(pageController.page!.toInt() + 1,
          duration: Durations.long1, curve: Curves.easeIn);
    });
    context.read<HomeBloc>().add(GetCategoriesEvent());
    context.read<HomeBloc>().add(GetTopRated());
    context.read<HomeBloc>().add(GetMoviesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: const Color(0xff12cdd9),
            child: SvgPicture.asset('assets/about.svg'),
            onPressed: () {
              showAdaptiveDialog(
                  context: context,
                  builder: (context) {
                    return const AboutMeDialog();
                  });
            }),
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
              ).animate().fade(),
              SizedBox(
                height: 175,
                child: Column(
                  children: [
                    Expanded(
                        child: BlocBuilder<HomeBloc, HomeState>(
                      buildWhen: (previous, current) {
                        return previous.topRatedStatus !=
                            current.topRatedStatus;
                      },
                      builder: (context, state) {
                        return switch (state.topRatedStatus) {
                          Status.failed => Center(
                              child: ElevatedButton(
                                  onPressed: () {
                                    context.read<HomeBloc>().add(GetTopRated());
                                  },
                                  child: const Text('Try Again')),
                            ).animate().fade(),
                          Status.success => PageView.builder(
                              padEnds: true,
                              controller: pageController,
                              itemBuilder: (context, index) => GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) {
                                          return MovieDetails(
                                              id: state.topRated[index % 5].id!
                                                  .toString());
                                        }),
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Stack(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            Image.network(
                                              ApiVariables().imageBaseUrl +
                                                  state.topRated[index % 5]
                                                      .backdropPath!,
                                              fit: BoxFit.fill,
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  .8,
                                            ),
                                            Positioned(
                                              bottom: 40,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                    state.topRated[index % 5]
                                                        .title!,
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ).animate().fade()),
                          _ => const Center(
                              child: CircularProgressIndicator(),
                            ).animate().fade()
                        };
                      },
                    )),
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
                    ).animate().fade()
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
              ).animate().fade(),
              BlocBuilder<HomeBloc, HomeState>(
                buildWhen: (previous, current) {
                  return previous.categoriesStatus != current.categoriesStatus;
                },
                builder: (context, state) {
                  return switch (state.categoriesStatus) {
                    Status.failed => Center(
                        child: ElevatedButton(
                            onPressed: () {
                              context
                                  .read<HomeBloc>()
                                  .add(GetCategoriesEvent());
                            },
                            child: const Text('Try Again')),
                      ).animate().fade(),
                    Status.success => Container(
                        padding: const EdgeInsets.only(left: 15),
                        height: 50,
                        width: MediaQuery.sizeOf(context).width,
                        child: ValueListenableBuilder(
                            valueListenable: selectedGenre,
                            builder: (context, value, _) {
                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.genres.length + 1,
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                  onTap: () {
                                    selectedGenre.value = index;
                                    if (index == 0) {
                                      context
                                          .read<HomeBloc>()
                                          .add(GetMoviesEvent());
                                    } else {
                                      context.read<HomeBloc>().add(
                                          GetMoviesEvent(
                                              genreId: state
                                                  .genres[index - 1].id!
                                                  .toString()));
                                    }
                                  },
                                  child: SelectedCategoryWidget(
                                    title: index == 0
                                        ? 'All'
                                        : state.genres[index - 1].name!,
                                    isSelected: index == value,
                                  ),
                                ),
                              );
                            }),
                      ).animate().fade(),
                    _ => const Center(child: CircularProgressIndicator())
                        .animate()
                        .fade()
                  };
                },
              ),
              Expanded(
                  child: BlocBuilder<HomeBloc, HomeState>(
                      buildWhen: (previous, current) {
                return previous.moviesStatus != current.moviesStatus;
              }, builder: (context, state) {
                return switch (state.moviesStatus) {
                  Status.success => GridView.builder(
                      itemCount: state.movies.length,
                      padding: const EdgeInsets.all(10),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: .8,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20),
                      itemBuilder: (context, index) => ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MovieDetails(
                                                id: state.movies[index].id!
                                                    .toString(),
                                              )));
                                },
                                child: Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Image.network(
                                    ApiVariables().imageBaseUrl +
                                        state.movies[index].posterPath!,
                                    fit: BoxFit.cover,
                                  ),
                                )).animate().fade(),
                          )),
                  Status.failed => Center(
                      child: ElevatedButton(
                          onPressed: () {
                            if (selectedGenre.value == 0) {
                              context.read<HomeBloc>().add(GetMoviesEvent());
                            } else {
                              context.read<HomeBloc>().add(GetMoviesEvent(
                                  genreId: state
                                      .genres[selectedGenre.value - 1].id!
                                      .toString()));
                            }
                          },
                          child: const Text('Try Again')),
                    ).animate().fade(),
                  _ => const Center(child: CircularProgressIndicator())
                      .animate()
                      .fade()
                };
              }))
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
        title,
        style: TextStyle(
            color: isSelected ? const Color(0xff12CDD9) : Colors.white,
            fontSize: 14),
      ),
    );
  }
}
