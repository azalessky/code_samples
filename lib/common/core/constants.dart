import 'package:flutter/material.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';

class AppSettings {
  static const isProduction = bool.fromEnvironment('IS_PRODUCTION', defaultValue: false);
  static const debugToken = 'f3c1a8c2-9b6e-4f0e-9c42-6d7b1e4e2f91';
  static const packageName = 'com.indentix.studentplanner';
  static const appleId = '6478564201';
  static const supportEmail = 'mailto:support@indentix.com?subject=Student%20Planner';
}

class DefaultConfig {
  static const themeMode = ThemeMode.dark;
  static const baseColor = Palette.yellow;
  static const backgroundImage = 'assets/backgrounds/dark/ripples.jpg';
  static const appFont = 'Google Sans';
  static const lessonMode = (enabled: false, value: LessonMode.silent);
  static const lessonStart = (enabled: false, value: ReminderTime.minutes5);
  static const upcomingAssignments = (enabled: false, value: TimeOfDay(hour: 18, minute: 0));
  static const academicTerm = AcademicTerm.quarter;
  static const classDays = [1, 2, 3, 4, 5, 6];
  static const periodCount = 8;
  static const repeatSchedule = RepeatSchedule.never;
  static const bellSchedule = BellSchedule.common;
  static const gradeScale = GradeScale.numeric5;
  static const plusValue = 0.33;
  static const minusValue = -0.33;
  static const roundingThreshold = 0.5;
  static const roundingPrecision = 2;
  static const gradeColors = [
    (from: 4, to: 5, color: Palette.green),
    (from: 3, to: 3, color: Palette.amber),
    (from: 1, to: 2, color: Palette.red),
    (from: 0, to: 0, color: Palette.blueGrey),
  ];
}

class FieldConstraints {
  static const periodSubjectLength = 50;
  static const periodTopicLength = 200;
  static const periodRoomLength = 10;
  static const gradeValueLength = 5;
  static const gradeCommentLength = 50;
  static const gradeAttendanceLength = 50;
  static const assignmentTextLength = 400;
  static const assignmentItemLength = 100;
  static const labelTextLength = 50;
  static const noteTextLength = 200;
  static const subjectNameLength = 50;
  static const subjectRoomLength = 10;
  static const teacherNameLength = 50;
  static const teacherNoteLength = 200;
  static const termNameLength = 50;
}

class AnimationSettings {
  static const switchDuration = Durations.short2;
  static const dialogDuration = Durations.long2;
  static const messageDebounce = Durations.extralong4;
}

class FormStyles {
  static const inputAlpha = 0.15;
  static const buttonAlpha = 0.3;
  static const labelAlpha = 0.5;
  static const gradeAlpha = 0.5;
  static const dividerAlpha = 0.7;
  static const avatarAlpha = 0.8;
  static const iconAlpha = 0.8;

  static const checkboxRadius = 4.0;
  static const iconRadius = 4.0;
  static const imageRadius = 8.0;
  static const inputRadius = 10.0;
  static const labelRadius = 24.0;
  static const gradeRadius = 24.0;

  static const switchScale = 0.7;
  static const switchAlpha = (outline: 0.5, thumb: 0.7);
}

class FormLayout {
  static const lineSpacing = 2.0;
  static const iconSpacing = 4.0;
  static const imageSpacing = 4.0;
  static const textSpacing = 8.0;
  static const tableSpacing = 8.0;
  static const buttonSpacing = 8.0;
  static const inputSpacing = 12.0;
  static const fieldSpacing = 16.0;
  static const sectionSpacing = 24.0;

  static const formPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 12);
  static const listPadding = EdgeInsets.symmetric(horizontal: 16);
  static const tablePadding = EdgeInsets.symmetric(horizontal: 16);
  static const chipPadding = EdgeInsets.all(4);
  static const textPadding = EdgeInsets.all(8);
  static const gridPadding = EdgeInsets.all(8);

  static const tinySpacer = SizedBox.square(dimension: 4);
  static const smallSpacer = SizedBox.square(dimension: 6);
  static const mediumSpacer = SizedBox.square(dimension: 8);
  static const largeSpacer = SizedBox.square(dimension: 12);

  static const fieldSpacer = SizedBox.square(dimension: 16);
  static const inputSpacer = SizedBox.square(dimension: 20);
  static const sectionSpacer = SizedBox.square(dimension: 24);
  static const bottomSpacer = SizedBox.square(dimension: 80);
}

class DialogPaddings {
  static const dialogTitle = EdgeInsets.only(left: 24, right: 24, top: 8);
  static const dialogContainer = EdgeInsets.only(top: 8, bottom: 12);
  static const actionButtons = EdgeInsets.only(left: 32, right: 32, top: 0, bottom: 0);

  static const inputContent = EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 20);
  static const messageContent = EdgeInsets.only(left: 32, right: 32, top: 12, bottom: 20);
  static const promptContent = EdgeInsets.symmetric(horizontal: 32, vertical: 24);
  static const signInContent = EdgeInsets.symmetric(horizontal: 32, vertical: 24);

  static const listContent = EdgeInsets.symmetric(vertical: 4);
  static const listTile = EdgeInsets.symmetric(horizontal: 24);

  static const pickerContent = EdgeInsets.symmetric(vertical: 20);
  static const backgroundContent = EdgeInsets.symmetric(horizontal: 24, vertical: 20);
  static const imageContent = EdgeInsets.symmetric(horizontal: 24, vertical: 20);
}

class RepositoryKeys {
  static const prodKey = 'users';
  static const devKey = 'sandbox';
  static const assignmentsKey = 'assignments';
  static const bellsKey = 'bells';
  static const gradesKey = 'grades';
  static const labelsKey = 'labels';
  static const notesKey = 'notes';
  static const periodsKey = 'periods';
  static const settingsKey = 'settings';
  static const subjectsKey = 'subjects';
  static const teachersKey = 'teachers';
  static const termsKey = 'terms';
}

class PrefsKeys {
  static const remindersKey = 'reminders';
  static const reviewKey = 'review';
  static const focusKey = 'focus';
  static const updateKey = 'update';
}

class NotificationChannels {
  static const reminders = 'reminders';
}

class AlarmSettings {
  static const reminderAlarm = 100;
  static const soundAlarm = 200;
}

class ResourceSettings {
  static const assetManifest = 'AssetManifest.json';
  static const assetSubjects = 'assets/settings/subjects.json';
  static const assetLabels = 'assets/settings/labels.json';
  static const assetAttendances = 'assets/settings/attendances.json';
  static const assetTranslations = 'assets/translations';
  static const assetFonts = 'assets/fonts';
  static const assetBackgrounds = 'assets/backgrounds';
  static const androidIcon = 'assets/icons/android.png';
  static const appleLogo = 'assets/images/apple_logo.svg';
  static const googleLogo = 'assets/images/google_logo.svg';
}

class DirectorySettings {
  static const imagesFolder = 'images';
  static const cacheFolder = 'cache';
}
