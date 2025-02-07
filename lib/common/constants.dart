import 'package:flutter/material.dart';

import 'package:student_planner/models/models.dart';

class AppSettings {
  static const packageName = 'com.indentix.studentplanner';
  static const environment = String.fromEnvironment('ENV', defaultValue: 'development');
  static const isProduction = environment == 'production';
  static const trialPeriod = Duration(days: 6);
  static const androidAppUrl = 'https://rustore.ru/catalog/app/com.indentix.studentplanner';
  static const iOSAppUrl = 'https://apps.apple.com/app/id6478564201';
  static const supportEmail = 'mailto:support@indentix.com?subject=Student%20Planner';
}

class RustoreSettings {
  static const keyId = String.fromEnvironment('RUSTORE_KEY_ID');
  static const privateKey = String.fromEnvironment('RUSTORE_PRIVATE_KEY');
  static const authUrl = 'https://public-api.rustore.ru/public/auth';
  static const subscriptionUrl = 'https://public-api.rustore.ru/public/v3/subscription';
  static const appId = '2063588567';
  static const appDeepLink = 'studentplanner://home';
  static const storeDeepLink = 'rustore://profile/subscriptions';
  static const products = ['subscription_month', 'subscription_year', 'subscription_lifetime'];
}

class DefaultSettings {
  static const themeMode = ThemeMode.dark;
  static const colorTheme = Color(0xFFFFEB3B);
  static const backgroundImage = 'music';
  static const studyWeek = [true, true, true, true, true, true, false];
  static const gradingScale = GradingScale.numeric;
  static const periodCount = 8;
}

class FieldConstraints {
  static const gradeValueLength = 5;
  static const gradeWeightLength = 5;
  static const assignmentTexLength = 200;
  static const noteTextLength = 1000;
  static const subjectNameLength = 50;
  static const subjectRoomLength = 10;
  static const teacherNameLength = 50;
  static const teacherNoteLength = 50;
  static const termNameLength = 50;
}

class RepositorySettings {
  static const remoteKeyProd = 'users';
  static const remoteKeyDev = 'sandbox';
  static const localKey = 'data';
  static const subscriptionsKey = 'subscriptions';
  static const assignmentsKey = 'assignments';
  static const bellsKey = 'bells';
  static const gradesKey = 'grades';
  static const notesKey = 'notes';
  static const periodsKey = 'periods';
  static const settingsKey = 'settings';
  static const subjectsKey = 'subjects';
  static const teachersKey = 'teachers';
  static const termsKey = 'terms';
}

class FormStyles {
  static const inputAlpha = 80;
  static const buttonAlpha = 80;
  static const avatarAlpha = 200;

  static const inputRadius = 10.0;
  static const checkboxRadius = 4.0;
  static const imageRadius = 4.0;
}

class FormLayout {
  static const lineSpacing = 2.0;
  static const textSpacing = 8.0;
  static const gridSpacing = 12.0;
  static const tableMargin = 24.0;

  static const formPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 12);
  static const listPadding = EdgeInsets.symmetric(horizontal: 16);
  static const chipPadding = EdgeInsets.all(4);
  static const textPadding = EdgeInsets.all(8);
  static const gridPadding = EdgeInsets.all(8);

  static const smallSpacer = SizedBox.square(dimension: 6);
  static const mediumSpacer = SizedBox.square(dimension: 8);
  static const largeSpacer = SizedBox.square(dimension: 12);

  static const fieldSpacer = SizedBox.square(dimension: 16);
  static const inputSpacer = SizedBox.square(dimension: 20);
  static const sectionSpacer = SizedBox.square(dimension: 24);
}

class DialogPaddings {
  static const screeniOS = EdgeInsets.only(top: 8, bottom: 32);
  static const screenAndroid = EdgeInsets.only(top: 8, bottom: 24);
  static const keyboardAndroid = EdgeInsets.only(top: 8, bottom: 12);
  static const keyboardiOS = EdgeInsets.only(top: 8, bottom: 12);

  static const dialogTitle = EdgeInsets.only(top: 12, left: 24, right: 24);
  static const defaultContent = EdgeInsets.symmetric(vertical: 8);
  static const actionButtons = EdgeInsets.symmetric(horizontal: 32);

  static const pickerContent = EdgeInsets.symmetric(vertical: 24);
  static const inputContent = EdgeInsets.symmetric(horizontal: 24, vertical: 20);
  static const promptContent = EdgeInsets.symmetric(horizontal: 32, vertical: 24);
  static const signInContent = EdgeInsets.symmetric(horizontal: 32, vertical: 24);

  static const actionContent = EdgeInsets.symmetric(vertical: 4);
  static const actionTile = EdgeInsets.symmetric(horizontal: 24);

  static const valueContent = EdgeInsets.symmetric(vertical: 4);
  static const valueTile = EdgeInsets.symmetric(horizontal: 24);
}

class ResourceSettings {
  static const assetManifest = 'AssetManifest.json';
  static const assetSubjects = 'assets/settings/subjects.json';
  static const androidIcon = 'assets/icons/android.png';
  static const appleLogo = 'assets/images/apple_logo.svg';
  static const googleLogo = 'assets/images/google_logo.svg';
}
