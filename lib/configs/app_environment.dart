enum APP_ENVIRONMENTS { production, development }

class AppEnvironment {
  // !!!IMPORTANT!!!
  static const environment = APP_ENVIRONMENTS.production;
  static const USE_FAKE_API_IMPLEMENTATION = false;

  //////////////////////////////////////////////////////////////////////////

  static bool get isProductionMode =>
      environment == APP_ENVIRONMENTS.production;

  //////////////////////////////////////////////////////////////////////////

  // Sentry
  static const productionSentryDsn = '';
  static const developmentSentryDsn = '';

  // Sentry dsn based on current environment
  static String get sentryDsn => AppEnvironment.isProductionMode
      ? AppEnvironment.productionSentryDsn
      : AppEnvironment.developmentSentryDsn;

  //////////////////////////////////////////////////////////////////////////

  // SQLite database
  static const databaseName = 'coupon.sqlite';
  static const databaseVersion = 1;

  //////////////////////////////////////////////////////////////////////////

  // API / backend base urls
  static const productionApiBaseUrl = 'https://coupon.romic.de/';
  static const developmentApiBaseUrl = '';

  // API base url based on current environment
  static String get apiBaseUrl => AppEnvironment.isProductionMode
      ? AppEnvironment.productionApiBaseUrl
      : AppEnvironment.developmentApiBaseUrl;
}
