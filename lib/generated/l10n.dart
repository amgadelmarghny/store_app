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
    final name =
        (locale.countryCode?.isEmpty ?? false)
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

  /// `Sauqni`
  String get app_name {
    return Intl.message('Sauqni', name: 'app_name', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Favorites`
  String get favorites {
    return Intl.message('Favorites', name: 'favorites', desc: '', args: []);
  }

  /// `Categories`
  String get categories {
    return Intl.message('Categories', name: 'categories', desc: '', args: []);
  }

  /// `Products`
  String get products {
    return Intl.message('Products', name: 'products', desc: '', args: []);
  }

  /// `Discount`
  String get discount {
    return Intl.message('Discount', name: 'discount', desc: '', args: []);
  }

  /// `Cart`
  String get cart {
    return Intl.message('Cart', name: 'cart', desc: '', args: []);
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Welcome !`
  String get welcome {
    return Intl.message('Welcome !', name: 'welcome', desc: '', args: []);
  }

  /// `Please login with your personal information.`
  String get please_login_with_your_personal_information {
    return Intl.message(
      'Please login with your personal information.',
      name: 'please_login_with_your_personal_information',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Phone`
  String get phone {
    return Intl.message('Phone', name: 'phone', desc: '', args: []);
  }

  /// `Forgot Password`
  String get forgot_password {
    return Intl.message(
      'Forgot Password',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
  }

  /// `Create Your Account`
  String get create_your_account {
    return Intl.message(
      'Create Your Account',
      name: 'create_your_account',
      desc: '',
      args: [],
    );
  }

  /// `Creat an account so your can shop`
  String get create_an_account_so_you_can_shop {
    return Intl.message(
      'Creat an account so your can shop',
      name: 'create_an_account_so_you_can_shop',
      desc: '',
      args: [],
    );
  }

  /// `from your comfortable home.`
  String get from_ypur_comfortable_home {
    return Intl.message(
      'from your comfortable home.',
      name: 'from_ypur_comfortable_home',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dont_have_an_account {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dont_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Already have account?`
  String get already_have_account {
    return Intl.message(
      'Already have account?',
      name: 'already_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get change_password {
    return Intl.message(
      'Change Password',
      name: 'change_password',
      desc: '',
      args: [],
    );
  }

  /// `Current Password`
  String get current_password {
    return Intl.message(
      'Current Password',
      name: 'current_password',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get new_password {
    return Intl.message(
      'New Password',
      name: 'new_password',
      desc: '',
      args: [],
    );
  }

  /// `Update Password`
  String get update_password {
    return Intl.message(
      'Update Password',
      name: 'update_password',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `modify profile`
  String get modify_profile {
    return Intl.message(
      'modify profile',
      name: 'modify_profile',
      desc: '',
      args: [],
    );
  }

  /// `Choose from library`
  String get choose_from_library {
    return Intl.message(
      'Choose from library',
      name: 'choose_from_library',
      desc: '',
      args: [],
    );
  }

  /// `Take new photo`
  String get take_new_photo {
    return Intl.message(
      'Take new photo',
      name: 'take_new_photo',
      desc: '',
      args: [],
    );
  }

  /// `Modify`
  String get modify {
    return Intl.message('Modify', name: 'modify', desc: '', args: []);
  }

  /// `Search for what you want`
  String get search_for_what_you_want {
    return Intl.message(
      'Search for what you want',
      name: 'search_for_what_you_want',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message('Price', name: 'price', desc: '', args: []);
  }

  /// `Read more`
  String get read_more {
    return Intl.message('Read more', name: 'read_more', desc: '', args: []);
  }

  /// `Read less`
  String get read_less {
    return Intl.message('Read less', name: 'read_less', desc: '', args: []);
  }

  /// `Add to Cart`
  String get add_to_cart {
    return Intl.message('Add to Cart', name: 'add_to_cart', desc: '', args: []);
  }

  /// `the order has been successfully cancelled`
  String get the_order_has_been_deleted_ssuccessfully {
    return Intl.message(
      'the order has been successfully cancelled',
      name: 'the_order_has_been_deleted_ssuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `cacelled orders`
  String get cancelled_orders {
    return Intl.message(
      'cacelled orders',
      name: 'cancelled_orders',
      desc: '',
      args: [],
    );
  }

  /// `Order Details`
  String get order_details {
    return Intl.message(
      'Order Details',
      name: 'order_details',
      desc: '',
      args: [],
    );
  }

  /// `Remove from Cart`
  String get remove_from_cart {
    return Intl.message(
      'Remove from Cart',
      name: 'remove_from_cart',
      desc: '',
      args: [],
    );
  }

  /// `My Cart`
  String get my_cart {
    return Intl.message('My Cart', name: 'my_cart', desc: '', args: []);
  }

  /// `The cart is empty`
  String get the_cart_is_empty {
    return Intl.message(
      'The cart is empty',
      name: 'the_cart_is_empty',
      desc: '',
      args: [],
    );
  }

  /// `Payment method`
  String get payment_method {
    return Intl.message(
      'Payment method',
      name: 'payment_method',
      desc: '',
      args: [],
    );
  }

  /// `FIELD IS EMPTY`
  String get field_is_empty {
    return Intl.message(
      'FIELD IS EMPTY',
      name: 'field_is_empty',
      desc: '',
      args: [],
    );
  }

  /// `Explore many products`
  String get explore_many_products {
    return Intl.message(
      'Explore many products',
      name: 'explore_many_products',
      desc: '',
      args: [],
    );
  }

  /// `All you need in one app`
  String get all_you_need_in_one_app {
    return Intl.message(
      'All you need in one app',
      name: 'all_you_need_in_one_app',
      desc: '',
      args: [],
    );
  }

  /// `Choose and Checkout`
  String get choose_and_checkout {
    return Intl.message(
      'Choose and Checkout',
      name: 'choose_and_checkout',
      desc: '',
      args: [],
    );
  }

  /// `Buy and order what you want from home`
  String get buy_and_order_what_you_want_from_home {
    return Intl.message(
      'Buy and order what you want from home',
      name: 'buy_and_order_what_you_want_from_home',
      desc: '',
      args: [],
    );
  }

  /// `Offers and discounts`
  String get offers_and_discounts {
    return Intl.message(
      'Offers and discounts',
      name: 'offers_and_discounts',
      desc: '',
      args: [],
    );
  }

  /// `Enjoy special discounts`
  String get enjoy_special_discounts {
    return Intl.message(
      'Enjoy special discounts',
      name: 'enjoy_special_discounts',
      desc: '',
      args: [],
    );
  }

  /// `Cash`
  String get cash {
    return Intl.message('Cash', name: 'cash', desc: '', args: []);
  }

  /// `Credit/Debit Card`
  String get card {
    return Intl.message('Credit/Debit Card', name: 'card', desc: '', args: []);
  }

  /// `PayPal`
  String get paypal {
    return Intl.message('PayPal', name: 'paypal', desc: '', args: []);
  }

  /// `Address`
  String get address {
    return Intl.message('Address', name: 'address', desc: '', args: []);
  }

  /// `My Addresses`
  String get my_addresses {
    return Intl.message(
      'My Addresses',
      name: 'my_addresses',
      desc: '',
      args: [],
    );
  }

  /// `Modify Address`
  String get modify_address {
    return Intl.message(
      'Modify Address',
      name: 'modify_address',
      desc: '',
      args: [],
    );
  }

  /// `Total Addresses :`
  String get total_addresses {
    return Intl.message(
      'Total Addresses :',
      name: 'total_addresses',
      desc: '',
      args: [],
    );
  }

  /// `Add new address`
  String get add_new_address {
    return Intl.message(
      'Add new address',
      name: 'add_new_address',
      desc: '',
      args: [],
    );
  }

  /// `Add your address`
  String get add_your_address {
    return Intl.message(
      'Add your address',
      name: 'add_your_address',
      desc: '',
      args: [],
    );
  }

  /// `The payment method has not been completed yet`
  String get the_payment_method_has_not_been_completed_yet {
    return Intl.message(
      'The payment method has not been completed yet',
      name: 'the_payment_method_has_not_been_completed_yet',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `City`
  String get city {
    return Intl.message('City', name: 'city', desc: '', args: []);
  }

  /// `Region`
  String get region {
    return Intl.message('Region', name: 'region', desc: '', args: []);
  }

  /// `Details`
  String get details {
    return Intl.message('Details', name: 'details', desc: '', args: []);
  }

  /// `message`
  String get message {
    return Intl.message('message', name: 'message', desc: '', args: []);
  }

  /// `Notes`
  String get Notes {
    return Intl.message('Notes', name: 'Notes', desc: '', args: []);
  }

  /// `is required`
  String get is_required {
    return Intl.message('is required', name: 'is_required', desc: '', args: []);
  }

  /// `Total Coast`
  String get total_coast {
    return Intl.message('Total Coast', name: 'total_coast', desc: '', args: []);
  }

  /// `ID`
  String get id {
    return Intl.message('ID', name: 'id', desc: '', args: []);
  }

  /// `Old price`
  String get old_price {
    return Intl.message('Old price', name: 'old_price', desc: '', args: []);
  }

  /// `Place order`
  String get place_order {
    return Intl.message('Place order', name: 'place_order', desc: '', args: []);
  }

  /// `Make Order`
  String get make_order {
    return Intl.message('Make Order', name: 'make_order', desc: '', args: []);
  }

  /// `Your Order is Confirmed!`
  String get your_order_is_confirmed {
    return Intl.message(
      'Your Order is Confirmed!',
      name: 'your_order_is_confirmed',
      desc: '',
      args: [],
    );
  }

  /// `There is no favorites yet!`
  String get the_is_no_favorites_yet {
    return Intl.message(
      'There is no favorites yet!',
      name: 'the_is_no_favorites_yet',
      desc: '',
      args: [],
    );
  }

  /// `Back to Home`
  String get back_to_home {
    return Intl.message(
      'Back to Home',
      name: 'back_to_home',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `Complaint`
  String get complaint {
    return Intl.message('Complaint', name: 'complaint', desc: '', args: []);
  }

  /// `What's the problem you are facting`
  String get what_is_the_problem_you_are_facting {
    return Intl.message(
      'What\'s the problem you are facting',
      name: 'what_is_the_problem_you_are_facting',
      desc: '',
      args: [],
    );
  }

  /// `Complaint number: `
  String get complaint_number {
    return Intl.message(
      'Complaint number: ',
      name: 'complaint_number',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message('Send', name: 'send', desc: '', args: []);
  }

  /// `Ok`
  String get ok {
    return Intl.message('Ok', name: 'ok', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Theme (Light , Dark)`
  String get theme {
    return Intl.message(
      'Theme (Light , Dark)',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `Language (En , Ar)`
  String get language {
    return Intl.message(
      'Language (En , Ar)',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `My Orders`
  String get my_orders {
    return Intl.message('My Orders', name: 'my_orders', desc: '', args: []);
  }

  /// `New`
  String get new_keyword {
    return Intl.message('New', name: 'new_keyword', desc: '', args: []);
  }

  /// `Cancelled`
  String get cancelled {
    return Intl.message('Cancelled', name: 'cancelled', desc: '', args: []);
  }

  /// `Order ID:`
  String get order_id {
    return Intl.message('Order ID:', name: 'order_id', desc: '', args: []);
  }

  /// `orders`
  String get orders {
    return Intl.message('orders', name: 'orders', desc: '', args: []);
  }

  /// `Status`
  String get status {
    return Intl.message('Status', name: 'status', desc: '', args: []);
  }

  /// `quantity`
  String get quantity {
    return Intl.message('quantity', name: 'quantity', desc: '', args: []);
  }

  /// `Coast`
  String get coast {
    return Intl.message('Coast', name: 'coast', desc: '', args: []);
  }

  /// `Vat`
  String get vat {
    return Intl.message('Vat', name: 'vat', desc: '', args: []);
  }

  /// `Not available yet`
  String get not_available_yet {
    return Intl.message(
      'Not available yet',
      name: 'not_available_yet',
      desc: '',
      args: [],
    );
  }

  /// `There is no`
  String get there_is_no {
    return Intl.message('There is no', name: 'there_is_no', desc: '', args: []);
  }

  /// `Somting went wrong`
  String get somthing_went_wrong {
    return Intl.message(
      'Somting went wrong',
      name: 'somthing_went_wrong',
      desc: '',
      args: [],
    );
  }

  /// `Please try again later`
  String get please_try_again_later {
    return Intl.message(
      'Please try again later',
      name: 'please_try_again_later',
      desc: '',
      args: [],
    );
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
