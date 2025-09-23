import 'package:flutter/material.dart';

class ProfileTab extends StatefulWidget {
 const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileTab>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late AppLocalizations appLocalizations;
  int profile = 1;
  int selectedItem = -1;

  final List<String> watchList = [];

  final List<String> historyList = [
    "assets/images/movie_1.png",
    "assets/images/movie_2.png",
    "assets/images/movie_3.png",
    "assets/images/movie_4.png",
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appLocalizations = AppLocalizations.of(context)!;
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

}
