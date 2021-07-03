enum APP_ENVIRONMENTS { production, development }

class AppEnvironment {
  // !!!IMPORTANT!!!
  static const environment = APP_ENVIRONMENTS.development;
  static const USE_FAKE_API_IMPLEMENTATION = true;

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

  // API / backend base urls
  static const productionApiBaseUrl = '';
  static const developmentApiBaseUrl = 'https://bebasket.digitalwebtunisia.com/';

  // API base url based on current environment
  static String get apiBaseUrl => AppEnvironment.isProductionMode
      ? AppEnvironment.productionApiBaseUrl
      : AppEnvironment.developmentApiBaseUrl;
}
