// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// import '../../presentation/pages/pages.dart';

// part 'routes.g.dart';

// @TypedGoRoute<HomeRoute>(
//   path: '/',
//   routes: [
//     TypedShellRoute(
//       routes: [
//         TypedGoRoute<FeedRoute>(path: 'feed'),
//         TypedGoRoute<DiscoverRoute>(path: 'discover'),
//       ],
//     ),
//     TypedGoRoute<FruitsRoute>(
//       path: 'fruits',
//       routes: [
//         TypedGoRoute<FruitSlugRoute>(path: ':slug'),
//       ],
//     ),
//   ],
// )
// @immutable
// class HomeRoute extends GoRouteData {
//   const HomeRoute();

//   @override
//   Widget build(BuildContext context, GoRouterState state) {
//     return const HomePage();
//   }
// }

// @immutable
// class FeedRoute extends GoRouteData {
//   const FeedRoute();
//   @override
//   Widget build(BuildContext context, GoRouterState state) {
//     return const FeedPage();
//   }
// }

// @immutable
// class DiscoverRoute extends GoRouteData {
//   const DiscoverRoute();
//   @override
//   Widget build(BuildContext context, GoRouterState state) {
//     return const DiscoverPage();
//   }
// }

// @immutable
// class FruitsRoute extends GoRouteData {
//   const FruitsRoute();
//   @override
//   Widget build(BuildContext context, GoRouterState state) {
//     return const FruitPage();
//   }
// }

// @immutable
// class FruitSlugRoute extends GoRouteData {
//   const FruitSlugRoute({
//     required this.id,
//     required this.slug,
//   });
//   final int id;
//   final String slug;
//   @override
//   Widget build(BuildContext context, GoRouterState state) {
//     return FruitDetailPage(id: id, slug: slug);
//   }
// }

// @TypedGoRoute<LoginRoute>(path: '/login')
// @immutable
// class LoginRoute extends GoRouteData {
//   @override
//   Widget build(BuildContext context, GoRouterState state) {
//     return const LoginPage();
//   }
// }

// @TypedGoRoute<StartupRoute>(path: '/startup')
// @immutable
// class StartupRoute extends GoRouteData {
//   @override
//   Widget build(BuildContext context, GoRouterState state) {
//     return const StartupPage();
//   }
// }
