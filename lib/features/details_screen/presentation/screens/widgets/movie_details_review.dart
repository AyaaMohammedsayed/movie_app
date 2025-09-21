import 'package:flutter/material.dart';
import 'package:movie_app/features/details_screen/presentation/screens/widgets/details_item.dart';

class MovieDetailsReview extends StatelessWidget {
  final int love;
  final int time;
  final num stars;
  const MovieDetailsReview({
    super.key,
    required this.love,
    required this.stars,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DetailsItem(imageName: 'fav', data: "$love"),
        DetailsItem(imageName: 'time', data: "$time"),
        DetailsItem(imageName: 'star', data: "$stars"),
      ],
    );
  }
}
