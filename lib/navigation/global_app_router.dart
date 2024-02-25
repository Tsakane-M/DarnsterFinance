import 'app_router.dart';

class GlobalAppRouter {
  factory GlobalAppRouter() {
    return _globalAppRouter;
  }

  GlobalAppRouter._internal();

  AppRouter? appRouter;

  static final GlobalAppRouter _globalAppRouter = GlobalAppRouter._internal();
}
