import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/app_theme.dart';
import 'package:movie_app/core/constants/constants.dart';
import 'package:movie_app/core/widgets/custom_elevated_button.dart';
import 'package:movie_app/l10n/app_localizations.dart';

class ProfileTab extends StatefulWidget {
  ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileTab>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late AppLocalizations appLocalizations;
  int profile = 1;
  int selectedItem = -1;

  final List<String> watchList = [];

  final List<String> historyList = [
    "assets/images/movie_1.png",
    "assets/images/movie_2.png",
    "assets/images/movie_3.png",
    "assets/images/movie_4.png",
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appLocalizations = AppLocalizations.of(context)!;
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              color: AppTheme.grey,
              width: screenWidth,
              height: screenHeight * 0.43,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(
                          'assets/images/avatar$profile.png',
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.1),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('12', style: textTheme.titleSmall),
                          Text(
                            appLocalizations.wishList,
                            style: textTheme.labelSmall,
                          ),
                        ],
                      ),
                      SizedBox(width: screenWidth * 0.1),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('10', style: textTheme.titleSmall),
                          Text(
                            appLocalizations.history,
                            style: textTheme.labelSmall!.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text("John Safwat", style: textTheme.titleLarge),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: screenWidth * 0.6,
                        child: CustomElevatedButton(
                          onTap: () {},
                          child: Text(
                            appLocalizations.editProfile,
                            style: textTheme.titleLarge!.copyWith(
                              color: AppTheme.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      SizedBox(
                        width: screenWidth * 0.25,
                        child: CustomElevatedButton(
                          backgroundColor: AppTheme.red,
                          onTap: () {},
                          child: Row(
                            children: [
                              Text(
                                appLocalizations.exit,
                                style: textTheme.titleLarge,
                              ),
                              SizedBox(width: 1),
                              Icon(
                                Icons.exit_to_app,
                                color: AppTheme.white,
                                size: 13,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenWidth * 0.04),
                  TabBar(
                    controller: _tabController,
                    dividerColor: Colors.transparent,
                    indicatorColor: AppTheme.primary,
                    labelColor: AppTheme.white,
                    unselectedLabelColor: AppTheme.white,
                    tabs: [
                      Tab(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AppImages.watchListIcon,
                              height: 15,
                              width: 12,
                            ),
                            SizedBox(height: 2),
                            Text(
                              appLocalizations.watchList,
                              style: textTheme.titleLarge,
                            ),
                          ],
                        ),
                      ),
                      Tab(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AppImages.historyIcon,
                              height: 18,
                              width: 15,
                            ),
                            Text(
                              appLocalizations.history,
                              style: textTheme.titleLarge,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                width: screenWidth,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildMovieGrid(watchList),
                    _buildMovieGrid(historyList),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMovieGrid(List<String> movies) {
    if (movies.isEmpty) {
      return Center(child: Image.asset('assets/images/Empty 1.png'));
    }
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.65,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(movies[index], fit: BoxFit.cover),
        );
      },
    );
  }
}
