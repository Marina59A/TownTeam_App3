// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `HOME`
  String get Home {
    return Intl.message('HOME', name: 'Home', desc: '', args: []);
  }

  /// `MENS`
  String get MENS {
    return Intl.message('MENS', name: 'MENS', desc: '', args: []);
  }

  /// `KIDS`
  String get KIDS {
    return Intl.message('KIDS', name: 'KIDS', desc: '', args: []);
  }

  /// `SUMMER COLLECTION`
  String get SUMMER_COLLECTION {
    return Intl.message(
      'SUMMER COLLECTION',
      name: 'SUMMER_COLLECTION',
      desc: '',
      args: [],
    );
  }

  /// `WINTER COLLECTION`
  String get WINTER_COLLECTION {
    return Intl.message(
      'WINTER COLLECTION',
      name: 'WINTER_COLLECTION',
      desc: '',
      args: [],
    );
  }

  /// `PROMOTIONS`
  String get PROMOTIONS {
    return Intl.message('PROMOTIONS', name: 'PROMOTIONS', desc: '', args: []);
  }

  /// `MY ACCOUNT`
  String get MY_ACCOUNT {
    return Intl.message('MY ACCOUNT', name: 'MY_ACCOUNT', desc: '', args: []);
  }

  /// `CUSTOMER SERVICE`
  String get CUSTOMER_SERVICE {
    return Intl.message(
      'CUSTOMER SERVICE',
      name: 'CUSTOMER_SERVICE',
      desc: '',
      args: [],
    );
  }

  /// `CONTACT US`
  String get CONTACT_US {
    return Intl.message('CONTACT US', name: 'CONTACT_US', desc: '', args: []);
  }

  /// `HOW TO PURCHASE`
  String get HOW_TO_PURCHASE {
    return Intl.message(
      'HOW TO PURCHASE',
      name: 'HOW_TO_PURCHASE',
      desc: '',
      args: [],
    );
  }

  /// `DELIVERY AND RETURNS`
  String get DELIVERY_AND_RETURNS {
    return Intl.message(
      'DELIVERY AND RETURNS',
      name: 'DELIVERY_AND_RETURNS',
      desc: '',
      args: [],
    );
  }

  /// `FACEBOOK`
  String get FACEBOOK {
    return Intl.message('FACEBOOK', name: 'FACEBOOK', desc: '', args: []);
  }

  /// `EMAIL`
  String get EMAIL {
    return Intl.message('EMAIL', name: 'EMAIL', desc: '', args: []);
  }

  /// `Change`
  String get Change {
    return Intl.message('Change', name: 'Change', desc: '', args: []);
  }

  /// `Language`
  String get Language {
    return Intl.message('Language', name: 'Language', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
