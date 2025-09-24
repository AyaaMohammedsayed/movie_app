import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/app_theme.dart';
import 'package:movie_app/core/constants/constants.dart';
import 'package:movie_app/core/widgets/custom_elevated_button.dart';
import 'package:movie_app/core/widgets/movie_item.dart';
import 'package:movie_app/features/auth/presentation/screens/login_screen.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/get_movie_request.dart';
import 'package:movie_app/features/tabs/profile_tab/presentation/cubit/profile_cubit.dart';
import 'package:movie_app/features/tabs/profile_tab/presentation/cubit/states.dart';
import 'package:movie_app/features/tabs/profile_tab/presentation/screens/update_profile.dart';
import 'package:movie_app/l10n/app_localizations.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileTab>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late AppLocalizations appLocalizations;
  int profile = 1;

  List<MovieItem> watchList = [];
  List<MovieItem> historyList = [];
  String userName = "User";

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appLocalizations = AppLocalizations.of(context)!;
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    final cubit = context.read<ProfileCubit>();
    cubit.getProfile();
    cubit.getWishList(GetMovieRequest());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final textTheme = Theme.of(context).textTheme;

    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is GetProfileSuccess) {
          setState(() {
            userName = state.response.data!.name ?? "User";
            profile = state.response.data!.avaterId ?? 1;
          });
        }
        if (state is GetWishListSuccess) {
          setState(() {
            watchList =
                state.getMovieResponse.data!.movies!
                    .map(
                      (m) => MovieItem(
                        imgName: m.url!,
                        rating: m.rating,
                        height: 279,
                        width: 189,
                        isImageNetwork: true,
                        onTap: () {},
                      ),
                    )
                    .toList();
          });
        }

         
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(size, textTheme),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildMovieGrid(watchList),
                _buildMovieGrid(historyList),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(Size size, TextTheme textTheme) {
    final cubit = context.read<ProfileCubit>();

    return Container(
      padding: const EdgeInsets.all(20),
      color: AppTheme.grey,
      width: size.width,
      height: size.height * 0.43,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/avatar$profile.png'),
              ),
              SizedBox(width: size.width * 0.04),
              _buildStatCard(
                watchList.length.toString(),
                appLocalizations.wishList,
                textTheme,
                bold: true,
              ),
              SizedBox(width: size.width * 0.01),
              _buildStatCard(
                historyList.length.toString(),
                appLocalizations.history,
                textTheme,
                bold: true,
              ),
            ],
          ),
          SizedBox(height: size.height * 0.02),
          Text(userName, style: textTheme.titleLarge),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: CustomElevatedButton(
                  onTap: () {
                    Navigator.pushNamed(context, UpdateProfile.routeName);
                         
                  },
                  child: Text(
                    appLocalizations.editProfile,
                    style: textTheme.titleLarge!.copyWith(
                      color: AppTheme.black,
                    ),
                  ),
                ),
              ),
              SizedBox(width: size.width * 0.02),
              Expanded(
                flex: 2,
                child: CustomElevatedButton(
                  backgroundColor: AppTheme.red,
                  onTap: () {
                    Navigator.of(
            context,
          ).pushNamedAndRemoveUntil(LoginScreen.routeName, (route) => false);
        
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(appLocalizations.exit, style: textTheme.titleLarge),
                      const SizedBox(width: 6),
                      const Icon(
                        Icons.exit_to_app,
                        color: AppTheme.white,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: size.width * 0.04),
          _buildTabs(textTheme),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    String count,
    String label,
    TextTheme textTheme, {
    bool bold = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(count, style: textTheme.titleSmall),
        Text(
          label,
          style: textTheme.labelSmall!.copyWith(
            fontWeight: bold ? FontWeight.w700 : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _buildTabs(TextTheme textTheme) {
    return TabBar(
      controller: _tabController,
      dividerColor: Colors.transparent,
      indicatorColor: AppTheme.primary,
      labelColor: AppTheme.white,
      unselectedLabelColor: AppTheme.white,
      tabs: [
        _buildTabItem(
          AppImages.watchListIcon,
          appLocalizations.watchList,
          textTheme,
        ),
        _buildTabItem(
          AppImages.historyIcon,
          appLocalizations.history,
          textTheme,
        ),
      ],
    );
  }

  Widget _buildTabItem(String icon, String label, TextTheme textTheme) {
    return Tab(
      child: Column(
        children: [
          SvgPicture.asset(icon, height: 18, width: 18),
          const SizedBox(height: 4),
          Text(label, style: textTheme.titleMedium),
        ],
      ),
    );
  }

  Widget _buildMovieGrid(List<MovieItem> movies) {
    if (movies.isEmpty) {
      return Center(child: Image.asset('assets/images/empty1.png'));
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
        return movies[index];
      },
    );
  }
}
