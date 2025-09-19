import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/app_theme.dart';
import 'package:movie_app/core/constants/constants.dart';
import 'package:movie_app/core/widgets/custom_elevated_button.dart';
import 'package:movie_app/core/widgets/movie_item.dart';
import 'package:movie_app/features/details_screen/presentation/screens/widgets/cast.dart';
import 'package:movie_app/features/details_screen/presentation/screens/widgets/geners.dart';
import 'package:movie_app/features/details_screen/presentation/screens/widgets/movie_details_review.dart';
import 'package:movie_app/features/details_screen/presentation/screens/widgets/movie_view.dart';
import 'package:movie_app/features/details_screen/presentation/screens/widgets/screen_shot.dart';
import 'package:movie_app/features/details_screen/presentation/screens/widgets/section.dart';
import 'package:movie_app/l10n/app_localizations.dart';

class MoveDetails extends StatelessWidget {
  static const String routeName = '/movie_details_screen';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          MovieView(
            imgName: AppImages.movieImages[3],
            movieName: "Doctor Strange in the Multiverse of Madness",
            year: "2022",
            rating: 7.6,
            width: double.infinity,
            height: 645.h,
            isImageNetwork: false,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomElevatedButton(
              onTap: () {},
              child: Text(appLocalizations.watch),
              color: AppTheme.red,
              foregroundColor: AppTheme.white,
            ),
          ),
          SizedBox(height: 16.h),
          Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
            child: MovieDetailsReview(),
          ),
          SizedBox(height: 16.h),
          Section(
            title: appLocalizations.screenShots,
            children: [
              ListView.separated(
                itemBuilder: (_, __) => ScreenShot(),
                separatorBuilder: (_, __) => SizedBox(height: 13.h),
                itemCount: 3,
                shrinkWrap: true,
              ),
            ],
          ),

          Section(
            title: appLocalizations.similar,
            children: [
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 189.w / 279.h,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 8,
                ),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder:
                    (_, index) => MovieItem(
                      imgName: AppImages.movieImagesTest[index],
                      rating: 7.7,
                      height: 279.h,
                      width: 189.w,
                    ),
              ),
            ],
          ),

          Section(
            title: appLocalizations.summary,
            children: [
              Text(
                'Following the events of Spider-Man No Way Home, Doctor Strange unwittingly casts a forbidden spell that accidentally opens up the multiverse. With help from Wong and Scarlet Witch, Strange confronts various versions of himself as well as teaming up with the young America Chavez while traveling through various realities and working to restore reality as he knows it. Along the way, Strange and his allies realize they must take on a powerful new adversary who seeks to take over the multiverse.—Blazer346',
                style: textTheme.titleMedium!.copyWith(
                  color: AppTheme.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Section(
            title: appLocalizations.cast,
            children: [
              ListView.separated(
                itemBuilder:
                    (_, __) => CastingDetails(
                      name: " Hayley Atwell",
                      character: "Wanda Maximoff / The Scarlet Witch",
                    ),
                separatorBuilder: (_, __) => SizedBox(height: 13.h),
                itemCount: 3,
                shrinkWrap: true,
              ),
            ],
          ),

          Section(
            title: appLocalizations.genres,
            children: [
              GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 130.w,
                  mainAxisSpacing: 11.h,
                  crossAxisSpacing: 16.w,
                  childAspectRatio: 3,
                ),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder:
                    (_, index) => Geners(catgoryId: "Action Adventure Comedy"),
              ),
            ],
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
