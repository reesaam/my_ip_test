class AppInfo {
  static String get appName => 'My IP Test Project App';
  static String get website => 'https://myip.resam-t.ir';
  static String get appCurrentVersion => versions.last;
  static int get appVersionsCounter => versions.length;
  static List<String> get versions => [
        '0.0.1', //First Initializations
        '0.0.2', //Initial Full Implementation
        '0.0.3', //Refactor
      ];
}
