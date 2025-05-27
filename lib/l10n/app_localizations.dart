import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';

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
/// To configure the locales supported by your app, you'll need to edit this
/// file.
///
/// First, open your project's ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project's Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

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
    Locale('en')
  ];

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'Home': 'HOME',
      'MENS': 'MENS',
      'KIDS': 'KIDS',
      'SUMMER_COLLECTION': 'SUMMER COLLECTION',
      'WINTER_COLLECTION': 'WINTER COLLECTION',
      'PROMOTIONS': 'PROMOTIONS',
      'MY_ACCOUNT': 'MY ACCOUNT',
      'CUSTOMER_SERVICE': 'CUSTOMER SERVICE',
      'CONTACT_US': 'CONTACT US',
      'HOW_TO_PURCHASE': 'HOW TO PURCHASE',
      'DELIVERY_AND_RETURNS': 'DELIVERY AND RETURNS',
      'FACEBOOK': 'FACEBOOK',
      'EMAIL': 'EMAIL',
      'Change': 'Change',
      'Language': 'Language',
    },
    'ar': {
      'Home': 'الرئيسية',
      'MENS': 'رجالي',
      'KIDS': 'أطفال',
      'SUMMER_COLLECTION': 'تشكيلة الصيف',
      'WINTER_COLLECTION': 'تشكيلة الشتاء',
      'PROMOTIONS': 'العروض',
      'MY_ACCOUNT': 'حسابي',
      'CUSTOMER_SERVICE': 'خدمة العملاء',
      'CONTACT_US': 'اتصل بنا',
      'HOW_TO_PURCHASE': 'كيفية الشراء',
      'DELIVERY_AND_RETURNS': 'التوصيل والمرتجعات',
      'FACEBOOK': 'فيسبوك',
      'EMAIL': 'البريد الإلكتروني',
      'Change': 'تغيير',
      'Language': 'اللغة',
    },
  };

  String get Home => _localizedValues[locale.languageCode]!['Home']!;
  String get MENS => _localizedValues[locale.languageCode]!['MENS']!;
  String get KIDS => _localizedValues[locale.languageCode]!['KIDS']!;
  String get SUMMER_COLLECTION =>
      _localizedValues[locale.languageCode]!['SUMMER_COLLECTION']!;
  String get WINTER_COLLECTION =>
      _localizedValues[locale.languageCode]!['WINTER_COLLECTION']!;
  String get PROMOTIONS =>
      _localizedValues[locale.languageCode]!['PROMOTIONS']!;
  String get MY_ACCOUNT =>
      _localizedValues[locale.languageCode]!['MY_ACCOUNT']!;
  String get CUSTOMER_SERVICE =>
      _localizedValues[locale.languageCode]!['CUSTOMER_SERVICE']!;
  String get CONTACT_US =>
      _localizedValues[locale.languageCode]!['CONTACT_US']!;
  String get HOW_TO_PURCHASE =>
      _localizedValues[locale.languageCode]!['HOW_TO_PURCHASE']!;
  String get DELIVERY_AND_RETURNS =>
      _localizedValues[locale.languageCode]!['DELIVERY_AND_RETURNS']!;
  String get FACEBOOK => _localizedValues[locale.languageCode]!['FACEBOOK']!;
  String get EMAIL => _localizedValues[locale.languageCode]!['EMAIL']!;
  String get Change => _localizedValues[locale.languageCode]!['Change']!;
  String get Language => _localizedValues[locale.languageCode]!['Language']!;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

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
      'that was used.');
}
