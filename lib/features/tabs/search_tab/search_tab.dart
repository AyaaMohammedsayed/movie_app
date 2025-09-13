import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/constants/constants.dart';
import 'package:movie_app/core/widgets/custom_text_form_field.dart';
import 'package:movie_app/core/widgets/movie_item.dart';
import 'package:movie_app/l10n/app_localizations.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h).copyWith(top: 21.h),
          child: CustomTextFormField(
            hintText: AppLocalizations.of(context)!.search,
            prefixIconName: AppImages.unSelectedNavBarIcons[1],
            controller: controller,
            onChanged: (value) {},
          ),
        ),
        SizedBox(height: 12.h),
        Expanded(
          child:
              AppImages.movieImages.isEmpty
                  ? Center(child: Image.asset(AppImages.emptyImage))
                  : GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16.h),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 16.w,
                      mainAxisSpacing: 8.h,
                      childAspectRatio: 191 / 279,
                      crossAxisCount: 2,
                    ),
                    itemCount: AppImages.movieImages.length,
                    itemBuilder:
                        (_, index) => MovieItem(
                          imgName: AppImages.movieImages[index],
                          rating: 7,
                          width: 191.h,
                          height: 279.h,
                        ),
                  ),
        ),
      ],
    );
  }
}
