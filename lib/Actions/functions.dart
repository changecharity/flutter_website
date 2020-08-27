import 'dart:js' as js;

/// Contains the functions and logic for most of the Change Charity website.
class Functions {
  /// Opens the login page for an organization
  void openOrgLogin() {
    js.context.callMethod("open", ["https://auth.changecharity.io/"]);
  }
  /// Opens the sign up page for an organization
  void openOrgSignUp() {
    js.context.callMethod("open", ["https://auth.changecharity.io/signup"]);
  }

  /// On mobile, opens the app if installed, and the respective store if not installed. On desktop it just opens the website
  void openUserApp() {
    js.context.callMethod("open", ["https://link.changecharity.io/?link=https://changecharity.io/&apn=com.changecharity.app&isi=1522540711&ibi=com.changecharity.flutter"]);
  }

  /// Opens Change Charity's listing on the play store
  void openPlayStore() {
    js.context.callMethod("open", ["https://play.google.com/store/apps/details?id=com.changecharity.app"]);
  }

  /// Opens Change Charity's listing on the app store
  void openAppStore() {
    js.context.callMethod("open", ["https://apps.apple.com/app/id1522540711"]);
  }
}