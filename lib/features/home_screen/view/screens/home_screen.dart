import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/constants/constants.dart';
import 'package:movie_app/core/widgets/nav_bar_icon.dart';
import 'package:movie_app/features/details_screen/presentation/cubit/details_cubit.dart';
import 'package:movie_app/features/tabs/browse_tab/modals/movie_category.dart';
import 'package:movie_app/features/tabs/browse_tab/presentation/browse_tab.dart';
import 'package:movie_app/features/tabs/home_tab/presentation/cubit/movie_cubit.dart';
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
  final PageController _pageController = PageController();

  // مؤشر الكاتيجوري
  int _categoryIndex = 0;

  final List<Widget> tabs = [
    HomeTab(),
    SearchTab(),
    BrowseTab(),
    ProfileTab()
  ];

  void _onIconTapped(int index) {
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
   
    context.read<MovieCubit>().setCategory(
          MovieCategory.movies[_categoryIndex].name,
        );

 
    _categoryIndex = (_categoryIndex + 1) % MovieCategory.movies.length;
  }

  @override
  void initState() {
    super.initState();

    _updateCategory();
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
      extendBodyBehindAppBar: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0).copyWith(bottom: 19.h),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Theme(
            data: Theme.of(context).copyWith(splashFactory: NoSplash.splashFactory),
            child: BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: _onIconTapped,
              items: AppImages.selectedNavBarIcons.map((item) {
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
        child: PageView(
          controller: _pageController,
          children: tabs,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });

            // لو سحبنا ورجعنا للهوم
            if (index == 0) {
              _updateCategory();
            }
          },
        ),
      ),
    );
  }
}
