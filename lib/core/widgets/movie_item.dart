import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/app_theme.dart';
import 'package:movie_app/core/constants/constants.dart';

class MovieItem extends StatelessWidget {
  final String imgName;
  final String? movieName;
  final bool isImageNetwork;
  final double? rating;
  final int? movieID;
  final double width;
  final double height;
  final String year;
  final bool? withGradient;
  final List<double>? stopsBTT;
  final List<Color>? gradientColors;
  final void Function()? onTap;

  const MovieItem({
    super.key,
    required this.imgName,
    required this.onTap,
    this.movieName,
    this.rating,
    required this.height,
    required this.width,
    this.isImageNetwork = false,
    this.withGradient = false,
    this.stopsBTT,
    this.gradientColors,
    this.year = '',
    this.movieID
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          isImageNetwork
              ? CachedNetworkImage(
                imageUrl: imgName ?? AppImages.placeholderErrorImage,
                width: width,
                height: height,
                fit: BoxFit.cover,
                errorWidget:
                    (_, _, _) => Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Image.network(
                          AppImages.placeholderErrorImage,
                          width: width,
                          height: height,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          movieName??'',
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(fontWeight: FontWeight.w900),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),

                placeholder:
                    (context, url) => Center(
                      child: CircularProgressIndicator(color: AppTheme.primary),
                    ),
              )
              : Image.asset(
                imgName,
                width: width,
                height: height,
                fit: BoxFit.cover,
              ),
          withGradient == false
              ? Container()
              : Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: stopsBTT ?? [0.0, 0.47, 1],
                    colors:
                        gradientColors ??
                        [
                          AppTheme.black.withValues(alpha: 1),
                          AppTheme.black.withValues(alpha: 0.6),
                          AppTheme.black.withValues(alpha: 0.8),
                        ],
                  ),
                ),
              ),
          rating == null
              ? SizedBox()
              : Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: AppTheme.grey.withValues(alpha: 0.71),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      rating.toString(),
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium!.copyWith(color: AppTheme.white),
                    ),
                    Icon(Icons.star, color: AppTheme.primary),
                  ],
                ),
              ),
        ],
      ),
    );
  }
}
