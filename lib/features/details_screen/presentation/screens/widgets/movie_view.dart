import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/app_theme.dart';
import 'package:movie_app/core/widgets/movie_item.dart';
import 'package:movie_app/features/tabs/profile_tab/presentation/screens/profile_tab.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  State<MovieView> createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {
  bool isSaved = false;

  @override
  void initState() {
    super.initState();
    _loadSavedStatus();
  }







  Future<void> _loadSavedStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isSaved = prefs.getBool('saved_${widget.movieId}') ?? false;
    });
  }

  Future<void> _toggleSaved() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isSaved = !isSaved;
    });

    await prefs.setBool('saved_${widget.movieId}', isSaved);

    List<String> history = prefs.getStringList('history') ?? [];





    final movieItem = MovieItem(
      imgName: widget.imgName,
      rating: widget.rating,
      height: widget.height,
      width: widget.width,
      onTap: () {},
      movieID: widget.movieId,
      isImageNetwork: true,
    );

    if (isSaved) {
      if (!history.contains(widget.movieId.toString())) {
        history.add(widget.movieId.toString());
        await prefs.setStringList('history', history);
      }
      ProfileTab.addToHistory(movieItem);
    } else {
      history.remove(widget.movieId.toString());
      await prefs.setStringList('history', history);
      ProfileTab.removeFromHistory(movieItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

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

        // Bookmark button
        Positioned(
          top: 16.h,
          right: 16.w,
          child: IconButton(
            icon: Icon(
              isSaved ? Icons.bookmark : Icons.bookmark_outline,
              color: AppTheme.white,
            ),
            onPressed: _toggleSaved,
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
