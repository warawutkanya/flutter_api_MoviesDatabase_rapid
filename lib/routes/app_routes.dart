import 'package:get/get.dart';
import '../views/home_view.dart';
import '../views/movie_detail_view.dart';

class AppRoutes {
  // Define route names
  static const HOME = '/';
  static const MOVIE_DETAIL = '/movie_detail';

  // Define your route configurations
  static List<GetPage> routes = [
    GetPage(
      name: HOME,
      page: () => HomeView(),
    ),
    GetPage(
      name: MOVIE_DETAIL,
      page: () => MovieDetailView(),
      // Optionally, you can also define a binding for the detail view
      // binding: MovieDetailBinding(),
    ),
  ];
}
