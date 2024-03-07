// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:social_media_app_flutter/data/data.dart';
import 'package:social_media_app_flutter/widgets/custom_drawer.dart';
import 'package:social_media_app_flutter/widgets/following_users.dart';
import 'package:social_media_app_flutter/widgets/posts_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        //systemOverlayStyle:const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          'FRENZY',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 34.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 10.0,
          ),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          indicatorWeight: 3.0,
          labelColor: Theme.of(context).primaryColor,
          labelStyle: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: const TextStyle(fontSize: 18.0),
          tabs: const <Widget>[
            Tab(text: 'Trending'),
            Tab(text: 'Latest'),
          ],
        ),
      ),
      drawer: const CustomDrawer(),
      body: ListView(
        children: <Widget>[
          const FollowingUsers(),
          PostsCarousel(
            pageController: _pageController!,
            title: 'Posts',
            posts: posts,
          ),
        ],
      ),
    );
  }
}
