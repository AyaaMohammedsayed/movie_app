import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/constants.dart';
import 'package:movie_app/core/widgets/nav_bar_icon.dart';
import 'package:movie_app/features/tabs/browse_tab/browse_tab.dart';
import 'package:movie_app/features/tabs/home_tab/home_tab.dart';
import 'package:movie_app/features/tabs/profile_tab/presentation/profile_tab.dart';
import 'package:movie_app/features/tabs/search_tab/search_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  final List<Widget> tabs = [HomeTab(), SearchTab(), BrowseTab(), ProfileTab()];
  void _onIconTapped(index) {
    if (_selectedIndex == index) return;
    _selectedIndex = index;
    setState(() {});
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(
          8.0,
        ).copyWith(bottom: MediaQuery.sizeOf(context).height * 0.05),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Theme(
            data: Theme.of(
              context,
            ).copyWith(splashFactory: NoSplash.splashFactory),
            child: BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: _onIconTapped,
              items: [
                ...AppImages.selectedNavBarIcons.map(
                  (item) => BottomNavigationBarItem(
                    icon: NavBarIcon(
                      imageName:
                          AppImages.unSelectedNavBarIcons[AppImages
                              .selectedNavBarIcons
                              .indexOf(item)],
                    ),
                    activeIcon: NavBarIcon(imageName: item),
                    label: '',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: tabs,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
