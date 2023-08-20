import 'package:flutter/material.dart';
import 'package:reddit_clone/screen/community_screen.dart';
import 'package:reddit_clone/screen/home/home_screen.dart';
import 'package:reddit_clone/screen/login_screen.dart';
import 'package:routemaster/routemaster.dart';

final loggedOutRoute = RouteMap(
  routes: {
    '/': (_) => const MaterialPage(
          child: LoginScreen(),
        ),
  },
);

final loggedInRoute = RouteMap(routes: {
  '/': (_) => const MaterialPage(
        child: HomeScreen(),
      ),
  CreateCommunityScreen.routeName: (_) => const MaterialPage(
        child: CreateCommunityScreen(),
      ),
});
