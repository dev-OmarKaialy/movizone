import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movizone/core/unified_api/api_variables.dart';
import 'package:movizone/core/unified_api/status.dart';

import '../../wishlist/bloc/wishlist_bloc.dart';
import '../bloc/home_bloc.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({
    super.key,
    required this.id,
  });
  final String id;

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  void initState() {
    context.read<HomeBloc>().add(GetDetailsEvent(movieId: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Detail'),
                centerTitle: true,
                leading: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_ios_new)),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        if (state.movieDetails != null) {
                          context.read<WishlistBloc>().add(
                              AddWishListEvent(movie: state.movieDetails!));
                        }
                      },
                      child: const Icon(Icons.bookmark),
                    ),
                  ),
                ],
              ),
              body: switch (state.detailsStatus) {
                Status.success => Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * .4,
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      bottomRight: Radius.circular(25),
                                      bottomLeft: Radius.circular(25)),
                                  child: Image.network(
                                    ApiVariables().imageBaseUrl +
                                        state.movieDetails!.backdropPath!,
                                    fit: BoxFit.cover,
                                    height:
                                        .3 * MediaQuery.sizeOf(context).height,
                                    width: double.infinity,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            left: 20,
                            bottom: 10,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    ApiVariables().imageBaseUrl +
                                        state.movieDetails!.posterPath!,
                                    width: 120,
                                    height: 160,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  width: 25,
                                ),
                                SizedBox(
                                  width: MediaQuery.sizeOf(context).width * .5,
                                  child: Text(
                                    state.movieDetails!.title!,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 2,
                                    softWrap: true,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 25,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/calendar.svg'),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              state.movieDetails!.releaseDate!.year.toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                            const VerticalDivider(
                              color: Colors.white,
                              thickness: .8,
                            ),
                            SvgPicture.asset('assets/clock.svg'),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              '${state.movieDetails!.runtime} Minutes',
                              style: const TextStyle(color: Colors.white),
                            ),
                            const VerticalDivider(
                              color: Colors.white,
                              thickness: .8,
                            ),
                            SvgPicture.asset('assets/ticket.svg'),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              state.movieDetails!.genres!.first.name!,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TabBar(
                        tabs: const [
                          Padding(
                            padding: EdgeInsets.only(bottom: 8.0),
                            child: Text('About Movie'),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 8.0),
                            child: Text('Reviews'),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 8.0),
                            child: Text('Cast'),
                          )
                        ],
                        splashFactory: NoSplash.splashFactory,
                        overlayColor:
                            const MaterialStatePropertyAll(Colors.transparent),
                        splashBorderRadius: BorderRadius.circular(15),
                        dividerHeight: 0,
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.white,
                        indicatorColor: Colors.grey,
                        labelStyle: const TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .4,
                        child: TabBarView(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                state.movieDetails!.overview!,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            ReviewsWidget(
                              state: state,
                            ),
                            CastWidget(
                              state: state,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                Status.failed => Center(
                      child: ElevatedButton(
                    onPressed: () {
                      context
                          .read<HomeBloc>()
                          .add(GetDetailsEvent(movieId: widget.id));
                    },
                    child: const Text('Try Again'),
                  )),
                _ => const Center(child: CircularProgressIndicator())
              },
            ));
      },
    );
  }
}

class CastWidget extends StatelessWidget {
  const CastWidget({
    super.key,
    required this.state,
  });
  final HomeState state;

  @override
  Widget build(BuildContext context) {
    return switch (state.creditsStatus) {
      Status.success => Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: GridView.builder(
            itemCount: state.cast.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 0,
                childAspectRatio: 1.5,
                mainAxisSpacing: 0),
            itemBuilder: (context, index) => Column(children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    state.cast[index].profilePath == null
                        ? 'http://www.gravatar.com/avatar'
                        : ApiVariables().imageBaseUrl +
                            state.cast[index].profilePath!),
                radius: 45,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                state.cast[index].name!,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              )
            ]),
          ),
        ),
      Status.failed => Center(
            child: ElevatedButton(
          onPressed: () {
            context.read<HomeBloc>().add(
                GetCreditsEvent(movieId: state.movieDetails!.id!.toString()));
          },
          child: const Text('Try Again'),
        )),
      _ => const Center(
          child: CircularProgressIndicator(),
        )
    };
  }
}

class ReviewsWidget extends StatelessWidget {
  const ReviewsWidget({
    super.key,
    required this.state,
  });
  final HomeState state;
  @override
  Widget build(BuildContext context) {
    return switch (state.reviewsStatus) {
      Status.success => Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: ListView.separated(
            itemCount: state.reviews.length,
            separatorBuilder: (context, index) => const Divider(
              endIndent: 20,
              indent: 20,
            ),
            itemBuilder: (context, index) => ListTile(
              titleAlignment: ListTileTitleAlignment.top,
              leading: CircleAvatar(
                backgroundImage: NetworkImage(state.reviews[index].url == null
                    ? 'http://www.gravatar.com/avatar'
                    : state.reviews[index].url!),
                radius: 25,
              ),
              title: Text(
                state.reviews[index].author!,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              subtitle: Text(
                state.reviews[index].content!,
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
        ),
      Status.failed => Center(
            child: ElevatedButton(
          onPressed: () {
            context.read<HomeBloc>().add(
                GetReviewsEvent(movieId: state.movieDetails!.id!.toString()));
          },
          child: const Text('Try Again'),
        )),
      _ => const Center(
          child: CircularProgressIndicator(),
        )
    };
  }
}
