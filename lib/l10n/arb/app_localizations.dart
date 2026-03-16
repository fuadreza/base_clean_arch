import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_id.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'arb/app_localizations.dart';
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

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
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
    Locale('en'),
    Locale('id')
  ];

  /// No description provided for @active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active;

  /// No description provided for @activeCashierConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Do you want to finish the active cashier first or continue?'**
  String get activeCashierConfirmation;

  /// No description provided for @accessCashierConfirmationTitle.
  ///
  /// In en, this message translates to:
  /// **'Cashier Access Confirmation'**
  String get accessCashierConfirmationTitle;

  /// No description provided for @accessNewCashierWarning.
  ///
  /// In en, this message translates to:
  /// **'You are trying to access the cashier from a new device. To continue, you need an access code from your Admin or Manager.'**
  String get accessNewCashierWarning;

  /// No description provided for @activate.
  ///
  /// In en, this message translates to:
  /// **'Activate'**
  String get activate;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @allowManualSearch.
  ///
  /// In en, this message translates to:
  /// **'Allow Manual Search by Input'**
  String get allowManualSearch;

  /// No description provided for @allowManualSearchInstruction.
  ///
  /// In en, this message translates to:
  /// **'Activate with Store Manager PIN to allow cashiers to manually type in products (valid until the cashier session is closed).'**
  String get allowManualSearchInstruction;

  /// No description provided for @and.
  ///
  /// In en, this message translates to:
  /// **'and'**
  String get and;

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @applyDiscount.
  ///
  /// In en, this message translates to:
  /// **'Apply Discount'**
  String get applyDiscount;

  /// No description provided for @appliedDiscount.
  ///
  /// In en, this message translates to:
  /// **'Applied Discount'**
  String get appliedDiscount;

  /// No description provided for @authorization.
  ///
  /// In en, this message translates to:
  /// **'Authorization'**
  String get authorization;

  /// No description provided for @authorizeHppPermissionTitle.
  ///
  /// In en, this message translates to:
  /// **'Permission to change price below HPP'**
  String get authorizeHppPermissionTitle;

  /// No description provided for @available.
  ///
  /// In en, this message translates to:
  /// **'Available'**
  String get available;

  /// No description provided for @availablePoints.
  ///
  /// In en, this message translates to:
  /// **'Available Points'**
  String get availablePoints;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @balance.
  ///
  /// In en, this message translates to:
  /// **'Balance'**
  String get balance;

  /// Label for displaying reason of benefit
  ///
  /// In en, this message translates to:
  /// **'because of {benefitX}'**
  String becauseBenefitX(String benefitX);

  /// No description provided for @birthDay.
  ///
  /// In en, this message translates to:
  /// **'Birthday'**
  String get birthDay;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @cashierOpening.
  ///
  /// In en, this message translates to:
  /// **'Opening cashier'**
  String get cashierOpening;

  /// No description provided for @change.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get change;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @confirmAccess.
  ///
  /// In en, this message translates to:
  /// **'Confirm Access'**
  String get confirmAccess;

  /// No description provided for @continueLabel.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueLabel;

  /// No description provided for @currentBenefit.
  ///
  /// In en, this message translates to:
  /// **'Current Benefit'**
  String get currentBenefit;

  /// No description provided for @customer.
  ///
  /// In en, this message translates to:
  /// **'Customer'**
  String get customer;

  /// No description provided for @customerAlreadyMaxTier.
  ///
  /// In en, this message translates to:
  /// **'Customer is already at the highest tier'**
  String get customerAlreadyMaxTier;

  /// No description provided for @customerName.
  ///
  /// In en, this message translates to:
  /// **'Customer Name'**
  String get customerName;

  /// No description provided for @customerPhone.
  ///
  /// In en, this message translates to:
  /// **'Customer Phone'**
  String get customerPhone;

  /// No description provided for @customerProfile.
  ///
  /// In en, this message translates to:
  /// **'Customer Profile'**
  String get customerProfile;

  /// No description provided for @daftarRegister.
  ///
  /// In en, this message translates to:
  /// **'Register List'**
  String get daftarRegister;

  /// No description provided for @deactivate.
  ///
  /// In en, this message translates to:
  /// **'Deactivate'**
  String get deactivate;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @deviceCodeEmpty.
  ///
  /// In en, this message translates to:
  /// **'Please enter the Device Code'**
  String get deviceCodeEmpty;

  /// No description provided for @deviceCodeMinLength.
  ///
  /// In en, this message translates to:
  /// **'Device code must be at least 6 digits'**
  String get deviceCodeMinLength;

  /// No description provided for @discountFromPoints.
  ///
  /// In en, this message translates to:
  /// **'Discount from Points'**
  String get discountFromPoints;

  /// Label for displaying discount from specific points
  ///
  /// In en, this message translates to:
  /// **'Discount from \${pointLabel}'**
  String discountFromX(String pointLabel);

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have account yet?'**
  String get dontHaveAccount;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @errorFetchListRegister.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while fetching the outlet list'**
  String get errorFetchListRegister;

  /// No description provided for @estimatedSave.
  ///
  /// In en, this message translates to:
  /// **'Estimated Save'**
  String get estimatedSave;

  /// Label for displaying expiration date
  ///
  /// In en, this message translates to:
  /// **'expired on {dateX}'**
  String expiredOnX(String dateX);

  /// No description provided for @forgetPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password ?'**
  String get forgetPassword;

  /// No description provided for @help.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get help;

  /// No description provided for @initialCash.
  ///
  /// In en, this message translates to:
  /// **'Initial Cash'**
  String get initialCash;

  /// No description provided for @inputCashDenomination.
  ///
  /// In en, this message translates to:
  /// **'Input cash denomination'**
  String get inputCashDenomination;

  /// No description provided for @inputCashNominal.
  ///
  /// In en, this message translates to:
  /// **'Input cash nominal'**
  String get inputCashNominal;

  /// No description provided for @inputCode.
  ///
  /// In en, this message translates to:
  /// **'Input Code'**
  String get inputCode;

  /// No description provided for @inputEmail.
  ///
  /// In en, this message translates to:
  /// **'Input email'**
  String get inputEmail;

  /// No description provided for @inputPassword.
  ///
  /// In en, this message translates to:
  /// **'Input password'**
  String get inputPassword;

  /// No description provided for @inputPointAmount.
  ///
  /// In en, this message translates to:
  /// **'Input point amount'**
  String get inputPointAmount;

  /// Label for inputting specific point amount
  ///
  /// In en, this message translates to:
  /// **'Input {pointLabel} amount'**
  String inputXPointAmount(String pointLabel);

  /// No description provided for @itemCode.
  ///
  /// In en, this message translates to:
  /// **'Item Code'**
  String get itemCode;

  /// No description provided for @itemName.
  ///
  /// In en, this message translates to:
  /// **'Item Name'**
  String get itemName;

  /// No description provided for @lastActivity.
  ///
  /// In en, this message translates to:
  /// **'Last Activity'**
  String get lastActivity;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @loginInstruction.
  ///
  /// In en, this message translates to:
  /// **'Enter your email and password to log in to Jubelio POS'**
  String get loginInstruction;

  /// No description provided for @loginToJubelio.
  ///
  /// In en, this message translates to:
  /// **'Login to Jubelio account'**
  String get loginToJubelio;

  /// No description provided for @loyaltyAndTier.
  ///
  /// In en, this message translates to:
  /// **'Loyalty Programs & Tier'**
  String get loyaltyAndTier;

  /// No description provided for @maxXRedeemablePointIs.
  ///
  /// In en, this message translates to:
  /// **'Maximum {pointLabel} redeemable is:'**
  String maxXRedeemablePointIs(Object pointLabel);

  /// Label for displaying maximum redeemable points
  ///
  /// In en, this message translates to:
  /// **'Maximum {pointLabel} redeemable is: {pointY}'**
  String maxXRedeemablePointIsY(String pointLabel, String pointY);

  /// No description provided for @memberSince.
  ///
  /// In en, this message translates to:
  /// **'Member since'**
  String get memberSince;

  /// Label for displaying points needed to reach the next tier
  ///
  /// In en, this message translates to:
  /// **'Need {pointX} {pointLabel} to {tierY}'**
  String needXPointToY(String pointX, String pointLabel, String tierY);

  /// No description provided for @neverOpened.
  ///
  /// In en, this message translates to:
  /// **'Never opened'**
  String get neverOpened;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @noBenefitAvailable.
  ///
  /// In en, this message translates to:
  /// **'No benefit available'**
  String get noBenefitAvailable;

  /// No description provided for @noInternetConnection.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get noInternetConnection;

  /// No description provided for @noCashierYet.
  ///
  /// In en, this message translates to:
  /// **'No Cashier Yet'**
  String get noCashierYet;

  /// No description provided for @noCashierAvailableAtTheLocation.
  ///
  /// In en, this message translates to:
  /// **'No cashier available at this location'**
  String get noCashierAvailableAtTheLocation;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get ok;

  /// No description provided for @onboardingDesc1.
  ///
  /// In en, this message translates to:
  /// **'BOPIS (Buy Online Pickup in Store) online purchases that can be picked up directly at the store. BORIS (Buy Online Return in Store) returns directly at the store.'**
  String get onboardingDesc1;

  /// No description provided for @onboardingDesc2.
  ///
  /// In en, this message translates to:
  /// **'Promotion and discount features for one item or transaction. And with the price book you can sell products at different prices.'**
  String get onboardingDesc2;

  /// No description provided for @onboardingDesc3.
  ///
  /// In en, this message translates to:
  /// **'Return of goods or cancellation of previous purchases. Returns have the option for a cash refund or deposited in store credit.'**
  String get onboardingDesc3;

  /// No description provided for @onboardingTitle1.
  ///
  /// In en, this message translates to:
  /// **'BOPIS and BORIS'**
  String get onboardingTitle1;

  /// No description provided for @onboardingTitle2.
  ///
  /// In en, this message translates to:
  /// **'Promotion, Slash Price, and Pricebooks'**
  String get onboardingTitle2;

  /// No description provided for @onboardingTitle3.
  ///
  /// In en, this message translates to:
  /// **'Retur and Refund'**
  String get onboardingTitle3;

  /// No description provided for @openCashier.
  ///
  /// In en, this message translates to:
  /// **'Open Cashier'**
  String get openCashier;

  /// No description provided for @outletNotIntegrated.
  ///
  /// In en, this message translates to:
  /// **'Jubelio POS is not integrated yet'**
  String get outletNotIntegrated;

  /// No description provided for @outletNotFound.
  ///
  /// In en, this message translates to:
  /// **'Outlet not found'**
  String get outletNotFound;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @pickDate.
  ///
  /// In en, this message translates to:
  /// **'Pick Date'**
  String get pickDate;

  /// No description provided for @phoneNumberShort.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phoneNumberShort;

  /// No description provided for @pleaseCallManagerToGetAccessCode.
  ///
  /// In en, this message translates to:
  /// **'Please contact your manager account to provide sales access.'**
  String get pleaseCallManagerToGetAccessCode;

  /// No description provided for @point.
  ///
  /// In en, this message translates to:
  /// **'Point'**
  String get point;

  /// Label for displaying expired points
  ///
  /// In en, this message translates to:
  /// **'{pointLabel} Will Expired'**
  String pointExpired(String pointLabel);

  /// Label for displaying current points
  ///
  /// In en, this message translates to:
  /// **'{pointLabel} Now'**
  String pointNow(String pointLabel);

  /// Label for displaying available points
  ///
  /// In en, this message translates to:
  /// **'{pointLabel} available'**
  String pointXAvailable(String pointLabel);

  /// No description provided for @printLastClosureReceipt.
  ///
  /// In en, this message translates to:
  /// **'Print Cashier Closing Receipt'**
  String get printLastClosureReceipt;

  /// No description provided for @redeem.
  ///
  /// In en, this message translates to:
  /// **'Redeem'**
  String get redeem;

  /// No description provided for @redeemAll.
  ///
  /// In en, this message translates to:
  /// **'Redeem All'**
  String get redeemAll;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @registerLocation.
  ///
  /// In en, this message translates to:
  /// **'Register Location'**
  String get registerLocation;

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// No description provided for @returnNumberShort.
  ///
  /// In en, this message translates to:
  /// **'Return No.'**
  String get returnNumberShort;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @scan.
  ///
  /// In en, this message translates to:
  /// **'Scan'**
  String get scan;

  /// No description provided for @scanBarcode.
  ///
  /// In en, this message translates to:
  /// **'Scan Barcode'**
  String get scanBarcode;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @searchItem.
  ///
  /// In en, this message translates to:
  /// **'Search Item'**
  String get searchItem;

  /// No description provided for @searchLocation.
  ///
  /// In en, this message translates to:
  /// **'Search Location'**
  String get searchLocation;

  /// No description provided for @searchResultNotFound.
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get searchResultNotFound;

  /// No description provided for @selectBirthday.
  ///
  /// In en, this message translates to:
  /// **'Select Birthday'**
  String get selectBirthday;

  /// No description provided for @selectCustomer.
  ///
  /// In en, this message translates to:
  /// **'Select Customer'**
  String get selectCustomer;

  /// No description provided for @setAsPriceChecker.
  ///
  /// In en, this message translates to:
  /// **'Set as Price Checker'**
  String get setAsPriceChecker;

  /// No description provided for @stillActiveCashier.
  ///
  /// In en, this message translates to:
  /// **'There is still an active Cashier.'**
  String get stillActiveCashier;

  /// No description provided for @thisTransactionAutomaticallyGet.
  ///
  /// In en, this message translates to:
  /// **'This transaction will automatically get'**
  String get thisTransactionAutomaticallyGet;

  /// No description provided for @tierProgress.
  ///
  /// In en, this message translates to:
  /// **'Tier Progress'**
  String get tierProgress;

  /// No description provided for @totalConverted.
  ///
  /// In en, this message translates to:
  /// **'Total Converted'**
  String get totalConverted;

  /// No description provided for @transaction.
  ///
  /// In en, this message translates to:
  /// **'Transaction'**
  String get transaction;

  /// No description provided for @transactionNumberShort.
  ///
  /// In en, this message translates to:
  /// **'Transaction No.'**
  String get transactionNumberShort;

  /// No description provided for @transactionSearch.
  ///
  /// In en, this message translates to:
  /// **'Search Transaction'**
  String get transactionSearch;

  /// No description provided for @transactionNotPaid.
  ///
  /// In en, this message translates to:
  /// **'Not Paid'**
  String get transactionNotPaid;

  /// No description provided for @transactionNotSync.
  ///
  /// In en, this message translates to:
  /// **'Not Synced'**
  String get transactionNotSync;

  /// No description provided for @transactionQRISNotPaid.
  ///
  /// In en, this message translates to:
  /// **'Not Paid (QRIS)'**
  String get transactionQRISNotPaid;

  /// No description provided for @turnOnInternetToContinue.
  ///
  /// In en, this message translates to:
  /// **'Please enable your internet connection to continue'**
  String get turnOnInternetToContinue;

  /// No description provided for @unlimited.
  ///
  /// In en, this message translates to:
  /// **'Unlimited'**
  String get unlimited;

  /// No description provided for @useAll.
  ///
  /// In en, this message translates to:
  /// **'Use All'**
  String get useAll;

  /// No description provided for @useLoyaltyPoints.
  ///
  /// In en, this message translates to:
  /// **'Use Loyalty Points'**
  String get useLoyaltyPoints;

  /// Label for displaying loyalty points to be used
  ///
  /// In en, this message translates to:
  /// **'Use {pointLabel} {loyaltyName}'**
  String useLoyaltyXPointY(String pointLabel, String loyaltyName);

  /// No description provided for @warning.
  ///
  /// In en, this message translates to:
  /// **'Warning'**
  String get warning;

  /// No description provided for @warningPriceBelowHpp.
  ///
  /// In en, this message translates to:
  /// **'The selling price must not be lower than the HPP according to store settings.'**
  String get warningPriceBelowHpp;

  /// No description provided for @warningPriceBelowHppConfirmation.
  ///
  /// In en, this message translates to:
  /// **'The selling price is below the HPP. Are you sure you want to continue?'**
  String get warningPriceBelowHppConfirmation;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// Label for displaying points that will expire
  ///
  /// In en, this message translates to:
  /// **'will expired on {dateX}'**
  String willExpiredOnX(String dateX);

  /// Label for displaying available points
  ///
  /// In en, this message translates to:
  /// **'{name} Available'**
  String xAvailable(String name);

  /// Label for displaying available points conversion
  ///
  /// In en, this message translates to:
  /// **'{point} {pointName} available, 1 {pointName} = {pointZ}'**
  String xYAvailableZ(int point, String pointName, String pointZ);

  /// Label for displaying X to Y message
  ///
  /// In en, this message translates to:
  /// **'{X} to {Y}'**
  String xToY(String X, String Y);

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @yesContinue.
  ///
  /// In en, this message translates to:
  /// **'Yes, Continue'**
  String get yesContinue;
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
      <String>['en', 'id'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'id':
      return AppLocalizationsId();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
