import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({
    super.key,
    required this.id,
  });
  final String id;
  @override
  Widget build(BuildContext context) {
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
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.bookmark),
                ),
              ),
            ],
          ),
          body: Column(
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
                          child: Image.asset(
                            'assets/movie2.png',
                            fit: BoxFit.cover,
                            height: .3 * MediaQuery.sizeOf(context).height,
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
                        Image.asset(
                          'assets/movie2.png',
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * .5,
                          child: const Text(
                            'Spiderman No Way Home',
                            style: TextStyle(
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
                    const Text(
                      '2021',
                      style: TextStyle(color: Colors.white),
                    ),
                    const VerticalDivider(
                      color: Colors.white,
                      thickness: .8,
                    ),
                    SvgPicture.asset('assets/clock.svg'),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      '148 Minutes',
                      style: TextStyle(color: Colors.white),
                    ),
                    const VerticalDivider(
                      color: Colors.white,
                      thickness: .8,
                    ),
                    SvgPicture.asset('assets/ticket.svg'),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      'Action',
                      style: TextStyle(color: Colors.white),
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
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        'From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences.',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: ListView.separated(
                        itemCount: 2,
                        separatorBuilder: (context, index) => const Divider(
                          endIndent: 20,
                          indent: 20,
                        ),
                        itemBuilder: (context, index) => const ListTile(
                          titleAlignment: ListTileTitleAlignment.top,
                          leading: CircleAvatar(
                            backgroundImage: AssetImage('assets/movie1.png'),
                            radius: 25,
                          ),
                          title: Text(
                            'Iqbal Shafiq Rozaan',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          subtitle: Text(
                            'From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government.',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 0,
                                childAspectRatio: 1.5,
                                mainAxisSpacing: 0),
                        itemBuilder: (context, index) =>
                            const Column(children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/movie1.png'),
                            radius: 45,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Tom Holland',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )
                        ]),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
