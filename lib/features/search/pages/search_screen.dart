import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movizone/core/unified_api/api_variables.dart';

import '../../../core/unified_api/status.dart';
import '../../../core/widgets/about_me.dart';
import '../bloc/search_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController textController = TextEditingController();
  Timer? searchTimer;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Search'),
          actions: const [
            AboutMeIcon(),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: BlocConsumer<SearchBloc, SearchState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Column(
                children: [
                  TextFormField(
                    controller: textController,
                    onChanged: (value) {
                      if (searchTimer?.isActive ?? false) {
                        searchTimer?.cancel();
                      } else {
                        searchTimer = Timer(
                            const Duration(
                              milliseconds: 750,
                            ), () {
                          if (value.length > 3) {
                            context
                                .read<SearchBloc>()
                                .add(SearchMovieEvent(query: value));
                          }
                        });
                      }
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefix: GestureDetector(
                        onTap: () {
                          textController.clear();
                          context
                              .read<SearchBloc>()
                              .add(SearchMovieEvent(query: ''));
                        },
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(15),
                      isCollapsed: true,
                      fillColor: Theme.of(context)
                          .bottomNavigationBarTheme
                          .backgroundColor,
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
                      suffixIconConstraints:
                          BoxConstraints.tight(const Size(40, 30)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ).animate().slideX(),
                  state.status == Status.initial
                      ? Expanded(
                          child: const Center(
                            child: Text(
                              'Please Add Some Words To Search',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                          ).animate().fade(),
                        )
                      : state.status == Status.loading
                          ? const Expanded(
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            ).animate().fade()
                          : state.status == Status.failed
                              ? Expanded(
                                  child: Center(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        context.read<SearchBloc>().add(
                                            SearchMovieEvent(
                                                query: textController.text));
                                      },
                                      child: const Text('TryAgain'),
                                    ),
                                  ).animate().fade(),
                                )
                              : state.searchResults.isEmpty
                                  ? Expanded(
                                      child: Container(
                                          alignment: Alignment.center,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 50),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'assets/noresult.png',
                                              ).animate().scale(),
                                              const Text(
                                                'we are sorry, we can not find the movie :(',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ).animate().fade(),
                                              const Text(
                                                'Find your movie by Type title, categories, years, etc ',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                ),
                                              ).animate().fade(),
                                            ],
                                          )),
                                    )
                                  : Expanded(
                                      child: ListView.builder(
                                          itemCount: state.searchResults.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              child: Row(children: [
                                                SizedBox(
                                                  height: 120,
                                                  width: 80,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    child: Image.network(
                                                      ApiVariables()
                                                              .imageBaseUrl +
                                                          state
                                                              .searchResults[
                                                                  index]
                                                              .posterPath!,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ).animate().slideX(),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      state.searchResults[index]
                                                          .title!,
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 20),
                                                    ).animate().fade(),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              SvgPicture.asset(
                                                                  'assets/star.svg'),
                                                              const SizedBox(
                                                                width: 5,
                                                              ),
                                                              Text(
                                                                state
                                                                    .searchResults[
                                                                        index]
                                                                    .voteAverage!
                                                                    .toString(),
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        12),
                                                              )
                                                            ],
                                                          ).animate().slideY(),
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
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        12),
                                                              )
                                                            ],
                                                          ).animate().slideY(),
                                                          Row(
                                                            children: [
                                                              SvgPicture.asset(
                                                                  'assets/clock.svg'),
                                                              const SizedBox(
                                                                width: 5,
                                                              ),
                                                              Text(
                                                                '${Random().nextInt(100) + 100} Minutes',
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        12),
                                                              )
                                                            ],
                                                          ).animate().slideY(),
                                                          Row(
                                                            children: [
                                                              SvgPicture.asset(
                                                                  'assets/calendar.svg'),
                                                              const SizedBox(
                                                                width: 5,
                                                              ),
                                                              Text(
                                                                state
                                                                    .searchResults[
                                                                        index]
                                                                    .releaseDate!
                                                                    .toString(),
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        12),
                                                              )
                                                            ],
                                                          ).animate().slideY(),
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
              );
            },
          ),
        ),
      ),
    );
  }
}
