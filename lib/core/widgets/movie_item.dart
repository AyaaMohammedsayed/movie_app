import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/app_theme.dart';
import 'package:movie_app/core/constants/constants.dart';

class MovieItem extends StatelessWidget {
  final String imgName;
  final String? movieName;
  final bool isImageNetwork;
  final double rating;
  final double width;
  final double height;

  const MovieItem({
    super.key,
    required this.imgName,
    this.movieName,
    required this.rating,
    required this.height,
    required this.width,
    this.isImageNetwork = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        isImageNetwork
            ? CachedNetworkImage(
              imageUrl: imgName,
              width: width,
              height: height,
              fit: BoxFit.fill,
              errorWidget:
                  (_, _, _) => Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image.network(
                        AppImages.placeholderErrorImage,
                        width: width,
                        height: height,
                        fit: BoxFit.fill,
                      ),
                      Text(
                        movieName!,
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
              fit: BoxFit.fill,
            ),
        Container(
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
    );
  }
}
