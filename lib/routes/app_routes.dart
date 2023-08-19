part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const AUTH = _Paths.AUTH;
  static const PORTFOLIO = _Paths.PORTFOLIO;
  static const GITHUBREPO = _Paths.GITHUBREPO;
}

abstract class _Paths {
  _Paths._();
  static const AUTH = '/authScreen';
  static const PORTFOLIO = '/portfolioScreen';
  static const GITHUBREPO = '/githubRepoScreen';
}
