import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/app_theme.dart';
import 'package:movie_app/core/widgets/movie_item.dart';
import 'package:movie_app/features/tabs/profile_tab/data/model/add_request.dart';
import 'package:movie_app/features/tabs/profile_tab/presentation/cubit/profile_cubit.dart';
import 'package:movie_app/features/tabs/profile_tab/presentation/cubit/states.dart';

class MovieView extends StatelessWidget {
  final int movieId;
  final String imgName;
  final String? movieName;
  final double rating;
  final double width;
  final double height;
  final String year;
  final int likes;
  final int comments;

  const MovieView({
    super.key,
    required this.movieId,
    required this.imgName,
    this.movieName,
    required this.rating,
    required this.height,
    required this.width,
    this.year = '',
    this.likes = 0,
    this.comments = 0,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final cubit = context.read<ProfileCubit>();

    
    cubit.checkIsFav(movieId);

    return Stack(
      alignment: Alignment.center,
      children: [
        // Poster
        MovieItem(
          imgName: imgName,
          onTap: () {},
          height: height,
          width: width,
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
                    cubit.removeFromWishList(movieId);
                  } else {
                    cubit.addToWishList(
                      AddRequest(
                        movieId: movieId,
                        name: movieName,
                        rating: rating,
                        imageUrl: imgName,
                        year: year,
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
          onTap: () {},
          child: Image.asset(
            'assets/images/button_play.png',
            width: 97.w,
            height: 97.h,
            fit: BoxFit.cover,
          ),
        ),

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
                if (movieName != null)
                  Text(
                    movieName!,
                    textAlign: TextAlign.center,
                    style: textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppTheme.white,
                    ),
                  ),
                SizedBox(height: 6.h),
                Text(
                  year,
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
