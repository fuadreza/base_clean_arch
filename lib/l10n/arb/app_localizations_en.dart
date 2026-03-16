// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get active => 'Active';

  @override
  String get activeCashierConfirmation =>
      'Do you want to finish the active cashier first or continue?';

  @override
  String get accessCashierConfirmationTitle => 'Cashier Access Confirmation';

  @override
  String get accessNewCashierWarning =>
      'You are trying to access the cashier from a new device. To continue, you need an access code from your Admin or Manager.';

  @override
  String get activate => 'Activate';

  @override
  String get all => 'All';

  @override
  String get allowManualSearch => 'Allow Manual Search by Input';

  @override
  String get allowManualSearchInstruction =>
      'Activate with Store Manager PIN to allow cashiers to manually type in products (valid until the cashier session is closed).';

  @override
  String get and => 'and';

  @override
  String get apply => 'Apply';

  @override
  String get applyDiscount => 'Apply Discount';

  @override
  String get appliedDiscount => 'Applied Discount';

  @override
  String get authorization => 'Authorization';

  @override
  String get authorizeHppPermissionTitle =>
      'Permission to change price below HPP';

  @override
  String get available => 'Available';

  @override
  String get availablePoints => 'Available Points';

  @override
  String get back => 'Back';

  @override
  String get balance => 'Balance';

  @override
  String becauseBenefitX(String benefitX) {
    return 'because of $benefitX';
  }

  @override
  String get birthDay => 'Birthday';

  @override
  String get cancel => 'Cancel';

  @override
  String get cashierOpening => 'Opening cashier';

  @override
  String get change => 'Change';

  @override
  String get close => 'Close';

  @override
  String get confirmAccess => 'Confirm Access';

  @override
  String get continueLabel => 'Continue';

  @override
  String get currentBenefit => 'Current Benefit';

  @override
  String get customer => 'Customer';

  @override
  String get customerAlreadyMaxTier =>
      'Customer is already at the highest tier';

  @override
  String get customerName => 'Customer Name';

  @override
  String get customerPhone => 'Customer Phone';

  @override
  String get customerProfile => 'Customer Profile';

  @override
  String get daftarRegister => 'Register List';

  @override
  String get deactivate => 'Deactivate';

  @override
  String get delete => 'Delete';

  @override
  String get deviceCodeEmpty => 'Please enter the Device Code';

  @override
  String get deviceCodeMinLength => 'Device code must be at least 6 digits';

  @override
  String get discountFromPoints => 'Discount from Points';

  @override
  String discountFromX(String pointLabel) {
    return 'Discount from \$$pointLabel';
  }

  @override
  String get dontHaveAccount => 'Don\'t have account yet?';

  @override
  String get email => 'Email';

  @override
  String get errorFetchListRegister =>
      'An error occurred while fetching the outlet list';

  @override
  String get estimatedSave => 'Estimated Save';

  @override
  String expiredOnX(String dateX) {
    return 'expired on $dateX';
  }

  @override
  String get forgetPassword => 'Forgot Password ?';

  @override
  String get help => 'Help';

  @override
  String get initialCash => 'Initial Cash';

  @override
  String get inputCashDenomination => 'Input cash denomination';

  @override
  String get inputCashNominal => 'Input cash nominal';

  @override
  String get inputCode => 'Input Code';

  @override
  String get inputEmail => 'Input email';

  @override
  String get inputPassword => 'Input password';

  @override
  String get inputPointAmount => 'Input point amount';

  @override
  String inputXPointAmount(String pointLabel) {
    return 'Input $pointLabel amount';
  }

  @override
  String get itemCode => 'Item Code';

  @override
  String get itemName => 'Item Name';

  @override
  String get lastActivity => 'Last Activity';

  @override
  String get login => 'Login';

  @override
  String get loginInstruction =>
      'Enter your email and password to log in to Jubelio POS';

  @override
  String get loginToJubelio => 'Login to Jubelio account';

  @override
  String get loyaltyAndTier => 'Loyalty Programs & Tier';

  @override
  String maxXRedeemablePointIs(Object pointLabel) {
    return 'Maximum $pointLabel redeemable is:';
  }

  @override
  String maxXRedeemablePointIsY(String pointLabel, String pointY) {
    return 'Maximum $pointLabel redeemable is: $pointY';
  }

  @override
  String get memberSince => 'Member since';

  @override
  String needXPointToY(String pointX, String pointLabel, String tierY) {
    return 'Need $pointX $pointLabel to $tierY';
  }

  @override
  String get neverOpened => 'Never opened';

  @override
  String get no => 'No';

  @override
  String get noBenefitAvailable => 'No benefit available';

  @override
  String get noInternetConnection => 'No internet connection';

  @override
  String get noCashierYet => 'No Cashier Yet';

  @override
  String get noCashierAvailableAtTheLocation =>
      'No cashier available at this location';

  @override
  String get ok => 'Ok';

  @override
  String get onboardingDesc1 =>
      'BOPIS (Buy Online Pickup in Store) online purchases that can be picked up directly at the store. BORIS (Buy Online Return in Store) returns directly at the store.';

  @override
  String get onboardingDesc2 =>
      'Promotion and discount features for one item or transaction. And with the price book you can sell products at different prices.';

  @override
  String get onboardingDesc3 =>
      'Return of goods or cancellation of previous purchases. Returns have the option for a cash refund or deposited in store credit.';

  @override
  String get onboardingTitle1 => 'BOPIS and BORIS';

  @override
  String get onboardingTitle2 => 'Promotion, Slash Price, and Pricebooks';

  @override
  String get onboardingTitle3 => 'Retur and Refund';

  @override
  String get openCashier => 'Open Cashier';

  @override
  String get outletNotIntegrated => 'Jubelio POS is not integrated yet';

  @override
  String get outletNotFound => 'Outlet not found';

  @override
  String get password => 'Password';

  @override
  String get pickDate => 'Pick Date';

  @override
  String get phoneNumberShort => 'Phone';

  @override
  String get pleaseCallManagerToGetAccessCode =>
      'Please contact your manager account to provide sales access.';

  @override
  String get point => 'Point';

  @override
  String pointExpired(String pointLabel) {
    return '$pointLabel Will Expired';
  }

  @override
  String pointNow(String pointLabel) {
    return '$pointLabel Now';
  }

  @override
  String pointXAvailable(String pointLabel) {
    return '$pointLabel available';
  }

  @override
  String get printLastClosureReceipt => 'Print Cashier Closing Receipt';

  @override
  String get redeem => 'Redeem';

  @override
  String get redeemAll => 'Redeem All';

  @override
  String get register => 'Register';

  @override
  String get registerLocation => 'Register Location';

  @override
  String get reset => 'Reset';

  @override
  String get returnNumberShort => 'Return No.';

  @override
  String get save => 'Save';

  @override
  String get scan => 'Scan';

  @override
  String get scanBarcode => 'Scan Barcode';

  @override
  String get search => 'Search';

  @override
  String get searchItem => 'Search Item';

  @override
  String get searchLocation => 'Search Location';

  @override
  String get searchResultNotFound => 'No results found';

  @override
  String get selectBirthday => 'Select Birthday';

  @override
  String get selectCustomer => 'Select Customer';

  @override
  String get setAsPriceChecker => 'Set as Price Checker';

  @override
  String get stillActiveCashier => 'There is still an active Cashier.';

  @override
  String get thisTransactionAutomaticallyGet =>
      'This transaction will automatically get';

  @override
  String get tierProgress => 'Tier Progress';

  @override
  String get totalConverted => 'Total Converted';

  @override
  String get transaction => 'Transaction';

  @override
  String get transactionNumberShort => 'Transaction No.';

  @override
  String get transactionSearch => 'Search Transaction';

  @override
  String get transactionNotPaid => 'Not Paid';

  @override
  String get transactionNotSync => 'Not Synced';

  @override
  String get transactionQRISNotPaid => 'Not Paid (QRIS)';

  @override
  String get turnOnInternetToContinue =>
      'Please enable your internet connection to continue';

  @override
  String get unlimited => 'Unlimited';

  @override
  String get useAll => 'Use All';

  @override
  String get useLoyaltyPoints => 'Use Loyalty Points';

  @override
  String useLoyaltyXPointY(String pointLabel, String loyaltyName) {
    return 'Use $pointLabel $loyaltyName';
  }

  @override
  String get warning => 'Warning';

  @override
  String get warningPriceBelowHpp =>
      'The selling price must not be lower than the HPP according to store settings.';

  @override
  String get warningPriceBelowHppConfirmation =>
      'The selling price is below the HPP. Are you sure you want to continue?';

  @override
  String get welcome => 'Welcome';

  @override
  String willExpiredOnX(String dateX) {
    return 'will expired on $dateX';
  }

  @override
  String xAvailable(String name) {
    return '$name Available';
  }

  @override
  String xYAvailableZ(int point, String pointName, String pointZ) {
    return '$point $pointName available, 1 $pointName = $pointZ';
  }

  @override
  String xToY(String X, String Y) {
    return '$X to $Y';
  }

  @override
  String get yes => 'Yes';

  @override
  String get yesContinue => 'Yes, Continue';
}
