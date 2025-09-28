import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/constants/constants.dart';
import 'package:movie_app/core/widgets/nav_bar_icon.dart';
import 'package:movie_app/features/tabs/browse_tab/presentation/cubit/browse_cubit.dart';
import 'package:movie_app/features/tabs/browse_tab/presentation/cubit/browse_state.dart';
import 'package:movie_app/features/tabs/browse_tab/presentation/screens/browse_tab.dart';

import 'package:movie_app/features/tabs/home_tab/presentation/screens/home_tab.dart';
import 'package:movie_app/features/tabs/profile_tab/presentation/screens/profile_tab.dart';
import 'package:movie_app/features/tabs/search_tab/presentation/cubit/search_cubit.dart';
import 'package:movie_app/features/tabs/search_tab/presentation/screens/search_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home_screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  String? selectedCategoryName;
  final PageController _pageController = PageController();

  final List<Widget> tabs = [HomeTab(), SearchTab(), BrowseTab(), ProfileTab()];

  void _onIconTapped(index) {
    if (_selectedIndex == index) return;

    setState(() {
      _selectedIndex = index;
    });

    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );

    if (index == 0) {
      _updateCategory();
    }
  }

  void _updateCategory() {
    final state = context.read<BrowseCubit>().state;

    if (state is BrowseSuccess && state.categories.isNotEmpty) {
      final categories = state.categories;

      if (categories.length == 1) return;

      int randomIndex;
      do {
        randomIndex = Random().nextInt(categories.length);
      } while (categories[randomIndex].name == selectedCategoryName);

      final categoryName = categories[randomIndex].name;
      final categoryId = categories[randomIndex].id;

      print("Selected Random Category: $categoryName");

      setState(() {
        selectedCategoryName = categoryName;
      });

      context.read<BrowseCubit>().getMoviesForCategory(categoryId);
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateCategory();
    });
  }

  @override
  void dispose() {
    _updateCategory();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0).copyWith(bottom: 19.h),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Theme(
            data: Theme.of(
              context,
            ).copyWith(splashFactory: NoSplash.splashFactory),
            child: BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: _onIconTapped,
              items:
                  AppImages.selectedNavBarIcons.map((item) {
                    int itemIndex = AppImages.selectedNavBarIcons.indexOf(item);
                    return BottomNavigationBarItem(
                      icon: NavBarIcon(
                        imageName: AppImages.unSelectedNavBarIcons[itemIndex],
                      ),
                      activeIcon: NavBarIcon(imageName: item),
                      label: '',
                    );
                  }).toList(),
            ),
          ),
        ),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<SearchCubit>(
            create: (context) => SearchCubit()..search(null),
          ),
        ],
        child: Column(
          children: [
            if (selectedCategoryName != null)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Category:$selectedCategoryName",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            Expanded(
              child: PageView(
                controller: _pageController,
                children: tabs,
                onPageChanged: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });

                  if (index == 0) {
                    _updateCategory();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
