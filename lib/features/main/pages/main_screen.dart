import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movizone/features/home/pages/home_screen.dart';

import '../../search/pages/search_screen.dart';
import '../../wishlist/pages/wishlist_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ValueNotifier<int> index = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: index,
        builder: (context, value, _) {
          return Scaffold(
            body: IndexedStack(
              index: value,
              children: const [
                HomeScreen(),
                SearchScreen(),
                WishListScreen(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
                onTap: (value) {
                  index.value = value;
                },
                currentIndex: value,
                items: [
                  BottomNavigationBarItem(
                    label: 'Home',
                    icon: SvgPicture.asset('assets/home.svg',
                        colorFilter: ColorFilter.mode(
                            value == 0 ? const Color(0xff12cdd9) : Colors.grey,
                            BlendMode.srcIn)),
                  ),
                  BottomNavigationBarItem(
                    label: 'Search',
                    icon: SvgPicture.asset('assets/search.svg',
                        colorFilter: ColorFilter.mode(
                            value == 1 ? const Color(0xff12cdd9) : Colors.grey,
                            BlendMode.srcIn)),
                  ),
                  BottomNavigationBarItem(
                    label: 'Wishlist',
                    icon: SvgPicture.asset('assets/bookmark.svg',
                        colorFilter: ColorFilter.mode(
                            value == 2 ? const Color(0xff12cdd9) : Colors.grey,
                            BlendMode.srcIn)),
                  ),
                ]),
          );
        });
  }
}
