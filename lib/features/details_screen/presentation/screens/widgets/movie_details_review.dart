import 'package:flutter/material.dart';
import 'package:movie_app/features/details_screen/presentation/screens/widgets/details_item.dart';

class MovieDetailsReview extends StatelessWidget {
  const MovieDetailsReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
        DetailsItem(imageName: 'fav',data: "15",),
      DetailsItem(imageName: 'time',data: "90",),
      DetailsItem(imageName: 'star',data: "7.6",),
],
    );
  }
}
