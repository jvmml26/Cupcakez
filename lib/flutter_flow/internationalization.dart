import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'pt'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? ptText = '',
  }) =>
      [enText, ptText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Login
  {
    'rtzgfeqr': {
      'en': 'Cupcakez',
      'pt': '',
    },
    'g4sfen60': {
      'en': 'Sign In',
      'pt': '',
    },
    'fsc4r2fe': {
      'en': 'Create Account',
      'pt': '',
    },
    'xksqby8y': {
      'en': 'Let\'s get started ',
      'pt': '',
    },
    'oow5njxd': {
      'en': 'Email',
      'pt': '',
    },
    '1chqldoa': {
      'en': 'Password',
      'pt': '',
    },
    '7w5sgvfm': {
      'en': 'Confirm Password',
      'pt': '',
    },
    '2it51dyu': {
      'en': 'Get Started',
      'pt': '',
    },
    '6ttwvqrm': {
      'en': 'Or sign up with',
      'pt': '',
    },
    'kpoh53p3': {
      'en': 'Continue with Google',
      'pt': '',
    },
    'ymw31flg': {
      'en': 'Forgot Password?',
      'pt': '',
    },
    'don3gez2': {
      'en': 'Sign Up',
      'pt': '',
    },
    '2s4xmcsn': {
      'en': 'Welcome Back',
      'pt': '',
    },
    'qncy0zrp': {
      'en': 'Fill out the information below in order to access your account.',
      'pt': '',
    },
    'hyej25ww': {
      'en': 'Email',
      'pt': '',
    },
    'ykxfu8di': {
      'en': 'Password',
      'pt': '',
    },
    'r7jl17wq': {
      'en': 'Sign Up',
      'pt': '',
    },
    'hglyya44': {
      'en': 'Or sign in with',
      'pt': '',
    },
    '9eb01euh': {
      'en': 'Continue with Google',
      'pt': '',
    },
    'h2tl16u0': {
      'en': 'Login',
      'pt': '',
    },
    'n96wubbi': {
      'en': 'Home',
      'pt': '',
    },
  },
  // home
  {
    '98tqgmi4': {
      'en': 'Cupcakez',
      'pt': '',
    },
    'qt5shncf': {
      'en': 'Find your new favorite cupcake',
      'pt': '',
    },
    'g04vct1k': {
      'en': 'Search for your cupcake ...',
      'pt': '',
    },
    'njib7s4a': {
      'en': 'Popular Cupcakes',
      'pt': '',
    },
    '6l1ct6pi': {
      'en': 'Home',
      'pt': '',
    },
  },
  // profile
  {
    '972drtky': {
      'en': 'Edit Profile',
      'pt': '',
    },
    '6c2iq8hm': {
      'en': 'Account Settings',
      'pt': '',
    },
    'asjddpta': {
      'en': 'Log Out',
      'pt': '',
    },
    'k59j4wah': {
      'en': 'Page Title',
      'pt': '',
    },
    '97f0831e': {
      'en': '__',
      'pt': '',
    },
  },
  // Checkout
  {
    'drxcyjaj': {
      'en': 'Below are the items in your cart.',
      'pt': '',
    },
    'gqe11w3l': {
      'en': 'Zion 1',
      'pt': '',
    },
    'v9wqtcca': {
      'en': '\$120.00',
      'pt': '',
    },
    'eppqb865': {
      'en': 'Quanity: 1',
      'pt': '',
    },
    '650omlor': {
      'en': 'Jumpsuit',
      'pt': '',
    },
    'r2mbej0h': {
      'en': '\$120.00',
      'pt': '',
    },
    '7emdz0sw': {
      'en': 'Quanity: 1',
      'pt': '',
    },
    'fqsjqzu7': {
      'en': 'Price Breakdown',
      'pt': '',
    },
    'zycmyu0d': {
      'en': 'Total',
      'pt': '',
    },
    'e4nbomjr': {
      'en': 'Checkout',
      'pt': '',
    },
    'ip7b0cuc': {
      'en': 'My Cart',
      'pt': '',
    },
    'rldzd4mh': {
      'en': 'Home',
      'pt': '',
    },
  },
  // Miscellaneous
  {
    'cxd88v3j': {
      'en': 'Please let us notify you about your purchases and delivery',
      'pt': '',
    },
    'fbj58a4r': {
      'en': 'Do you want to login next time with biometrics?',
      'pt': '',
    },
    'k2xvr9o5': {
      'en': '',
      'pt': '',
    },
    'nrz6rjoy': {
      'en': '',
      'pt': '',
    },
    'iotog4ql': {
      'en': '',
      'pt': '',
    },
    'l1tkkap1': {
      'en': '',
      'pt': '',
    },
    'i4wsg4p0': {
      'en': '',
      'pt': '',
    },
    'zsqwgn70': {
      'en': '',
      'pt': '',
    },
    '04sz3p4x': {
      'en': '',
      'pt': '',
    },
    'fm6n9vkm': {
      'en': '',
      'pt': '',
    },
    '6cjzpxou': {
      'en': '',
      'pt': '',
    },
    'tp4fjk7n': {
      'en': '',
      'pt': '',
    },
    'd91qvt2b': {
      'en': '',
      'pt': '',
    },
    'xpf72ftv': {
      'en': '',
      'pt': '',
    },
    'uyf1u9s3': {
      'en': '',
      'pt': '',
    },
    'n0smrp3p': {
      'en': '',
      'pt': '',
    },
    'd86b8mma': {
      'en': '',
      'pt': '',
    },
    '1nc46h6w': {
      'en': '',
      'pt': '',
    },
    'ywegqo56': {
      'en': '',
      'pt': '',
    },
    'd7tuumqa': {
      'en': '',
      'pt': '',
    },
    'krrm8b3e': {
      'en': '',
      'pt': '',
    },
    '4k8jq41p': {
      'en': '',
      'pt': '',
    },
    '1ypm0lyu': {
      'en': '',
      'pt': '',
    },
    'hblkgq6e': {
      'en': '',
      'pt': '',
    },
    '5666ic20': {
      'en': '',
      'pt': '',
    },
  },
].reduce((a, b) => a..addAll(b));
