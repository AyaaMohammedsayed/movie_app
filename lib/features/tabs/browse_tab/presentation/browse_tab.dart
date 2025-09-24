import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/app_theme.dart';
import 'package:movie_app/core/constants/constants.dart';

import 'package:movie_app/features/tabs/browse_tab/modals/movie_category.dart';
import 'package:movie_app/features/tabs/browse_tab/modals/movie_item.dart';
import 'package:movie_app/features/tabs/browse_tab/presentation/widgets/tab_item.dart';

class BrowseTab extends StatefulWidget {
  const BrowseTab({super.key});

  @override
  State<BrowseTab> createState() => _BrowseTabState();
}

class _BrowseTabState extends State<BrowseTab> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Column(
        children: [


          DefaultTabController(
            length: MovieCategory.movies.length,
            child: TabBar(
              onTap: (index) {
                if (currentIndex == index) return;
                currentIndex = index;

                setState(() {});
              },
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              dividerColor: Colors.transparent,
              indicatorColor: Colors.transparent,
              labelPadding: EdgeInsets.only(right: 10, left: 0),
              tabs: [
                ...MovieCategory.movies.map(
                  (element) => TabItem(
                    title: element.name,
                    isSelected:
                        currentIndex == MovieCategory.movies.indexOf(element),
                    selectedBackgroundColorItem: AppTheme.primary,
                    selectedForgroundColorItem: AppTheme.black,
                    unSelectedForgroundColorItem: AppTheme.primary,
                  ),
                ),
              ],
            ),
          ),
     
        




        
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 189.w / 279.h,
                crossAxisSpacing: 20,
                mainAxisSpacing: 8,
              ),
              scrollDirection: Axis.vertical,
              itemCount: AppImages.movieImages.length,
              itemBuilder:
                  (_, index) => MovieItem(
                    imgName: AppImages.movieImages[index],
                    rating: 7.7,
                 categoryId: MovieCategory.movies[index].id,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
