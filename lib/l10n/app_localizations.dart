import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @userName.
  ///
  /// In en, this message translates to:
  /// **'User Name'**
  String get userName;

  /// No description provided for @phoneName.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phoneName;

  /// No description provided for @loginSuccess.
  ///
  /// In en, this message translates to:
  /// **'Login Successfully'**
  String get loginSuccess;

  /// No description provided for @registerSuccess.
  ///
  /// In en, this message translates to:
  /// **'Register Successfully'**
  String get registerSuccess;

  /// No description provided for @loginFailed.
  ///
  /// In en, this message translates to:
  /// **'Invalid Email or Password'**
  String get loginFailed;

  /// No description provided for @registerFailed.
  ///
  /// In en, this message translates to:
  /// **'Register Failed'**
  String get registerFailed;

  /// No description provided for @enterValidEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid E-mail'**
  String get enterValidEmail;

  /// No description provided for @requiredField.
  ///
  /// In en, this message translates to:
  /// **'this field is required'**
  String get requiredField;

  /// No description provided for @enterStrongPass.
  ///
  /// In en, this message translates to:
  /// **'strong password please'**
  String get enterStrongPass;

  /// No description provided for @samePass.
  ///
  /// In en, this message translates to:
  /// **'same password'**
  String get samePass;

  /// No description provided for @enterValidName.
  ///
  /// In en, this message translates to:
  /// **'enter valid username'**
  String get enterValidName;

  /// No description provided for @mailName.
  ///
  /// In en, this message translates to:
  /// **'E-mail'**
  String get mailName;

  /// No description provided for @passName.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passName;

  /// No description provided for @forgetPass.
  ///
  /// In en, this message translates to:
  /// **'Forget Password?'**
  String get forgetPass;

  /// No description provided for @dntHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t Have Account ?'**
  String get dntHaveAccount;

  /// No description provided for @alreadyHaveOne.
  ///
  /// In en, this message translates to:
  /// **'Already Have Account?'**
  String get alreadyHaveOne;

  /// No description provided for @createOne.
  ///
  /// In en, this message translates to:
  /// **'Create One'**
  String get createOne;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get or;

  /// No description provided for @googleLogin.
  ///
  /// In en, this message translates to:
  /// **'Login With Google'**
  String get googleLogin;

  /// No description provided for @deleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get deleteAccount;

  /// No description provided for @updataAccount.
  ///
  /// In en, this message translates to:
  /// **'Updata Data'**
  String get updataAccount;

  /// No description provided for @verifyEmail.
  ///
  /// In en, this message translates to:
  /// **'Verify Email'**
  String get verifyEmail;

  /// No description provided for @pickAvatar.
  ///
  /// In en, this message translates to:
  /// **'Pick Avatar'**
  String get pickAvatar;

  /// No description provided for @restPass.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get restPass;

  /// No description provided for @action.
  ///
  /// In en, this message translates to:
  /// **'Action'**
  String get action;

  /// No description provided for @seeMore.
  ///
  /// In en, this message translates to:
  /// **'See More'**
  String get seeMore;

  /// No description provided for @nameName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get nameName;

  /// No description provided for @confirmPassName.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get confirmPassName;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already Have Account ?'**
  String get alreadyHaveAccount;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// No description provided for @exit.
  ///
  /// In en, this message translates to:
  /// **'Exit'**
  String get exit;

  /// No description provided for @wishList.
  ///
  /// In en, this message translates to:
  /// **'Wish List'**
  String get wishList;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @watchList.
  ///
  /// In en, this message translates to:
  /// **'Watch List'**
  String get watchList;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @watch.
  ///
  /// In en, this message translates to:
  /// **'Watch'**
  String get watch;

  /// No description provided for @screenShots.
  ///
  /// In en, this message translates to:
  /// **'Screen Shots'**
  String get screenShots;

  /// No description provided for @similar.
  ///
  /// In en, this message translates to:
  /// **'Similar'**
  String get similar;

  /// No description provided for @cast.
  ///
  /// In en, this message translates to:
  /// **'Cast'**
  String get cast;

  /// No description provided for @summary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get summary;

  /// No description provided for @genres.
  ///
  /// In en, this message translates to:
  /// **'Genres'**
  String get genres;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
