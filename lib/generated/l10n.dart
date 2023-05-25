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
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Just now`
  String get justNow {
    return Intl.message(
      'Just now',
      name: 'justNow',
      desc: '',
      args: [],
    );
  }

  /// `Pine Banking`
  String get pineBanking {
    return Intl.message(
      'Pine Banking',
      name: 'pineBanking',
      desc: '',
      args: [],
    );
  }

  /// `Intuitive\nBanking,\nAccelerating\nBusiness\nMomentum`
  String get intuitiveBankingAcceleratingBusinessMomentum {
    return Intl.message(
      'Intuitive\nBanking,\nAccelerating\nBusiness\nMomentum',
      name: 'intuitiveBankingAcceleratingBusinessMomentum',
      desc: '',
      args: [],
    );
  }

  /// `Get started`
  String get getStarted {
    return Intl.message(
      'Get started',
      name: 'getStarted',
      desc: '',
      args: [],
    );
  }

  /// `Provide your company\ndetails`
  String get provideYourCompany {
    return Intl.message(
      'Provide your company\ndetails',
      name: 'provideYourCompany',
      desc: '',
      args: [],
    );
  }

  /// `To open a new accountt`
  String get toOpenANewAccount {
    return Intl.message(
      'To open a new accountt',
      name: 'toOpenANewAccount',
      desc: '',
      args: [],
    );
  }

  /// `Scan the license`
  String get scanTheLicense {
    return Intl.message(
      'Scan the license',
      name: 'scanTheLicense',
      desc: '',
      args: [],
    );
  }

  /// `Register a company`
  String get registerACompany {
    return Intl.message(
      'Register a company',
      name: 'registerACompany',
      desc: '',
      args: [],
    );
  }

  /// `The front side of the document`
  String get theFrontSideOfTheDocument {
    return Intl.message(
      'The front side of the document',
      name: 'theFrontSideOfTheDocument',
      desc: '',
      args: [],
    );
  }

  /// `All four corners must fit into the\nframe`
  String get allFourCornersMustFitIntoTheFrame {
    return Intl.message(
      'All four corners must fit into the\nframe',
      name: 'allFourCornersMustFitIntoTheFrame',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number`
  String get enterYourPhoneNumber {
    return Intl.message(
      'Enter your phone number',
      name: 'enterYourPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `To log in or sign up`
  String get toLogInOrSignUp {
    return Intl.message(
      'To log in or sign up',
      name: 'toLogInOrSignUp',
      desc: '',
      args: [],
    );
  }

  /// `Enter phone number`
  String get enterPhoneNumber {
    return Intl.message(
      'Enter phone number',
      name: 'enterPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `By clicking "Next" you consent to the\nprocessing of personal data`
  String get byClickingNext {
    return Intl.message(
      'By clicking "Next" you consent to the\nprocessing of personal data',
      name: 'byClickingNext',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `OTP Verification`
  String get otpVerificatione {
    return Intl.message(
      'OTP Verification',
      name: 'otpVerificatione',
      desc: '',
      args: [],
    );
  }

  /// `To confirm the number`
  String get toConfirmTheNumber {
    return Intl.message(
      'To confirm the number',
      name: 'toConfirmTheNumber',
      desc: '',
      args: [],
    );
  }

  /// `Resend OTP`
  String get resendOTP {
    return Intl.message(
      'Resend OTP',
      name: 'resendOTP',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Please wait {time} seconds to resend the code.`
  String pleaseWaitSeconds(Object time) {
    return Intl.message(
      'Please wait $time seconds to resend the code.',
      name: 'pleaseWaitSeconds',
      desc: '',
      args: [time],
    );
  }

  /// `Confirm your details`
  String get confirmYourDetails {
    return Intl.message(
      'Confirm your details',
      name: 'confirmYourDetails',
      desc: '',
      args: [],
    );
  }

  /// `Review the information and submit your license for verification to proceed`
  String get reviewTheInformationAndSubmit {
    return Intl.message(
      'Review the information and submit your license for verification to proceed',
      name: 'reviewTheInformationAndSubmit',
      desc: '',
      args: [],
    );
  }

  /// `Company license`
  String get companyLicense {
    return Intl.message(
      'Company license',
      name: 'companyLicense',
      desc: '',
      args: [],
    );
  }

  /// `Company name`
  String get companyName {
    return Intl.message(
      'Company name',
      name: 'companyName',
      desc: '',
      args: [],
    );
  }

  /// `License No.`
  String get licenseNo {
    return Intl.message(
      'License No.',
      name: 'licenseNo',
      desc: '',
      args: [],
    );
  }

  /// `Register No.`
  String get registerNo {
    return Intl.message(
      'Register No.',
      name: 'registerNo',
      desc: '',
      args: [],
    );
  }

  /// `Company Email Address`
  String get companyEmailAddress {
    return Intl.message(
      'Company Email Address',
      name: 'companyEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Submit your company email address to \nensure all reports and messages are \nsent to the right place.`
  String get submitYourCompanyEmailAddress {
    return Intl.message(
      'Submit your company email address to \nensure all reports and messages are \nsent to the right place.',
      name: 'submitYourCompanyEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Verifying company\ndocuments`
  String get verifyingCompanyDocuments {
    return Intl.message(
      'Verifying company\ndocuments',
      name: 'verifyingCompanyDocuments',
      desc: '',
      args: [],
    );
  }

  /// `After we verify your documents, you\nwill be able to open an account. `
  String get afterWeVerifyYourDocuments {
    return Intl.message(
      'After we verify your documents, you\nwill be able to open an account. ',
      name: 'afterWeVerifyYourDocuments',
      desc: '',
      args: [],
    );
  }

  /// `Verification in Progress`
  String get verificationInProgress {
    return Intl.message(
      'Verification in Progress',
      name: 'verificationInProgress',
      desc: '',
      args: [],
    );
  }

  /// `This usually takes up to 1 business day`
  String get takesUpTo1BusinessDay {
    return Intl.message(
      'This usually takes up to 1 business day',
      name: 'takesUpTo1BusinessDay',
      desc: '',
      args: [],
    );
  }

  /// `Pending Approval`
  String get pendingApproval {
    return Intl.message(
      'Pending Approval',
      name: 'pendingApproval',
      desc: '',
      args: [],
    );
  }

  /// `Verification Complete`
  String get verificationComplete {
    return Intl.message(
      'Verification Complete',
      name: 'verificationComplete',
      desc: '',
      args: [],
    );
  }

  /// `Сheck`
  String get check {
    return Intl.message(
      'Сheck',
      name: 'check',
      desc: '',
      args: [],
    );
  }

  /// `Wrong passcode`
  String get wrongPasscode {
    return Intl.message(
      'Wrong passcode',
      name: 'wrongPasscode',
      desc: '',
      args: [],
    );
  }

  /// `Enable Face ID`
  String get enableFaceID {
    return Intl.message(
      'Enable Face ID',
      name: 'enableFaceID',
      desc: '',
      args: [],
    );
  }

  /// `Enable Touch ID`
  String get enableTouchID {
    return Intl.message(
      'Enable Touch ID',
      name: 'enableTouchID',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Bypass entering the code every time by\nactivating Face ID login`
  String get byPassEnteringCodeFaceID {
    return Intl.message(
      'Bypass entering the code every time by\nactivating Face ID login',
      name: 'byPassEnteringCodeFaceID',
      desc: '',
      args: [],
    );
  }

  /// `Bypass entering the code every time by\nactivating Touch ID login`
  String get byPassEnteringCodeTouchID {
    return Intl.message(
      'Bypass entering the code every time by\nactivating Touch ID login',
      name: 'byPassEnteringCodeTouchID',
      desc: '',
      args: [],
    );
  }

  /// `To avoid having to enter the code every time, enable Face ID login`
  String get enableFaceIDLogin {
    return Intl.message(
      'To avoid having to enter the code every time, enable Face ID login',
      name: 'enableFaceIDLogin',
      desc: '',
      args: [],
    );
  }

  /// `Choose a rate`
  String get chooseARate {
    return Intl.message(
      'Choose a rate',
      name: 'chooseARate',
      desc: '',
      args: [],
    );
  }

  /// `To start using the bank, open an\naccount for your business`
  String get toStartUsingTheBankOpenAnAccountForYourBusiness {
    return Intl.message(
      'To start using the bank, open an\naccount for your business',
      name: 'toStartUsingTheBankOpenAnAccountForYourBusiness',
      desc: '',
      args: [],
    );
  }

  /// `Basic rate`
  String get basicRate {
    return Intl.message(
      'Basic rate',
      name: 'basicRate',
      desc: '',
      args: [],
    );
  }

  /// `Connect`
  String get connect {
    return Intl.message(
      'Connect',
      name: 'connect',
      desc: '',
      args: [],
    );
  }

  /// `Payments to individuals and\ncash withdrawals`
  String get paymentsToIndividualsAndCashWithdrawals {
    return Intl.message(
      'Payments to individuals and\ncash withdrawals',
      name: 'paymentsToIndividualsAndCashWithdrawals',
      desc: '',
      args: [],
    );
  }

  /// `Are you a UAE citizen?`
  String get areYouAUAECitizen {
    return Intl.message(
      'Are you a UAE citizen?',
      name: 'areYouAUAECitizen',
      desc: '',
      args: [],
    );
  }

  /// `This information is required to set up a new company`
  String get requiredToSetUpANewCompany {
    return Intl.message(
      'This information is required to set up a new company',
      name: 'requiredToSetUpANewCompany',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Verification status`
  String get verificationStatus {
    return Intl.message(
      'Verification status',
      name: 'verificationStatus',
      desc: '',
      args: [],
    );
  }

  /// `Type of business`
  String get typeOfBusiness {
    return Intl.message(
      'Type of business',
      name: 'typeOfBusiness',
      desc: '',
      args: [],
    );
  }

  /// `Business area`
  String get businessArea {
    return Intl.message(
      'Business area',
      name: 'businessArea',
      desc: '',
      args: [],
    );
  }

  /// `Choose and upload`
  String get chooseAndUpload {
    return Intl.message(
      'Choose and upload',
      name: 'chooseAndUpload',
      desc: '',
      args: [],
    );
  }

  /// `Select a document type and scan it to verify your identity`
  String get selectADocumentTypeAndScan {
    return Intl.message(
      'Select a document type and scan it to verify your identity',
      name: 'selectADocumentTypeAndScan',
      desc: '',
      args: [],
    );
  }

  /// `We need documents proving your\nidentity and your residency in the\ncountry`
  String get weNeedDocumentsYourResidency {
    return Intl.message(
      'We need documents proving your\nidentity and your residency in the\ncountry',
      name: 'weNeedDocumentsYourResidency',
      desc: '',
      args: [],
    );
  }

  /// `Passport`
  String get passport {
    return Intl.message(
      'Passport',
      name: 'passport',
      desc: '',
      args: [],
    );
  }

  /// `Use a foreign passport`
  String get useAForeignPassport {
    return Intl.message(
      'Use a foreign passport',
      name: 'useAForeignPassport',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get time {
    return Intl.message(
      'Time',
      name: 'time',
      desc: '',
      args: [],
    );
  }

  /// `Under development`
  String get underDevelopment {
    return Intl.message(
      'Under development',
      name: 'underDevelopment',
      desc: '',
      args: [],
    );
  }

  /// `This feature is under development`
  String get thisFeatureIsUnderDevelopment {
    return Intl.message(
      'This feature is under development',
      name: 'thisFeatureIsUnderDevelopment',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Legal type`
  String get legalType {
    return Intl.message(
      'Legal type',
      name: 'legalType',
      desc: '',
      args: [],
    );
  }

  /// `First name`
  String get firstName {
    return Intl.message(
      'First name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Last name`
  String get lastName {
    return Intl.message(
      'Last name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Ensure the information provided is\naccurate before proceeding to the next\nstep`
  String get ensureTheInformationProvided {
    return Intl.message(
      'Ensure the information provided is\naccurate before proceeding to the next\nstep',
      name: 'ensureTheInformationProvided',
      desc: '',
      args: [],
    );
  }

  /// `Foreign passport `
  String get foreignPassport {
    return Intl.message(
      'Foreign passport ',
      name: 'foreignPassport',
      desc: '',
      args: [],
    );
  }

  /// `Emirates ID `
  String get emiratesID {
    return Intl.message(
      'Emirates ID ',
      name: 'emiratesID',
      desc: '',
      args: [],
    );
  }

  /// `Arabic Name`
  String get arabicName {
    return Intl.message(
      'Arabic Name',
      name: 'arabicName',
      desc: '',
      args: [],
    );
  }

  /// `English Name`
  String get englishName {
    return Intl.message(
      'English Name',
      name: 'englishName',
      desc: '',
      args: [],
    );
  }

  /// `Nationality`
  String get nationality {
    return Intl.message(
      'Nationality',
      name: 'nationality',
      desc: '',
      args: [],
    );
  }

  /// `ID Number`
  String get idNumber {
    return Intl.message(
      'ID Number',
      name: 'idNumber',
      desc: '',
      args: [],
    );
  }

  /// `Issue date`
  String get issueDate {
    return Intl.message(
      'Issue date',
      name: 'issueDate',
      desc: '',
      args: [],
    );
  }

  /// `All company newsletters, reports, and messages will be sent to this email address`
  String get allCompanyNewslettersReportsAndMessagesWillBeSent {
    return Intl.message(
      'All company newsletters, reports, and messages will be sent to this email address',
      name: 'allCompanyNewslettersReportsAndMessagesWillBeSent',
      desc: '',
      args: [],
    );
  }

  /// `Business activity`
  String get businessActivity {
    return Intl.message(
      'Business activity',
      name: 'businessActivity',
      desc: '',
      args: [],
    );
  }

  /// `Passport number `
  String get passportNumber {
    return Intl.message(
      'Passport number ',
      name: 'passportNumber',
      desc: '',
      args: [],
    );
  }

  /// `Expiry date`
  String get expiryDate {
    return Intl.message(
      'Expiry date',
      name: 'expiryDate',
      desc: '',
      args: [],
    );
  }

  /// `Submit company details`
  String get submitCompanyDetails {
    return Intl.message(
      'Submit company details',
      name: 'submitCompanyDetails',
      desc: '',
      args: [],
    );
  }

  /// `Provide the required details to issue a new license`
  String get requiredDetailsToIssueANewLicense {
    return Intl.message(
      'Provide the required details to issue a new license',
      name: 'requiredDetailsToIssueANewLicense',
      desc: '',
      args: [],
    );
  }

  /// `General information `
  String get generalInformation {
    return Intl.message(
      'General information ',
      name: 'generalInformation',
      desc: '',
      args: [],
    );
  }

  /// `It will receive all company newsletters, and in the future all our reports and messages`
  String get itWillReceiveAllCompanyNewsletters {
    return Intl.message(
      'It will receive all company newsletters, and in the future all our reports and messages',
      name: 'itWillReceiveAllCompanyNewsletters',
      desc: '',
      args: [],
    );
  }

  /// `Expected number of employees`
  String get numberOfRmployees {
    return Intl.message(
      'Expected number of employees',
      name: 'numberOfRmployees',
      desc: '',
      args: [],
    );
  }

  /// `Employee information `
  String get employeeInformation {
    return Intl.message(
      'Employee information ',
      name: 'employeeInformation',
      desc: '',
      args: [],
    );
  }

  /// `The name will be translated into Arabic automatically`
  String get translatedIntoArabicAutomatically {
    return Intl.message(
      'The name will be translated into Arabic automatically',
      name: 'translatedIntoArabicAutomatically',
      desc: '',
      args: [],
    );
  }

  /// `A confirmation code was sent to {email} to confirm the application`
  String aConfirmationCodeSentEmail(Object email) {
    return Intl.message(
      'A confirmation code was sent to $email to confirm the application',
      name: 'aConfirmationCodeSentEmail',
      desc: '',
      args: [email],
    );
  }

  /// `Company name (English)`
  String get companyNameEnglish {
    return Intl.message(
      'Company name (English)',
      name: 'companyNameEnglish',
      desc: '',
      args: [],
    );
  }

  /// `Such a company already exists.\nTry another name`
  String get companyAlreadyExists {
    return Intl.message(
      'Such a company already exists.\nTry another name',
      name: 'companyAlreadyExists',
      desc: '',
      args: [],
    );
  }

  /// `Type business`
  String get typeBusiness {
    return Intl.message(
      'Type business',
      name: 'typeBusiness',
      desc: '',
      args: [],
    );
  }

  /// `Subtitle`
  String get subtitle {
    return Intl.message(
      'Subtitle',
      name: 'subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Pay the fees`
  String get payTheFees {
    return Intl.message(
      'Pay the fees',
      name: 'payTheFees',
      desc: '',
      args: [],
    );
  }

  /// `Attach payment confirmation`
  String get attachPaymentConfirmation {
    return Intl.message(
      'Attach payment confirmation',
      name: 'attachPaymentConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `We have sent you a payment link via email. Alternatively, you can use the documents provided. Please upload your payment confirmation..`
  String get weHaveSentYouyAPaymentLinkEmail {
    return Intl.message(
      'We have sent you a payment link via email. Alternatively, you can use the documents provided. Please upload your payment confirmation..',
      name: 'weHaveSentYouyAPaymentLinkEmail',
      desc: '',
      args: [],
    );
  }

  /// `Documents for pay`
  String get documentsForPay {
    return Intl.message(
      'Documents for pay',
      name: 'documentsForPay',
      desc: '',
      args: [],
    );
  }

  /// `Payment documents`
  String get paymentDocuments {
    return Intl.message(
      'Payment documents',
      name: 'paymentDocuments',
      desc: '',
      args: [],
    );
  }

  /// `Payment receipts`
  String get paymentReceipts {
    return Intl.message(
      'Payment receipts',
      name: 'paymentReceipts',
      desc: '',
      args: [],
    );
  }

  /// `Upload payment confirmation`
  String get uploadPaymentConfirmation {
    return Intl.message(
      'Upload payment confirmation',
      name: 'uploadPaymentConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `You can upload a screenshot,\nphoto of the receipt or a scan.\nMake sure the transaction\nnumber is clearly visible.`
  String get youCanUpload {
    return Intl.message(
      'You can upload a screenshot,\nphoto of the receipt or a scan.\nMake sure the transaction\nnumber is clearly visible.',
      name: 'youCanUpload',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to remove {fileName}?`
  String doYouWantToRemove(Object fileName) {
    return Intl.message(
      'Do you want to remove $fileName?',
      name: 'doYouWantToRemove',
      desc: '',
      args: [fileName],
    );
  }

  /// `Sign the documents`
  String get signTheDocuments {
    return Intl.message(
      'Sign the documents',
      name: 'signTheDocuments',
      desc: '',
      args: [],
    );
  }

  /// `Our representative will deliver a\npackage containing documents for you\nto sign`
  String get ourRepresentativeWillDeliver {
    return Intl.message(
      'Our representative will deliver a\npackage containing documents for you\nto sign',
      name: 'ourRepresentativeWillDeliver',
      desc: '',
      args: [],
    );
  }

  /// `Documents`
  String get documents {
    return Intl.message(
      'Documents',
      name: 'documents',
      desc: '',
      args: [],
    );
  }

  /// `Review the documents that require your\nsignature`
  String get reviewTheDocuments {
    return Intl.message(
      'Review the documents that require your\nsignature',
      name: 'reviewTheDocuments',
      desc: '',
      args: [],
    );
  }

  /// ` We will send a courier to you adress`
  String get weWillSendACourierToYouAdress {
    return Intl.message(
      ' We will send a courier to you adress',
      name: 'weWillSendACourierToYouAdress',
      desc: '',
      args: [],
    );
  }

  /// `Meeting with a courier`
  String get meetingWithACourier {
    return Intl.message(
      'Meeting with a courier',
      name: 'meetingWithACourier',
      desc: '',
      args: [],
    );
  }

  /// `Show the courier the cuarcode`
  String get showTheCourierTheCuarcode {
    return Intl.message(
      'Show the courier the cuarcode',
      name: 'showTheCourierTheCuarcode',
      desc: '',
      args: [],
    );
  }

  /// `Open full screen`
  String get openFullScreen {
    return Intl.message(
      'Open full screen',
      name: 'openFullScreen',
      desc: '',
      args: [],
    );
  }

  /// `Will take the documents\nto the embassy`
  String get willTakeTheDocumentstoTheEmbassy {
    return Intl.message(
      'Will take the documents\nto the embassy',
      name: 'willTakeTheDocumentstoTheEmbassy',
      desc: '',
      args: [],
    );
  }

  /// `Delivery documents`
  String get deliveryDocuments {
    return Intl.message(
      'Delivery documents',
      name: 'deliveryDocuments',
      desc: '',
      args: [],
    );
  }

  /// `Call to courier`
  String get callToCourier {
    return Intl.message(
      'Call to courier',
      name: 'callToCourier',
      desc: '',
      args: [],
    );
  }

  /// `Open chat`
  String get openChat {
    return Intl.message(
      'Open chat',
      name: 'openChat',
      desc: '',
      args: [],
    );
  }

  /// `We will let you know when he delivers the\ndocuments`
  String get weWillLetYouKnowWhenHeDeliversTheDocuments {
    return Intl.message(
      'We will let you know when he delivers the\ndocuments',
      name: 'weWillLetYouKnowWhenHeDeliversTheDocuments',
      desc: '',
      args: [],
    );
  }

  /// `The courier is already bringing the\ndocuments for approval. Usually it\ntakes up to 5 working days.`
  String get theCourierIsAlready {
    return Intl.message(
      'The courier is already bringing the\ndocuments for approval. Usually it\ntakes up to 5 working days.',
      name: 'theCourierIsAlready',
      desc: '',
      args: [],
    );
  }

  /// `The documents have been approved,\nall that's left is to pick up`
  String get theDocumentsHaveBeenApproved {
    return Intl.message(
      'The documents have been approved,\nall that\'s left is to pick up',
      name: 'theDocumentsHaveBeenApproved',
      desc: '',
      args: [],
    );
  }

  /// `Documents accepted, courier ready to\nbring you the license`
  String get documentsAccepted {
    return Intl.message(
      'Documents accepted, courier ready to\nbring you the license',
      name: 'documentsAccepted',
      desc: '',
      args: [],
    );
  }

  /// `Provide details for delivery`
  String get provideDetailsForDelivery {
    return Intl.message(
      'Provide details for delivery',
      name: 'provideDetailsForDelivery',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `We will send a courier to you with a\npackage of documents. Provide details\nfor delivery`
  String get weWillSendACourierToYouWithAPackageOfDocuments {
    return Intl.message(
      'We will send a courier to you with a\npackage of documents. Provide details\nfor delivery',
      name: 'weWillSendACourierToYouWithAPackageOfDocuments',
      desc: '',
      args: [],
    );
  }

  /// `Confirm delivery`
  String get confirmDelivery {
    return Intl.message(
      'Confirm delivery',
      name: 'confirmDelivery',
      desc: '',
      args: [],
    );
  }

  /// `Delivery day`
  String get deliveryDay {
    return Intl.message(
      'Delivery day',
      name: 'deliveryDay',
      desc: '',
      args: [],
    );
  }

  /// `Delivery time`
  String get deliveryTime {
    return Intl.message(
      'Delivery time',
      name: 'deliveryTime',
      desc: '',
      args: [],
    );
  }

  /// `Shipping address`
  String get shippingAddress {
    return Intl.message(
      'Shipping address',
      name: 'shippingAddress',
      desc: '',
      args: [],
    );
  }

  /// `Enter number`
  String get enterNumber {
    return Intl.message(
      'Enter number',
      name: 'enterNumber',
      desc: '',
      args: [],
    );
  }

  /// `Flat number`
  String get flatNumber {
    return Intl.message(
      'Flat number',
      name: 'flatNumber',
      desc: '',
      args: [],
    );
  }

  /// `Comments for courier`
  String get commentsForCourier {
    return Intl.message(
      'Comments for courier',
      name: 'commentsForCourier',
      desc: '',
      args: [],
    );
  }

  /// `AED {balance}`
  String aed(Object balance) {
    return Intl.message(
      'AED $balance',
      name: 'aed',
      desc: '',
      args: [balance],
    );
  }

  /// `${balance} with overdraft`
  String withOverdraft(Object balance) {
    return Intl.message(
      '\$$balance with overdraft',
      name: 'withOverdraft',
      desc: '',
      args: [balance],
    );
  }

  /// `Account opening takes up to 1\nbusiness day.\nOnce your account is open, we'll\nsend you a notification.`
  String get accountOpeningTakesUp {
    return Intl.message(
      'Account opening takes up to 1\nbusiness day.\nOnce your account is open, we\'ll\nsend you a notification.',
      name: 'accountOpeningTakesUp',
      desc: '',
      args: [],
    );
  }

  /// `Current account {account}`
  String currentAccount(Object account) {
    return Intl.message(
      'Current account $account',
      name: 'currentAccount',
      desc: '',
      args: [account],
    );
  }

  /// `Products`
  String get products {
    return Intl.message(
      'Products',
      name: 'products',
      desc: '',
      args: [],
    );
  }

  /// `New`
  String get newText {
    return Intl.message(
      'New',
      name: 'newText',
      desc: '',
      args: [],
    );
  }

  /// `Change Rate`
  String get changeRate {
    return Intl.message(
      'Change Rate',
      name: 'changeRate',
      desc: '',
      args: [],
    );
  }

  /// `Bill it`
  String get billIt {
    return Intl.message(
      'Bill it',
      name: 'billIt',
      desc: '',
      args: [],
    );
  }

  /// `Deposit`
  String get deposit {
    return Intl.message(
      'Deposit',
      name: 'deposit',
      desc: '',
      args: [],
    );
  }

  /// `Transfer`
  String get transfer {
    return Intl.message(
      'Transfer',
      name: 'transfer',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get history {
    return Intl.message(
      'History',
      name: 'history',
      desc: '',
      args: [],
    );
  }

  /// `Manage`
  String get manage {
    return Intl.message(
      'Manage',
      name: 'manage',
      desc: '',
      args: [],
    );
  }

  /// `Top up`
  String get topUp {
    return Intl.message(
      'Top up',
      name: 'topUp',
      desc: '',
      args: [],
    );
  }

  /// `Invoicing`
  String get invoicing {
    return Intl.message(
      'Invoicing',
      name: 'invoicing',
      desc: '',
      args: [],
    );
  }

  /// `Statement`
  String get statement {
    return Intl.message(
      'Statement',
      name: 'statement',
      desc: '',
      args: [],
    );
  }

  /// `Rates & Limits`
  String get ratesAndLimits {
    return Intl.message(
      'Rates & Limits',
      name: 'ratesAndLimits',
      desc: '',
      args: [],
    );
  }

  /// `Analytics`
  String get analytics {
    return Intl.message(
      'Analytics',
      name: 'analytics',
      desc: '',
      args: [],
    );
  }

  /// `Account Details`
  String get accountDetails {
    return Intl.message(
      'Account Details',
      name: 'accountDetails',
      desc: '',
      args: [],
    );
  }

  /// `Bank Cards `
  String get bankCards {
    return Intl.message(
      'Bank Cards ',
      name: 'bankCards',
      desc: '',
      args: [],
    );
  }

  /// `Rate limits`
  String get rateLimits {
    return Intl.message(
      'Rate limits',
      name: 'rateLimits',
      desc: '',
      args: [],
    );
  }

  /// `New product`
  String get newProduct {
    return Intl.message(
      'New product',
      name: 'newProduct',
      desc: '',
      args: [],
    );
  }

  /// `Open account`
  String get openAccount {
    return Intl.message(
      'Open account',
      name: 'openAccount',
      desc: '',
      args: [],
    );
  }

  /// `New service`
  String get newService {
    return Intl.message(
      'New service',
      name: 'newService',
      desc: '',
      args: [],
    );
  }

  /// `Choose a way`
  String get chooseAWay {
    return Intl.message(
      'Choose a way',
      name: 'chooseAWay',
      desc: '',
      args: [],
    );
  }

  /// `Card`
  String get cardText {
    return Intl.message(
      'Card',
      name: 'cardText',
      desc: '',
      args: [],
    );
  }

  /// `Cash`
  String get cash {
    return Intl.message(
      'Cash',
      name: 'cash',
      desc: '',
      args: [],
    );
  }

  /// `Select the card to transfer from`
  String get selectTheCardToTransferFrom {
    return Intl.message(
      'Select the card to transfer from',
      name: 'selectTheCardToTransferFrom',
      desc: '',
      args: [],
    );
  }

  /// `Card {card}`
  String card(Object card) {
    return Intl.message(
      'Card $card',
      name: 'card',
      desc: '',
      args: [card],
    );
  }

  /// `Successfully`
  String get successfully {
    return Intl.message(
      'Successfully',
      name: 'successfully',
      desc: '',
      args: [],
    );
  }

  /// `Cards`
  String get cards {
    return Intl.message(
      'Cards',
      name: 'cards',
      desc: '',
      args: [],
    );
  }

  /// `Choose where to transfer money from`
  String get chooseWhereToTransferMoney {
    return Intl.message(
      'Choose where to transfer money from',
      name: 'chooseWhereToTransferMoney',
      desc: '',
      args: [],
    );
  }

  /// `Replenishment of the account with\nAED ${number} is done`
  String replenishmentOfTheAccount(Object number) {
    return Intl.message(
      'Replenishment of the account with\nAED \$$number is done',
      name: 'replenishmentOfTheAccount',
      desc: '',
      args: [number],
    );
  }

  /// `Your deposit will be processed within\none business day. \nYou'll receive a push notification when the funds are credited to your account.`
  String get yourDepositWillBeProcessed {
    return Intl.message(
      'Your deposit will be processed within\none business day. \nYou\'ll receive a push notification when the funds are credited to your account.',
      name: 'yourDepositWillBeProcessed',
      desc: '',
      args: [],
    );
  }

  /// `The transfer will be processed within \none business day. \nYou'll receive a notification once the \npayment is processed.`
  String get theTransferWillBeCompleted {
    return Intl.message(
      'The transfer will be processed within \none business day. \nYou\'ll receive a notification once the \npayment is processed.',
      name: 'theTransferWillBeCompleted',
      desc: '',
      args: [],
    );
  }

  /// `Save the check`
  String get saveTheCheck {
    return Intl.message(
      'Save the check',
      name: 'saveTheCheck',
      desc: '',
      args: [],
    );
  }

  /// `Operations in `
  String get operationsIn {
    return Intl.message(
      'Operations in ',
      name: 'operationsIn',
      desc: '',
      args: [],
    );
  }

  /// `Filter({count})`
  String filterCount(Object count) {
    return Intl.message(
      'Filter($count)',
      name: 'filterCount',
      desc: '',
      args: [count],
    );
  }

  /// `Filter`
  String get filter {
    return Intl.message(
      'Filter',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `Refills + {count}`
  String refillsCount(Object count) {
    return Intl.message(
      'Refills + $count',
      name: 'refillsCount',
      desc: '',
      args: [count],
    );
  }

  /// `Spending - {count}`
  String spendingCount(Object count) {
    return Intl.message(
      'Spending - $count',
      name: 'spendingCount',
      desc: '',
      args: [count],
    );
  }

  /// `There were no surgeries during\nthis period`
  String get thereWereNoSurgeriesDuringThisPeriod {
    return Intl.message(
      'There were no surgeries during\nthis period',
      name: 'thereWereNoSurgeriesDuringThisPeriod',
      desc: '',
      args: [],
    );
  }

  /// `No operations were found\nfor your query`
  String get noOperationsWereFoundForYourQuery {
    return Intl.message(
      'No operations were found\nfor your query',
      name: 'noOperationsWereFoundForYourQuery',
      desc: '',
      args: [],
    );
  }

  /// `Operations`
  String get operations {
    return Intl.message(
      'Operations',
      name: 'operations',
      desc: '',
      args: [],
    );
  }

  /// `Spending`
  String get spending {
    return Intl.message(
      'Spending',
      name: 'spending',
      desc: '',
      args: [],
    );
  }

  /// `Refills`
  String get refills {
    return Intl.message(
      'Refills',
      name: 'refills',
      desc: '',
      args: [],
    );
  }

  /// `Payment of fees`
  String get paymentOfFees {
    return Intl.message(
      'Payment of fees',
      name: 'paymentOfFees',
      desc: '',
      args: [],
    );
  }

  /// `Payment for fines`
  String get paymentForFines {
    return Intl.message(
      'Payment for fines',
      name: 'paymentForFines',
      desc: '',
      args: [],
    );
  }

  /// `Payment of counterparties`
  String get paymentOfCounterparties {
    return Intl.message(
      'Payment of counterparties',
      name: 'paymentOfCounterparties',
      desc: '',
      args: [],
    );
  }

  /// `Payroll payments`
  String get payrollPayments {
    return Intl.message(
      'Payroll payments',
      name: 'payrollPayments',
      desc: '',
      args: [],
    );
  }

  /// `Taxes payment`
  String get taxesPayment {
    return Intl.message(
      'Taxes payment',
      name: 'taxesPayment',
      desc: '',
      args: [],
    );
  }

  /// `Translations`
  String get translations {
    return Intl.message(
      'Translations',
      name: 'translations',
      desc: '',
      args: [],
    );
  }

  /// `Payment of contracts`
  String get paymentOfContracts {
    return Intl.message(
      'Payment of contracts',
      name: 'paymentOfContracts',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get today {
    return Intl.message(
      'Today',
      name: 'today',
      desc: '',
      args: [],
    );
  }

  /// `Yesterday`
  String get yesterday {
    return Intl.message(
      'Yesterday',
      name: 'yesterday',
      desc: '',
      args: [],
    );
  }

  /// `Now the card can only\nbe opened through\nan operator`
  String get nowTheCard {
    return Intl.message(
      'Now the card can only\nbe opened through\nan operator',
      name: 'nowTheCard',
      desc: '',
      args: [],
    );
  }

  /// `We will contact you with an operator or you can\nleave a request we will contact you at a\nconvenient time for you`
  String get weWillContactYou {
    return Intl.message(
      'We will contact you with an operator or you can\nleave a request we will contact you at a\nconvenient time for you',
      name: 'weWillContactYou',
      desc: '',
      args: [],
    );
  }

  /// `Call now`
  String get callNow {
    return Intl.message(
      'Call now',
      name: 'callNow',
      desc: '',
      args: [],
    );
  }

  /// `Payments`
  String get payments {
    return Intl.message(
      'Payments',
      name: 'payments',
      desc: '',
      args: [],
    );
  }

  /// `Creat invoice`
  String get creatInvoice {
    return Intl.message(
      'Creat invoice',
      name: 'creatInvoice',
      desc: '',
      args: [],
    );
  }

  /// `New transfer`
  String get newTransfer {
    return Intl.message(
      'New transfer',
      name: 'newTransfer',
      desc: '',
      args: [],
    );
  }

  /// `Pending transactions`
  String get pendingTransactionsn {
    return Intl.message(
      'Pending transactions',
      name: 'pendingTransactionsn',
      desc: '',
      args: [],
    );
  }

  /// `Monitor transactions in progress`
  String get monitorTransactionsInProgress {
    return Intl.message(
      'Monitor transactions in progress',
      name: 'monitorTransactionsInProgress',
      desc: '',
      args: [],
    );
  }

  /// `Pending invoices`
  String get pendingInvoices {
    return Intl.message(
      'Pending invoices',
      name: 'pendingInvoices',
      desc: '',
      args: [],
    );
  }

  /// `Review invoices issued to you`
  String get reviewInvoicesIssuedToYou {
    return Intl.message(
      'Review invoices issued to you',
      name: 'reviewInvoicesIssuedToYou',
      desc: '',
      args: [],
    );
  }

  /// `OOO Isilan Istregert`
  String get oOOIsilanIstregert {
    return Intl.message(
      'OOO Isilan Istregert',
      name: 'oOOIsilanIstregert',
      desc: '',
      args: [],
    );
  }

  /// `Invoice recipient`
  String get invoiceRecipient {
    return Intl.message(
      'Invoice recipient',
      name: 'invoiceRecipient',
      desc: '',
      args: [],
    );
  }

  /// `Legal entity`
  String get legalEntity {
    return Intl.message(
      'Legal entity',
      name: 'legalEntity',
      desc: '',
      args: [],
    );
  }

  /// `Name and surname`
  String get nameAndSurname {
    return Intl.message(
      'Name and surname',
      name: 'nameAndSurname',
      desc: '',
      args: [],
    );
  }

  /// `Details of payment`
  String get detailsOfPayment {
    return Intl.message(
      'Details of payment',
      name: 'detailsOfPayment',
      desc: '',
      args: [],
    );
  }

  /// `Pay before`
  String get payBefore {
    return Intl.message(
      'Pay before',
      name: 'payBefore',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get amount {
    return Intl.message(
      'Amount',
      name: 'amount',
      desc: '',
      args: [],
    );
  }

  /// `Issue an invoice`
  String get issueAnInvoice {
    return Intl.message(
      'Issue an invoice',
      name: 'issueAnInvoice',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phoneNumber {
    return Intl.message(
      'Phone number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Invoice Beneficiary`
  String get invoiceBeneficiary {
    return Intl.message(
      'Invoice Beneficiary',
      name: 'invoiceBeneficiary',
      desc: '',
      args: [],
    );
  }

  /// `Swift code`
  String get swiftCode {
    return Intl.message(
      'Swift code',
      name: 'swiftCode',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Select a method`
  String get selectAMethod {
    return Intl.message(
      'Select a method',
      name: 'selectAMethod',
      desc: '',
      args: [],
    );
  }

  /// `SWIFT code (BIC)`
  String get swiftCocdeBIC {
    return Intl.message(
      'SWIFT code (BIC)',
      name: 'swiftCocdeBIC',
      desc: '',
      args: [],
    );
  }

  /// `Type of payer`
  String get typeOfPayer {
    return Intl.message(
      'Type of payer',
      name: 'typeOfPayer',
      desc: '',
      args: [],
    );
  }

  /// `Legal person`
  String get legalPerson {
    return Intl.message(
      'Legal person',
      name: 'legalPerson',
      desc: '',
      args: [],
    );
  }

  /// `Individual`
  String get individual {
    return Intl.message(
      'Individual',
      name: 'individual',
      desc: '',
      args: [],
    );
  }

  /// `Leave a request`
  String get leaveARequest {
    return Intl.message(
      'Leave a request',
      name: 'leaveARequest',
      desc: '',
      args: [],
    );
  }

  /// `Request accepted`
  String get requestAccepted {
    return Intl.message(
      'Request accepted',
      name: 'requestAccepted',
      desc: '',
      args: [],
    );
  }

  /// `An operator will contact you shortly`
  String get anOperatorWillContactYouShortly {
    return Intl.message(
      'An operator will contact you shortly',
      name: 'anOperatorWillContactYouShortly',
      desc: '',
      args: [],
    );
  }

  /// `Business card`
  String get businessCard {
    return Intl.message(
      'Business card',
      name: 'businessCard',
      desc: '',
      args: [],
    );
  }

  /// `Employee cards`
  String get employeeCards {
    return Intl.message(
      'Employee cards',
      name: 'employeeCards',
      desc: '',
      args: [],
    );
  }

  /// `Purpose of Payment`
  String get purposePayment {
    return Intl.message(
      'Purpose of Payment',
      name: 'purposePayment',
      desc: '',
      args: [],
    );
  }

  /// `Due Date`
  String get dueDate {
    return Intl.message(
      'Due Date',
      name: 'dueDate',
      desc: '',
      args: [],
    );
  }

  /// `Basic`
  String get basic {
    return Intl.message(
      'Basic',
      name: 'basic',
      desc: '',
      args: [],
    );
  }

  /// `Optimal`
  String get optimal {
    return Intl.message(
      'Optimal',
      name: 'optimal',
      desc: '',
      args: [],
    );
  }

  /// `Premium`
  String get premium {
    return Intl.message(
      'Premium',
      name: 'premium',
      desc: '',
      args: [],
    );
  }

  /// `ATM Deposits`
  String get atmDeposits {
    return Intl.message(
      'ATM Deposits',
      name: 'atmDeposits',
      desc: '',
      args: [],
    );
  }

  /// `Transactions`
  String get transactions {
    return Intl.message(
      'Transactions',
      name: 'transactions',
      desc: '',
      args: [],
    );
  }

  /// `Account turnover`
  String get accountTurnover {
    return Intl.message(
      'Account turnover',
      name: 'accountTurnover',
      desc: '',
      args: [],
    );
  }

  /// `Replenishment at ATMs`
  String get replenishmentAtATMs {
    return Intl.message(
      'Replenishment at ATMs',
      name: 'replenishmentAtATMs',
      desc: '',
      args: [],
    );
  }

  /// `Opening bank cards`
  String get openingBankCards {
    return Intl.message(
      'Opening bank cards',
      name: 'openingBankCards',
      desc: '',
      args: [],
    );
  }

  /// `Transfers`
  String get transfers {
    return Intl.message(
      'Transfers',
      name: 'transfers',
      desc: '',
      args: [],
    );
  }

  /// `Tariff limits`
  String get tariffLimits {
    return Intl.message(
      'Tariff limits',
      name: 'tariffLimits',
      desc: '',
      args: [],
    );
  }

  /// `If the limits are exhausted there will be a\ncommission. Limits will be updated on\nApril 24`
  String get ifTheLimits {
    return Intl.message(
      'If the limits are exhausted there will be a\ncommission. Limits will be updated on\nApril 24',
      name: 'ifTheLimits',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get change {
    return Intl.message(
      'Change',
      name: 'change',
      desc: '',
      args: [],
    );
  }

  /// `Type value`
  String get typeValue {
    return Intl.message(
      'Type value',
      name: 'typeValue',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Join`
  String get join {
    return Intl.message(
      'Join',
      name: 'join',
      desc: '',
      args: [],
    );
  }

  /// `Add-ons`
  String get addOns {
    return Intl.message(
      'Add-ons',
      name: 'addOns',
      desc: '',
      args: [],
    );
  }

  /// `Bank Cards & Cheque Books`
  String get bankCardsChequeBooks {
    return Intl.message(
      'Bank Cards & Cheque Books',
      name: 'bankCardsChequeBooks',
      desc: '',
      args: [],
    );
  }

  /// `We'll display cash deposit locations on the map for you`
  String get weDisplayCashDeposit {
    return Intl.message(
      'We\'ll display cash deposit locations on the map for you',
      name: 'weDisplayCashDeposit',
      desc: '',
      args: [],
    );
  }

  /// `ATMs`
  String get atms {
    return Intl.message(
      'ATMs',
      name: 'atms',
      desc: '',
      args: [],
    );
  }

  /// `Cash Deposit Points`
  String get cashDepositPoints {
    return Intl.message(
      'Cash Deposit Points',
      name: 'cashDepositPoints',
      desc: '',
      args: [],
    );
  }

  /// `Find ATMs`
  String get findATMs {
    return Intl.message(
      'Find ATMs',
      name: 'findATMs',
      desc: '',
      args: [],
    );
  }

  /// `Distance`
  String get distance {
    return Intl.message(
      'Distance',
      name: 'distance',
      desc: '',
      args: [],
    );
  }

  /// `Within {km} km`
  String within(Object km) {
    return Intl.message(
      'Within $km km',
      name: 'within',
      desc: '',
      args: [km],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Create a route`
  String get createARoute {
    return Intl.message(
      'Create a route',
      name: 'createARoute',
      desc: '',
      args: [],
    );
  }

  /// `Pine\nCompany`
  String get pineCompany {
    return Intl.message(
      'Pine\nCompany',
      name: 'pineCompany',
      desc: '',
      args: [],
    );
  }

  /// `Tariff super gun`
  String get tariffSuperGun {
    return Intl.message(
      'Tariff super gun',
      name: 'tariffSuperGun',
      desc: '',
      args: [],
    );
  }

  /// `Company data`
  String get companyData {
    return Intl.message(
      'Company data',
      name: 'companyData',
      desc: '',
      args: [],
    );
  }

  /// `Company information`
  String get companyInformation {
    return Intl.message(
      'Company information',
      name: 'companyInformation',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Transaction confirmations`
  String get transactionConfirmations {
    return Intl.message(
      'Transaction confirmations',
      name: 'transactionConfirmations',
      desc: '',
      args: [],
    );
  }

  /// `Confirmation Methods`
  String get confirmationMethods {
    return Intl.message(
      'Confirmation Methods',
      name: 'confirmationMethods',
      desc: '',
      args: [],
    );
  }

  /// `Main account`
  String get mainAccount {
    return Intl.message(
      'Main account',
      name: 'mainAccount',
      desc: '',
      args: [],
    );
  }

  /// `Login Settings`
  String get loginSettings {
    return Intl.message(
      'Login Settings',
      name: 'loginSettings',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Sign out`
  String get signOut {
    return Intl.message(
      'Sign out',
      name: 'signOut',
      desc: '',
      args: [],
    );
  }

  /// `Write a reply...`
  String get writeAReply {
    return Intl.message(
      'Write a reply...',
      name: 'writeAReply',
      desc: '',
      args: [],
    );
  }

  /// `Ask any question below.\nOur representative will respond to your\ninquiry as promptly as possible.`
  String get askAnyQuestionBelow {
    return Intl.message(
      'Ask any question below.\nOur representative will respond to your\ninquiry as promptly as possible.',
      name: 'askAnyQuestionBelow',
      desc: '',
      args: [],
    );
  }

  /// `Change cover image`
  String get changeCoverImage {
    return Intl.message(
      'Change cover image',
      name: 'changeCoverImage',
      desc: '',
      args: [],
    );
  }

  /// `Name in the application`
  String get nameInTheApplication {
    return Intl.message(
      'Name in the application',
      name: 'nameInTheApplication',
      desc: '',
      args: [],
    );
  }

  /// `Alternative email address will be used if the primary email becomes unreachable`
  String get alternativeEmailAddress {
    return Intl.message(
      'Alternative email address will be used if the primary email becomes unreachable',
      name: 'alternativeEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Backup email address`
  String get backupEmailAddress {
    return Intl.message(
      'Backup email address',
      name: 'backupEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Number license`
  String get numberLicense {
    return Intl.message(
      'Number license',
      name: 'numberLicense',
      desc: '',
      args: [],
    );
  }

  /// `Atachments`
  String get atachments {
    return Intl.message(
      'Atachments',
      name: 'atachments',
      desc: '',
      args: [],
    );
  }

  /// `Change your license`
  String get changeYourLicense {
    return Intl.message(
      'Change your license',
      name: 'changeYourLicense',
      desc: '',
      args: [],
    );
  }

  /// `To update your information, please scan your new license`
  String get toUpdateYourInformation {
    return Intl.message(
      'To update your information, please scan your new license',
      name: 'toUpdateYourInformation',
      desc: '',
      args: [],
    );
  }

  /// `Unload the statement `
  String get unloadTheStatement {
    return Intl.message(
      'Unload the statement ',
      name: 'unloadTheStatement',
      desc: '',
      args: [],
    );
  }

  /// `Functionality is under development`
  String get functionalityIsUnderDevelopment {
    return Intl.message(
      'Functionality is under development',
      name: 'functionalityIsUnderDevelopment',
      desc: '',
      args: [],
    );
  }

  /// `Receive notifications for`
  String get receiveNotificationsFor {
    return Intl.message(
      'Receive notifications for',
      name: 'receiveNotificationsFor',
      desc: '',
      args: [],
    );
  }

  /// `When billing`
  String get whenBilling {
    return Intl.message(
      'When billing',
      name: 'whenBilling',
      desc: '',
      args: [],
    );
  }

  /// `When paying bills`
  String get whenPayingBills {
    return Intl.message(
      'When paying bills',
      name: 'whenPayingBills',
      desc: '',
      args: [],
    );
  }

  /// `When changing login settings`
  String get whenChangingLoginSettings {
    return Intl.message(
      'When changing login settings',
      name: 'whenChangingLoginSettings',
      desc: '',
      args: [],
    );
  }

  /// `When exceeding limits`
  String get whenExceedingLimits {
    return Intl.message(
      'When exceeding limits',
      name: 'whenExceedingLimits',
      desc: '',
      args: [],
    );
  }

  /// `Notification methods`
  String get notificationMethods {
    return Intl.message(
      'Notification methods',
      name: 'notificationMethods',
      desc: '',
      args: [],
    );
  }

  /// `Face ID`
  String get faceID {
    return Intl.message(
      'Face ID',
      name: 'faceID',
      desc: '',
      args: [],
    );
  }

  /// `By email`
  String get byEmail {
    return Intl.message(
      'By email',
      name: 'byEmail',
      desc: '',
      args: [],
    );
  }

  /// `By sms`
  String get bySms {
    return Intl.message(
      'By sms',
      name: 'bySms',
      desc: '',
      args: [],
    );
  }

  /// `By push`
  String get byPush {
    return Intl.message(
      'By push',
      name: 'byPush',
      desc: '',
      args: [],
    );
  }

  /// `To`
  String get toText {
    return Intl.message(
      'To',
      name: 'toText',
      desc: '',
      args: [],
    );
  }

  /// `Push Notification`
  String get pushNotification {
    return Intl.message(
      'Push Notification',
      name: 'pushNotification',
      desc: '',
      args: [],
    );
  }

  /// `Text Message`
  String get textMessage {
    return Intl.message(
      'Text Message',
      name: 'textMessage',
      desc: '',
      args: [],
    );
  }

  /// `Sender`
  String get sender {
    return Intl.message(
      'Sender',
      name: 'sender',
      desc: '',
      args: [],
    );
  }

  /// `Transfer details`
  String get transferDetails {
    return Intl.message(
      'Transfer details',
      name: 'transferDetails',
      desc: '',
      args: [],
    );
  }

  /// `Recipient’s IBAN`
  String get recipientIBAN {
    return Intl.message(
      'Recipient’s IBAN',
      name: 'recipientIBAN',
      desc: '',
      args: [],
    );
  }

  /// `Recipient’s SWIFT code`
  String get recipientSWIFTCode {
    return Intl.message(
      'Recipient’s SWIFT code',
      name: 'recipientSWIFTCode',
      desc: '',
      args: [],
    );
  }

  /// `Upload files`
  String get uploadFiles {
    return Intl.message(
      'Upload files',
      name: 'uploadFiles',
      desc: '',
      args: [],
    );
  }

  /// `Download invoice`
  String get downloadInvoice {
    return Intl.message(
      'Download invoice',
      name: 'downloadInvoice',
      desc: '',
      args: [],
    );
  }

  /// `Scan`
  String get scan {
    return Intl.message(
      'Scan',
      name: 'scan',
      desc: '',
      args: [],
    );
  }

  /// `Share invoice`
  String get shareInvoice {
    return Intl.message(
      'Share invoice',
      name: 'shareInvoice',
      desc: '',
      args: [],
    );
  }

  /// `Invoice details`
  String get invoiceDetails {
    return Intl.message(
      'Invoice details',
      name: 'invoiceDetails',
      desc: '',
      args: [],
    );
  }

  /// `The invoice has been \nemailed to the recipient`
  String get emailedToTheRecipient {
    return Intl.message(
      'The invoice has been \nemailed to the recipient',
      name: 'emailedToTheRecipient',
      desc: '',
      args: [],
    );
  }

  /// `You can download this invoice \nor share it below`
  String get youCanDownloadThisInvoice {
    return Intl.message(
      'You can download this invoice \nor share it below',
      name: 'youCanDownloadThisInvoice',
      desc: '',
      args: [],
    );
  }

  /// `Send invoice `
  String get sendInvoice {
    return Intl.message(
      'Send invoice ',
      name: 'sendInvoice',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Update phone number`
  String get updatePhoneNumber {
    return Intl.message(
      'Update phone number',
      name: 'updatePhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Change PIN`
  String get changePIN {
    return Intl.message(
      'Change PIN',
      name: 'changePIN',
      desc: '',
      args: [],
    );
  }

  /// `Quick Login`
  String get quickLogin {
    return Intl.message(
      'Quick Login',
      name: 'quickLogin',
      desc: '',
      args: [],
    );
  }

  /// `By Face ID`
  String get byFaceID {
    return Intl.message(
      'By Face ID',
      name: 'byFaceID',
      desc: '',
      args: [],
    );
  }

  /// `By Touch ID`
  String get byTouchID {
    return Intl.message(
      'By Touch ID',
      name: 'byTouchID',
      desc: '',
      args: [],
    );
  }

  /// `Create a PIN`
  String get createAPIN {
    return Intl.message(
      'Create a PIN',
      name: 'createAPIN',
      desc: '',
      args: [],
    );
  }

  /// `Enter a PIN`
  String get enterAPIN {
    return Intl.message(
      'Enter a PIN',
      name: 'enterAPIN',
      desc: '',
      args: [],
    );
  }

  /// `Set up a 4 digit PIN for quick and secure\naccess to your account`
  String get setUpA4DigitPIN {
    return Intl.message(
      'Set up a 4 digit PIN for quick and secure\naccess to your account',
      name: 'setUpA4DigitPIN',
      desc: '',
      args: [],
    );
  }

  /// `Confirming transactions`
  String get confirmingTransactions {
    return Intl.message(
      'Confirming transactions',
      name: 'confirmingTransactions',
      desc: '',
      args: [],
    );
  }

  /// `Pending transactions`
  String get pendingTransactions {
    return Intl.message(
      'Pending transactions',
      name: 'pendingTransactions',
      desc: '',
      args: [],
    );
  }

  /// `How to confirm actions`
  String get howToConfirmActions {
    return Intl.message(
      'How to confirm actions',
      name: 'howToConfirmActions',
      desc: '',
      args: [],
    );
  }

  /// `Which account to use`
  String get whichAccountToUse {
    return Intl.message(
      'Which account to use',
      name: 'whichAccountToUse',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Overview for`
  String get overviewFor {
    return Intl.message(
      'Overview for',
      name: 'overviewFor',
      desc: '',
      args: [],
    );
  }

  /// `Your available balance`
  String get yourAvailableBalance {
    return Intl.message(
      'Your available balance',
      name: 'yourAvailableBalance',
      desc: '',
      args: [],
    );
  }

  /// `Monthly expenses`
  String get monthlyExpenses {
    return Intl.message(
      'Monthly expenses',
      name: 'monthlyExpenses',
      desc: '',
      args: [],
    );
  }

  /// `Taxes`
  String get taxes {
    return Intl.message(
      'Taxes',
      name: 'taxes',
      desc: '',
      args: [],
    );
  }

  /// `Salaries`
  String get salaries {
    return Intl.message(
      'Salaries',
      name: 'salaries',
      desc: '',
      args: [],
    );
  }

  /// `Payment for services`
  String get paymentForServices {
    return Intl.message(
      'Payment for services',
      name: 'paymentForServices',
      desc: '',
      args: [],
    );
  }

  /// `Verified ({number})`
  String verified(Object number) {
    return Intl.message(
      'Verified ($number)',
      name: 'verified',
      desc: '',
      args: [number],
    );
  }

  /// `New ({number})`
  String newFilter(Object number) {
    return Intl.message(
      'New ($number)',
      name: 'newFilter',
      desc: '',
      args: [number],
    );
  }

  /// `My services`
  String get myServices {
    return Intl.message(
      'My services',
      name: 'myServices',
      desc: '',
      args: [],
    );
  }

  /// `My partners`
  String get myPartners {
    return Intl.message(
      'My partners',
      name: 'myPartners',
      desc: '',
      args: [],
    );
  }

  /// `Connected ({number})`
  String connected(Object number) {
    return Intl.message(
      'Connected ($number)',
      name: 'connected',
      desc: '',
      args: [number],
    );
  }

  /// `Office management`
  String get officeManagement {
    return Intl.message(
      'Office management',
      name: 'officeManagement',
      desc: '',
      args: [],
    );
  }

  /// `Company management`
  String get companyManagement {
    return Intl.message(
      'Company management',
      name: 'companyManagement',
      desc: '',
      args: [],
    );
  }

  /// `Account number`
  String get accountNumber {
    return Intl.message(
      'Account number',
      name: 'accountNumber',
      desc: '',
      args: [],
    );
  }

  /// `IBAN`
  String get IBAN {
    return Intl.message(
      'IBAN',
      name: 'IBAN',
      desc: '',
      args: [],
    );
  }

  /// `Download`
  String get download {
    return Intl.message(
      'Download',
      name: 'download',
      desc: '',
      args: [],
    );
  }

  /// `Information for transfer`
  String get informationForTransfer {
    return Intl.message(
      'Information for transfer',
      name: 'informationForTransfer',
      desc: '',
      args: [],
    );
  }

  /// `Share the check`
  String get shareTheCheck {
    return Intl.message(
      'Share the check',
      name: 'shareTheCheck',
      desc: '',
      args: [],
    );
  }

  /// `The bill for $ {number} was paid`
  String theBillForWasPaid(Object number) {
    return Intl.message(
      'The bill for \$ $number was paid',
      name: 'theBillForWasPaid',
      desc: '',
      args: [number],
    );
  }

  /// `Add-on services`
  String get addOnServices {
    return Intl.message(
      'Add-on services',
      name: 'addOnServices',
      desc: '',
      args: [],
    );
  }

  /// `Services to help you manage your company more efficiently`
  String get servicesToHelpYouNanageYourCompany {
    return Intl.message(
      'Services to help you manage your company more efficiently',
      name: 'servicesToHelpYouNanageYourCompany',
      desc: '',
      args: [],
    );
  }

  /// `The front side of {text}`
  String theFrontSideOf(Object text) {
    return Intl.message(
      'The front side of $text',
      name: 'theFrontSideOf',
      desc: '',
      args: [text],
    );
  }

  /// `The back side of {text}`
  String theBackSideOf(Object text) {
    return Intl.message(
      'The back side of $text',
      name: 'theBackSideOf',
      desc: '',
      args: [text],
    );
  }

  /// `Check the details`
  String get checkTheDetail {
    return Intl.message(
      'Check the details',
      name: 'checkTheDetail',
      desc: '',
      args: [],
    );
  }

  /// `Pine services ({number})`
  String pineServices(Object number) {
    return Intl.message(
      'Pine services ($number)',
      name: 'pineServices',
      desc: '',
      args: [number],
    );
  }

  /// `No operations were found\nfor your query`
  String get noOperations {
    return Intl.message(
      'No operations were found\nfor your query',
      name: 'noOperations',
      desc: '',
      args: [],
    );
  }

  /// `ATM in the branch {country}`
  String ATMInTheBranch(Object country) {
    return Intl.message(
      'ATM in the branch $country',
      name: 'ATMInTheBranch',
      desc: '',
      args: [country],
    );
  }

  /// `Financial Overview`
  String get financialOverview {
    return Intl.message(
      'Financial Overview',
      name: 'financialOverview',
      desc: '',
      args: [],
    );
  }

  /// `Invoice Payments`
  String get invoicePayments {
    return Intl.message(
      'Invoice Payments',
      name: 'invoicePayments',
      desc: '',
      args: [],
    );
  }

  /// `Payroll Transfers`
  String get payrollTransfers {
    return Intl.message(
      'Payroll Transfers',
      name: 'payrollTransfers',
      desc: '',
      args: [],
    );
  }

  /// `Service Payments`
  String get servicePayments {
    return Intl.message(
      'Service Payments',
      name: 'servicePayments',
      desc: '',
      args: [],
    );
  }

  /// `Notification Preferences`
  String get notificationPreferences {
    return Intl.message(
      'Notification Preferences',
      name: 'notificationPreferences',
      desc: '',
      args: [],
    );
  }

  /// `Payments and transfers`
  String get paymentsAndTransfers {
    return Intl.message(
      'Payments and transfers',
      name: 'paymentsAndTransfers',
      desc: '',
      args: [],
    );
  }

  /// `Deposits`
  String get deposits {
    return Intl.message(
      'Deposits',
      name: 'deposits',
      desc: '',
      args: [],
    );
  }

  /// `Outstanding Invoices`
  String get outstandingInvoices {
    return Intl.message(
      'Outstanding Invoices',
      name: 'outstandingInvoices',
      desc: '',
      args: [],
    );
  }

  /// `Exceeding Set Limits`
  String get exceedingSetLimits {
    return Intl.message(
      'Exceeding Set Limits',
      name: 'exceedingSetLimits',
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
