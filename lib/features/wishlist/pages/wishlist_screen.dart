import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movizone/core/unified_api/api_variables.dart';

import '../bloc/wishlist_bloc.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WishlistBloc, WishlistState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Wishlist'),
          ),
          body: state.wishlistMovies.isEmpty
              ? Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/wishlist.png',
                      ),
                      const Text(
                        'There is no movie yet!',
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
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      itemCount: state.wishlistMovies.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onLongPress: () {
                            context.read<WishlistBloc>().add(
                                RemoveWishListEvent(
                                    id: state.wishlistMovies[index].id!));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(children: [
                              SizedBox(
                                height: 120,
                                width: 80,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    ApiVariables().imageBaseUrl +
                                        state.wishlistMovies[index].posterPath!,
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
                                  Text(
                                    state.wishlistMovies[index].title!,
                                    style: const TextStyle(
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
                                            Text(
                                              state.wishlistMovies[index]
                                                  .voteAverage!
                                                  .toString(),
                                              style: const TextStyle(
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
                                            Text(
                                              state.wishlistMovies[index]
                                                  .genres!.first.name!,
                                              style: const TextStyle(
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
                                            Text(
                                              '${state.wishlistMovies[index].runtime} Minutes',
                                              style: const TextStyle(
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
                                            Text(
                                              state.wishlistMovies[index]
                                                  .releaseDate!
                                                  .toString(),
                                              style: const TextStyle(
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
                          ),
                        );
                      }),
                ),
        );
      },
    );
  }
}
