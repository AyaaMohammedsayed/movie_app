import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/app_theme.dart';
import 'package:movie_app/core/utils/localize_app_localization.dart';
import 'package:movie_app/core/utils/ui_utils.dart';
import 'package:movie_app/core/widgets/custom_elevated_button.dart';
import 'package:movie_app/core/widgets/movie_item.dart';

import 'package:movie_app/features/details_screen/data/model/movie_details_response/torrent.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/add_request.dart';
import 'package:movie_app/features/tabs/profile_tab/presentation/cubit/profile_cubit.dart';
import 'package:movie_app/features/tabs/profile_tab/presentation/cubit/states.dart';
import 'package:url_launcher/url_launcher.dart';


class MovieView extends StatefulWidget {
  final int movieId;
  final String imgName;
  final String? movieName;
  final double rating;
  final double width;
  final double height;
  final String year;
  final int likes;
  final int comments;
  final List<Torrent>? movieTorrentsList;

  const MovieView({
    super.key,
    required this.movieId,
    required this.imgName,
    this.movieName,
    required this.rating,
    required this.height,
    required this.width,
    required this.movieTorrentsList,
    this.year = '',
    this.likes = 0,
    this.comments = 0,
  });

  @override
  State<MovieView> createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {

  int currentIndex = 0;
  Future<void> onPlayButton() async {
    UiUtils.showLoading(
      context,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AppDependencies().localizations.selectQuality,
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(color: AppTheme.black),
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: StatefulBuilder(
              builder: (context, StateSetter setState) {
                return GridView.builder(
                  itemCount: widget.movieTorrentsList!.length,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 16.w,
                    mainAxisSpacing: 16.h,
                    mainAxisExtent: 45.w,
                  ),

                  itemBuilder:
                      (_, index) => InkWell(
                        onTap: () => setState(() => currentIndex = index),
                        child: Container(
                          alignment: Alignment.center,
                          height: 47.h,
                          decoration: BoxDecoration(
                            color:
                                currentIndex == index
                                    ? AppTheme.primary
                                    : AppTheme.blackSecondary,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            '${widget.movieTorrentsList![index].quality}',
                            style: Theme.of(
                              context,
                            ).textTheme.titleMedium!.copyWith(
                              color:
                                  currentIndex == index
                                      ? AppTheme.blackSecondary
                                      : AppTheme.primary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                );
              },
            ),
          ),

          Row(
            children: [
              CustomElevatedButton(
                screenWidth: 115.w,
                hasBorder: true,
                foregroundColor: AppTheme.primary,
                backgroundColor: AppTheme.white,

                child: Text(
                  AppDependencies().localizations.cancel,
                  style: Theme.of(
                    context,
                  ).textTheme.labelLarge!.copyWith(color: AppTheme.primary),
                ),
                onTap: () => Navigator.pop(context),
              ),
              Spacer(),
              CustomElevatedButton(
                screenWidth: 145.w,
                child: Text(
                  AppDependencies().localizations.download,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                onTap: () async {
                  final Uri _url = Uri.parse(
                    widget.movieTorrentsList![currentIndex].url!,
                  );
                  await _launchInBrowser(_url);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      UiUtils.showErrorMessage('Could not launch $url');

    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final cubit = context.read<ProfileCubit>();

    cubit.checkIsFav(widget.movieId);


    return Stack(
      alignment: Alignment.center,
      children: [
        // Poster
        MovieItem(
          imgName: widget.imgName,
          onTap: () {},
          height: widget.height,
          width: widget.width,
          isImageNetwork: true,
        ),

        // Back button
        Positioned(
          top: 16.h,
          left: 16.w,
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios, color: AppTheme.white),
          ),
        ),

        Positioned(
          top: 16.h,
          right: 16.w,
          child: BlocConsumer<ProfileCubit, ProfileState>(
            listener: (context, state) {
              if (state is AddToWishSuccess) {
                print('Added to wishlist!');
              } else if (state is RemoveMovieSuccess) {
                print('Removed from wishlist!');
              }
            },
            builder: (context, state) {
              bool isSaved = false;

              if (state is CheckFavSuccess) {
                isSaved = state.isFavResponse.data ?? false;
              } else if (state is AddToWishSuccess) {
                isSaved = true;
              } else if (state is RemoveMovieSuccess) {
                isSaved = false;
              }

              return IconButton(
                icon: Icon(
                  isSaved ? Icons.bookmark : Icons.bookmark_outline,
                  color: AppTheme.white,
                ),
                onPressed: () {
                  if (isSaved) {
                    cubit.removeFromWishList(widget.movieId);
                  } else {
                    cubit.addToWishList(
                      AddRequest(
                        movieId: widget.movieId,
                        name: widget.movieName,
                        rating: widget.rating,
                        imageUrl: widget.imgName,
                        year: widget.year,
                      ),
                    );
                  }
                },
              );
            },

          ),
        ),

        // Play button
        InkWell(
          onTap: () => onPlayButton(),
          child: Image.asset(
            'assets/images/button_play.png',
            width: 97.w,
            height: 97.h,
            fit: BoxFit.cover,
          ),
        ),

        // Movie info overlay
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppTheme.black.withOpacity(0.2), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            child: Column(
              children: [
                if (widget.movieName != null)
                  Text(
                    widget.movieName!,
                    textAlign: TextAlign.center,
                    style: textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppTheme.white,
                    ),
                  ),
                SizedBox(height: 6.h),
                Text(
                  widget.year,
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xffADADAD),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
