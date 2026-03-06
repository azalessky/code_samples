///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final TranslationsAppEn app = TranslationsAppEn.internal(_root);
	late final TranslationsUpdateInfoEn updateInfo = TranslationsUpdateInfoEn.internal(_root);
	late final TranslationsAuthScreenEn authScreen = TranslationsAuthScreenEn.internal(_root);
	late final TranslationsHomeScreenEn homeScreen = TranslationsHomeScreenEn.internal(_root);
	late final TranslationsAssignmentsScreenEn assignmentsScreen = TranslationsAssignmentsScreenEn.internal(_root);
	late final TranslationsNoteDetailScreenEn noteDetailScreen = TranslationsNoteDetailScreenEn.internal(_root);
	late final TranslationsProfileScreenEn profileScreen = TranslationsProfileScreenEn.internal(_root);
	late final TranslationsScheduleScreenEn scheduleScreen = TranslationsScheduleScreenEn.internal(_root);
	late final TranslationsBellsScreenEn bellsScreen = TranslationsBellsScreenEn.internal(_root);
	late final TranslationsGradeBookScreenEn gradeBookScreen = TranslationsGradeBookScreenEn.internal(_root);
	late final TranslationsGradeReportScreenEn gradeReportScreen = TranslationsGradeReportScreenEn.internal(_root);
	late final TranslationsGradeBookViewEn gradeBookView = TranslationsGradeBookViewEn.internal(_root);
	late final TranslationsGradeReportViewEn gradeReportView = TranslationsGradeReportViewEn.internal(_root);
	late final TranslationsGradesHistoryScreenEn gradesHistoryScreen = TranslationsGradesHistoryScreenEn.internal(_root);
	late final TranslationsHelpScreenEn helpScreen = TranslationsHelpScreenEn.internal(_root);
	late final TranslationsAssignmentDetailScreenEn assignmentDetailScreen = TranslationsAssignmentDetailScreenEn.internal(_root);
	late final TranslationsLessonDetailScreenEn lessonDetailScreen = TranslationsLessonDetailScreenEn.internal(_root);
	late final TranslationsSettingsScreenEn settingsScreen = TranslationsSettingsScreenEn.internal(_root);
	late final TranslationsGeneralSettingsScreenEn generalSettingsScreen = TranslationsGeneralSettingsScreenEn.internal(_root);
	late final TranslationsAdvancedSettingsScreenEn advancedSettingsScreen = TranslationsAdvancedSettingsScreenEn.internal(_root);
	late final TranslationsRemindersSettingsScreenEn remindersSettingsScreen = TranslationsRemindersSettingsScreenEn.internal(_root);
	late final TranslationsScheduleSettingsScreenEn scheduleSettingsScreen = TranslationsScheduleSettingsScreenEn.internal(_root);
	late final TranslationsGradesSettingsScreenEn gradesSettingsScreen = TranslationsGradesSettingsScreenEn.internal(_root);
	late final TranslationsSubjectDetailScreenEn subjectDetailScreen = TranslationsSubjectDetailScreenEn.internal(_root);
	late final TranslationsSubjectsScreenEn subjectsScreen = TranslationsSubjectsScreenEn.internal(_root);
	late final TranslationsTeacherDetailScreenEn teacherDetailScreen = TranslationsTeacherDetailScreenEn.internal(_root);
	late final TranslationsTeachersScreenEn teachersScreen = TranslationsTeachersScreenEn.internal(_root);
	late final TranslationsTermDetailScreenEn termDetailScreen = TranslationsTermDetailScreenEn.internal(_root);
	late final TranslationsTermsScreenEn termsScreen = TranslationsTermsScreenEn.internal(_root);
	late final TranslationsLabelDetailScreenEn labelDetailScreen = TranslationsLabelDetailScreenEn.internal(_root);
	late final TranslationsLabelsScreenEn labelsScreen = TranslationsLabelsScreenEn.internal(_root);
	late final TranslationsGradeInputDialogEn gradeInputDialog = TranslationsGradeInputDialogEn.internal(_root);
	late final TranslationsSignInDialogEn signInDialog = TranslationsSignInDialogEn.internal(_root);
	late final TranslationsAssignmentFieldEn assignmentField = TranslationsAssignmentFieldEn.internal(_root);
	late final TranslationsNotificationChannelEn notificationChannel = TranslationsNotificationChannelEn.internal(_root);
	late final TranslationsButtonEn button = TranslationsButtonEn.internal(_root);
	late final TranslationsMessageEn message = TranslationsMessageEn.internal(_root);
	late final TranslationsPromptEn prompt = TranslationsPromptEn.internal(_root);
	late final TranslationsNotificationEn notification = TranslationsNotificationEn.internal(_root);
	late final TranslationsDateFormatEn dateFormat = TranslationsDateFormatEn.internal(_root);
	late final TranslationsThemeModeEn themeMode = TranslationsThemeModeEn.internal(_root);
	late final TranslationsLessonModeEn lessonMode = TranslationsLessonModeEn.internal(_root);
	late final TranslationsAssignmentStatusEn assignmentStatus = TranslationsAssignmentStatusEn.internal(_root);
	late final TranslationsUserActionEn userAction = TranslationsUserActionEn.internal(_root);
	late final TranslationsRepeatScheduleEn repeatSchedule = TranslationsRepeatScheduleEn.internal(_root);
	late final TranslationsBellScheduleEn bellSchedule = TranslationsBellScheduleEn.internal(_root);
	late final TranslationsGradeScaleEn gradeScale = TranslationsGradeScaleEn.internal(_root);
	late final TranslationsReminderTimeEn reminderTime = TranslationsReminderTimeEn.internal(_root);
	late final TranslationsAcademicTermEn academicTerm = TranslationsAcademicTermEn.internal(_root);
	late final TranslationsTermTypeEn termType = TranslationsTermTypeEn.internal(_root);
	late final TranslationsColorEn color = TranslationsColorEn.internal(_root);
}

// Path: app
class TranslationsAppEn {
	TranslationsAppEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Student Planner'
	String get title => 'Student Planner';
}

// Path: updateInfo
class TranslationsUpdateInfoEn {
	TranslationsUpdateInfoEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'What's new'
	String get title => 'What\'s new';

	List<String> get text => [
		'• Improved widget texts',
		'• Attendance mark input moved to a separate dialog',
	];
}

// Path: authScreen
class TranslationsAuthScreenEn {
	TranslationsAuthScreenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Student Planner'
	String get title => 'Student Planner';

	/// en: 'Sign in with Google'
	String get buttonGoogle => 'Sign in with Google';

	/// en: 'Later'
	String get buttonLater => 'Later';
}

// Path: homeScreen
class TranslationsHomeScreenEn {
	TranslationsHomeScreenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Diary'
	String get schedule => 'Diary';

	/// en: 'Assignments'
	String get assignments => 'Assignments';

	/// en: 'Bells'
	String get bells => 'Bells';

	/// en: 'Grades'
	String get grades => 'Grades';

	/// en: 'Profile'
	String get profile => 'Profile';

	/// en: 'Updating data...'
	String get migrationInProgress => 'Updating data...';

	/// en: 'Error'
	String get migrationErrorTitle => 'Error';

	/// en: 'Failed to update data. The application will now close.'
	String get migrationErrorText => 'Failed to update data. The application will now close.';
}

// Path: assignmentsScreen
class TranslationsAssignmentsScreenEn {
	TranslationsAssignmentsScreenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Assignments'
	String get title => 'Assignments';

	/// en: 'No assignments Add assignments in the diary'
	String get noData => 'No assignments\nAdd assignments in the diary';
}

// Path: noteDetailScreen
class TranslationsNoteDetailScreenEn {
	TranslationsNoteDetailScreenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Notes'
	String get title => 'Notes';

	/// en: 'Text'
	String get textHint => 'Text';
}

// Path: profileScreen
class TranslationsProfileScreenEn {
	TranslationsProfileScreenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Profile'
	String get title => 'Profile';

	/// en: 'Subjects'
	String get subjects => 'Subjects';

	/// en: 'Teachers'
	String get teachers => 'Teachers';

	/// en: 'Terms'
	String get terms => 'Terms';

	/// en: 'Labels'
	String get labels => 'Labels';

	/// en: 'Settings'
	String get settings => 'Settings';

	/// en: 'About'
	String get about => 'About';

	/// en: 'Hello, $name!'
	String welcomeText({required Object name}) => 'Hello, ${name}!';

	/// en: 'Sign In'
	String get signInButton => 'Sign In';
}

// Path: scheduleScreen
class TranslationsScheduleScreenEn {
	TranslationsScheduleScreenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: '#'
	String get numberHeader => '#';

	/// en: 'Lesson'
	String get lessonHeader => 'Lesson';

	/// en: '☆'
	String get gradeHeader => '☆';

	/// en: 'Notes'
	String get noteHint => 'Notes';
}

// Path: bellsScreen
class TranslationsBellsScreenEn {
	TranslationsBellsScreenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Bells'
	String get title => 'Bells';

	/// en: 'Period'
	String get period => 'Period';

	/// en: 'Start'
	String get start => 'Start';

	/// en: 'End'
	String get end => 'End';

	/// en: 'Break'
	String get kBreak => 'Break';

	/// en: '$minutes min'
	String breakText({required Object minutes}) => '${minutes} min';
}

// Path: gradeBookScreen
class TranslationsGradeBookScreenEn {
	TranslationsGradeBookScreenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Book'
	String get title => 'Book';

	/// en: 'Year'
	String get yearTitle => 'Year';

	/// en: 'Term'
	String get termTitle => 'Term';
}

// Path: gradeReportScreen
class TranslationsGradeReportScreenEn {
	TranslationsGradeReportScreenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Report'
	String get title => 'Report';

	/// en: 'Year'
	String get yearTitle => 'Year';

	/// en: 'Term'
	String get termTitle => 'Term';
}

// Path: gradeBookView
class TranslationsGradeBookViewEn {
	TranslationsGradeBookViewEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Subject'
	String get subject => 'Subject';

	/// en: 'Average'
	String get average => 'Average';

	/// en: 'No grades Add grades in the diary'
	String get noData => 'No grades\nAdd grades in the diary';
}

// Path: gradeReportView
class TranslationsGradeReportViewEn {
	TranslationsGradeReportViewEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Subject'
	String get subject => 'Subject';

	List<String> get terms => [
		'I',
		'II',
		'III',
		'IV',
	];

	/// en: '∑'
	String get year => '∑';

	/// en: 'No terms Add terms in the profile'
	String get noData => 'No terms\nAdd terms in the profile';

	/// en: 'No grades Select another term'
	String get noGrades => 'No grades\nSelect another term';
}

// Path: gradesHistoryScreen
class TranslationsGradesHistoryScreenEn {
	TranslationsGradesHistoryScreenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Date'
	String get date => 'Date';

	/// en: 'Grade'
	String get grade => 'Grade';

	/// en: 'Comment'
	String get comment => 'Comment';

	/// en: 'No grades'
	String get noData => 'No grades';
}

// Path: helpScreen
class TranslationsHelpScreenEn {
	TranslationsHelpScreenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'About'
	String get title => 'About';

	/// en: 'Version $version ($build)'
	String versionText({required Object version, required Object build}) => 'Version ${version} (${build})';

	/// en: 'Share application'
	String get shareApp => 'Share application';

	/// en: 'Rate application'
	String get rateApp => 'Rate application';

	/// en: 'Contact developer'
	String get contactDev => 'Contact developer';

	/// en: 'Delete profile'
	String get deleteProfile => 'Delete profile';
}

// Path: assignmentDetailScreen
class TranslationsAssignmentDetailScreenEn {
	TranslationsAssignmentDetailScreenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Assignment'
	String get title => 'Assignment';

	/// en: 'Move assignment'
	String get moveTitle => 'Move assignment';
}

// Path: lessonDetailScreen
class TranslationsLessonDetailScreenEn {
	TranslationsLessonDetailScreenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Period $slot'
	String title({required Object slot}) => 'Period ${slot}';

	/// en: 'Subject'
	String get subjectHint => 'Subject';

	/// en: 'Topic'
	String get topicHint => 'Topic';

	/// en: 'Room'
	String get roomHint => 'Room';

	/// en: 'Room'
	String get roomPrefix => 'Room';
}

// Path: settingsScreen
class TranslationsSettingsScreenEn {
	TranslationsSettingsScreenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Settings'
	String get title => 'Settings';

	/// en: 'General'
	String get general => 'General';

	/// en: 'Advanced'
	String get advanced => 'Advanced';

	/// en: 'Reminders'
	String get reminders => 'Reminders';

	/// en: 'Schedule'
	String get schedule => 'Schedule';

	/// en: 'Grades'
	String get grades => 'Grades';

	/// en: 'Important'
	String get importantButton => 'Important';

	/// en: 'Important'
	String get importantTitle => 'Important';

	/// en: 'For the application to work correctly on Xiaomi, Huawei, Vivo and Oppo devices, adjust the system settings for the app: • Autostart – enabled • Background activity – enabled • Battery saver – disabled'
	String get importantText => 'For the application to work correctly on Xiaomi, Huawei, Vivo and Oppo devices, adjust the system settings for the app:\n• Autostart – enabled\n• Background activity – enabled\n• Battery saver – disabled';
}

// Path: generalSettingsScreen
class TranslationsGeneralSettingsScreenEn {
	TranslationsGeneralSettingsScreenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'General'
	String get title => 'General';

	/// en: 'App language'
	String get appLanguage => 'App language';

	/// en: 'Theme mode'
	String get themeMode => 'Theme mode';

	/// en: 'Base color'
	String get baseColor => 'Base color';

	/// en: 'Background image'
	String get backgroundImage => 'Background image';

	/// en: 'None'
	String get backgroundImageNone => 'None';

	/// en: 'App font'
	String get appFont => 'App font';
}

// Path: advancedSettingsScreen
class TranslationsAdvancedSettingsScreenEn {
	TranslationsAdvancedSettingsScreenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Advanced'
	String get title => 'Advanced';

	/// en: 'Lesson mode'
	String get lessonMode => 'Lesson mode';

	/// en: 'Disabled'
	String get lessonModeDisabled => 'Disabled';
}

// Path: remindersSettingsScreen
class TranslationsRemindersSettingsScreenEn {
	TranslationsRemindersSettingsScreenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Reminders'
	String get title => 'Reminders';

	/// en: 'Lesson start'
	String get lessonStart => 'Lesson start';

	/// en: '$time before bell'
	String lessonStartText({required Object time}) => '${time} before bell';

	/// en: 'Disabled'
	String get lessonStartDisabled => 'Disabled';

	/// en: 'Upcoming assignments'
	String get upcomingAssignments => 'Upcoming assignments';

	/// en: 'Daily at $time'
	String upcomingAssignmentsText({required Object time}) => 'Daily at ${time}';

	/// en: 'Disabled'
	String get upcomingAssignmentsDisabled => 'Disabled';
}

// Path: scheduleSettingsScreen
class TranslationsScheduleSettingsScreenEn {
	TranslationsScheduleSettingsScreenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Schedule'
	String get title => 'Schedule';

	/// en: 'Academic term'
	String get academicTerm => 'Academic term';

	/// en: 'Class days'
	String get classDays => 'Class days';

	/// en: 'Period count'
	String get periodCount => 'Period count';

	/// en: '$count periods a day'
	String periodCountText({required Object count}) => '${count} periods a day';

	/// en: 'Repeat schedule'
	String get repeatSchedule => 'Repeat schedule';

	/// en: 'Bell schedule'
	String get bellSchedule => 'Bell schedule';
}

// Path: gradesSettingsScreen
class TranslationsGradesSettingsScreenEn {
	TranslationsGradesSettingsScreenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Grades'
	String get title => 'Grades';

	/// en: 'Grading scale'
	String get gradeScale => 'Grading scale';

	/// en: 'Sign values'
	String get signValues => 'Sign values';

	/// en: 'Plus: $plus, Minus: $minus'
	String signValuesText({required Object plus, required Object minus}) => 'Plus: ${plus}, Minus: ${minus}';

	/// en: 'Plus'
	String get signValuesPlus => 'Plus';

	/// en: 'Minus'
	String get signValuesMinus => 'Minus';

	/// en: 'Rounding rules'
	String get roundingRules => 'Rounding rules';

	/// en: 'Threshold: $threshold, Precision: $precision'
	String roundingRulesText({required Object threshold, required Object precision}) => 'Threshold: ${threshold}, Precision: ${precision}';

	/// en: 'Threshold'
	String get roundingRulesThreshold => 'Threshold';

	/// en: 'Precision'
	String get roundingRulesPrecision => 'Precision';

	/// en: 'Grade colors'
	String get gradeColors => 'Grade colors';

	/// en: 'Color'
	String get gradeColorsTitle => 'Color';

	/// en: 'Other'
	String get gradeColorsOther => 'Other';

	/// en: 'Attendance marks'
	String get attendanceMarks => 'Attendance marks';

	/// en: 'New mark'
	String get attendanceMark => 'New mark';

	/// en: 'Name'
	String get attendanceName => 'Name';
}

// Path: subjectDetailScreen
class TranslationsSubjectDetailScreenEn {
	TranslationsSubjectDetailScreenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Subject'
	String get title => 'Subject';

	/// en: 'Name'
	String get nameHint => 'Name';

	/// en: 'Room'
	String get roomHint => 'Room';
}

// Path: subjectsScreen
class TranslationsSubjectsScreenEn {
	TranslationsSubjectsScreenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Subjects'
	String get title => 'Subjects';

	/// en: 'No subjects'
	String get noData => 'No subjects';
}

// Path: teacherDetailScreen
class TranslationsTeacherDetailScreenEn {
	TranslationsTeacherDetailScreenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Teacher'
	String get title => 'Teacher';

	/// en: 'Name'
	String get nameHint => 'Name';

	/// en: 'Subject'
	String get subjectHint => 'Subject';

	/// en: 'Note'
	String get noteHint => 'Note';
}

// Path: teachersScreen
class TranslationsTeachersScreenEn {
	TranslationsTeachersScreenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Teachers'
	String get title => 'Teachers';

	/// en: 'No teachers'
	String get noData => 'No teachers';
}

// Path: termDetailScreen
class TranslationsTermDetailScreenEn {
	TranslationsTermDetailScreenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Term'
	String get title => 'Term';

	/// en: 'Type'
	String get typeHint => 'Type';

	/// en: 'Type'
	String get typeTitle => 'Type';

	/// en: 'Year'
	String get yearHint => 'Year';

	/// en: 'Year'
	String get yearTitle => 'Year';

	/// en: 'Name'
	String get nameHint => 'Name';

	/// en: 'Start'
	String get startHint => 'Start';

	/// en: 'End'
	String get endHint => 'End';
}

// Path: termsScreen
class TranslationsTermsScreenEn {
	TranslationsTermsScreenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Terms'
	String get title => 'Terms';

	/// en: 'No terms'
	String get noData => 'No terms';
}

// Path: labelDetailScreen
class TranslationsLabelDetailScreenEn {
	TranslationsLabelDetailScreenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Label'
	String get title => 'Label';

	/// en: 'Name'
	String get nameHint => 'Name';

	/// en: 'Color'
	String get colorHint => 'Color';

	/// en: 'Color'
	String get dialogTitle => 'Color';
}

// Path: labelsScreen
class TranslationsLabelsScreenEn {
	TranslationsLabelsScreenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Labels'
	String get title => 'Labels';

	/// en: 'No labels'
	String get noData => 'No labels';
}

// Path: gradeInputDialog
class TranslationsGradeInputDialogEn {
	TranslationsGradeInputDialogEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Grade'
	String get gradeTitle => 'Grade';

	/// en: 'Attendance'
	String get attendanceTitle => 'Attendance';

	/// en: 'Value'
	String get valueHint => 'Value';

	/// en: 'Weight'
	String get weightHint => 'Weight';

	/// en: 'Comment'
	String get commentHint => 'Comment';

	/// en: 'Mark'
	String get markHint => 'Mark';

	/// en: 'GRADE'
	String get gradeButton => 'GRADE';

	/// en: 'ATTENDANCE'
	String get attdendanceButton => 'ATTENDANCE';
}

// Path: signInDialog
class TranslationsSignInDialogEn {
	TranslationsSignInDialogEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Sign in with Apple'
	String get appleButton => 'Sign in with Apple';

	/// en: 'Sign in with Google'
	String get googleButton => 'Sign in with Google';
}

// Path: assignmentField
class TranslationsAssignmentFieldEn {
	TranslationsAssignmentFieldEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Assignment'
	String get hintText => 'Assignment';

	/// en: 'New item'
	String get addText => 'New item';

	/// en: 'Label'
	String get labelTitle => 'Label';

	/// en: 'Add'
	String get actionTitle => 'Add';

	/// en: 'Assignment'
	String get imageTitle => 'Assignment';

	/// en: 'File not found'
	String get imageError => 'File not found';
}

// Path: notificationChannel
class TranslationsNotificationChannelEn {
	TranslationsNotificationChannelEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Reminders'
	String get reminders => 'Reminders';
}

// Path: button
class TranslationsButtonEn {
	TranslationsButtonEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'OK'
	String get ok => 'OK';

	/// en: 'CANCEL'
	String get cancel => 'CANCEL';

	/// en: 'SAVE'
	String get save => 'SAVE';

	/// en: 'DELETE'
	String get delete => 'DELETE';

	/// en: 'CLEAR'
	String get clear => 'CLEAR';
}

// Path: message
class TranslationsMessageEn {
	TranslationsMessageEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Assignment completed'
	String get assignmentCompleted => 'Assignment completed';

	/// en: 'Data updated'
	String get dataUpdated => 'Data updated';

	/// en: 'Profile deleted'
	String get profileDeleted => 'Profile deleted';

	/// en: 'Error occured'
	String get errorOccurred => 'Error occured';

	/// en: 'No connection'
	String get noConnection => 'No connection';
}

// Path: prompt
class TranslationsPromptEn {
	TranslationsPromptEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Confirmation'
	String get titleConfirmation => 'Confirmation';

	/// en: 'Delete this grade?'
	String get deleteGrade => 'Delete this grade?';

	/// en: 'Delete this image?'
	String get deleteImage => 'Delete this image?';

	/// en: 'Delete this avatar?'
	String get deleteAvatar => 'Delete this avatar?';

	/// en: 'Delete these notes?'
	String get deleteNote => 'Delete these notes?';

	/// en: 'Delete this subject?'
	String get deleteSubject => 'Delete this subject?';

	/// en: 'Delete this teacher?'
	String get deleteTeacher => 'Delete this teacher?';

	/// en: 'Delete this term?'
	String get deleteTerm => 'Delete this term?';

	/// en: 'Delete this label?'
	String get deleteLabel => 'Delete this label?';

	/// en: 'Delete this assignment?'
	String get deleteAssignment => 'Delete this assignment?';

	/// en: 'Delete this lesson?'
	String get deleteLesson => 'Delete this lesson?';

	/// en: 'Delete the profile and all data?'
	String get deleteProfile => 'Delete the profile and all data?';

	/// en: 'Set the default subjects?'
	String get resetSubjects => 'Set the default subjects?';

	/// en: 'Set the default labels?'
	String get resetLabels => 'Set the default labels?';

	/// en: 'Permission is required for the app to work properly. Open settings?'
	String get requirePermission => 'Permission is required for the app to work properly. Open settings?';

	/// en: 'Sign out of this account?'
	String get signOut => 'Sign out of this account?';
}

// Path: notification
class TranslationsNotificationEn {
	TranslationsNotificationEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsNotificationLessonStartEn lessonStart = TranslationsNotificationLessonStartEn.internal(_root);
	late final TranslationsNotificationUpcomingAssignmentsEn upcomingAssignments = TranslationsNotificationUpcomingAssignmentsEn.internal(_root);
}

// Path: dateFormat
class TranslationsDateFormatEn {
	TranslationsDateFormatEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: '$from to $to'
	String range({required Object from, required Object to}) => '${from} to ${to}';

	/// en: 'Today'
	String get today => 'Today';

	/// en: 'Tomorrow'
	String get tomorrow => 'Tomorrow';
}

// Path: themeMode
class TranslationsThemeModeEn {
	TranslationsThemeModeEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Light'
	String get light => 'Light';

	/// en: 'Dark'
	String get dark => 'Dark';

	/// en: 'System'
	String get system => 'System';
}

// Path: lessonMode
class TranslationsLessonModeEn {
	TranslationsLessonModeEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Priority only'
	String get priority => 'Priority only';

	/// en: 'Alarms only'
	String get alarms => 'Alarms only';

	/// en: 'Do not disturb'
	String get silent => 'Do not disturb';
}

// Path: assignmentStatus
class TranslationsAssignmentStatusEn {
	TranslationsAssignmentStatusEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Current'
	String get current => 'Current';

	/// en: 'Missed'
	String get missed => 'Missed';
}

// Path: userAction
class TranslationsUserActionEn {
	TranslationsUserActionEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Move'
	String get move => 'Move';

	/// en: 'Share'
	String get share => 'Share';

	/// en: 'Delete'
	String get delete => 'Delete';

	/// en: 'Photo'
	String get addPhoto => 'Photo';

	/// en: 'Image'
	String get addImage => 'Image';

	/// en: 'Label'
	String get addLabel => 'Label';

	/// en: 'Text'
	String get addText => 'Text';

	/// en: 'List'
	String get addList => 'List';
}

// Path: repeatSchedule
class TranslationsRepeatScheduleEn {
	TranslationsRepeatScheduleEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Every week'
	String get weekly => 'Every week';

	/// en: 'Every 2 weeks'
	String get biweekly => 'Every 2 weeks';

	/// en: 'Never'
	String get never => 'Never';
}

// Path: bellSchedule
class TranslationsBellScheduleEn {
	TranslationsBellScheduleEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Common'
	String get common => 'Common';

	/// en: 'Daily'
	String get daily => 'Daily';
}

// Path: gradeScale
class TranslationsGradeScaleEn {
	TranslationsGradeScaleEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: '5-point'
	String get numeric5 => '5-point';

	/// en: '10-point'
	String get numeric10 => '10-point';

	/// en: '12-point'
	String get numeric12 => '12-point';

	/// en: '20-point'
	String get numeric20 => '20-point';

	/// en: '100-point'
	String get numeric100 => '100-point';
}

// Path: reminderTime
class TranslationsReminderTimeEn {
	TranslationsReminderTimeEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: '5 minutes'
	String get minutes5 => '5 minutes';

	/// en: '10 minutes'
	String get minutes10 => '10 minutes';

	/// en: '15 minutes'
	String get minutes15 => '15 minutes';

	/// en: '20 minutes'
	String get minutes20 => '20 minutes';
}

// Path: academicTerm
class TranslationsAcademicTermEn {
	TranslationsAcademicTermEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Quarter'
	String get quarter => 'Quarter';

	/// en: 'Trimester'
	String get trimester => 'Trimester';

	/// en: 'Semester'
	String get semester => 'Semester';
}

// Path: termType
class TranslationsTermTypeEn {
	TranslationsTermTypeEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Year'
	String get year => 'Year';

	/// en: 'Study'
	String get study => 'Study';

	/// en: 'Vacation'
	String get vacation => 'Vacation';

	/// en: 'Holiday'
	String get holiday => 'Holiday';
}

// Path: color
class TranslationsColorEn {
	TranslationsColorEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Red'
	String get red => 'Red';

	/// en: 'Pink'
	String get pink => 'Pink';

	/// en: 'Purple'
	String get purple => 'Purple';

	/// en: 'Deep purple'
	String get deepPurple => 'Deep purple';

	/// en: 'Indigo'
	String get indigo => 'Indigo';

	/// en: 'Blue'
	String get blue => 'Blue';

	/// en: 'Light blue'
	String get lightBlue => 'Light blue';

	/// en: 'Cyan'
	String get cyan => 'Cyan';

	/// en: 'Teal'
	String get teal => 'Teal';

	/// en: 'Green'
	String get green => 'Green';

	/// en: 'Light green'
	String get lightGreen => 'Light green';

	/// en: 'Lime'
	String get lime => 'Lime';

	/// en: 'Yellow'
	String get yellow => 'Yellow';

	/// en: 'Amber'
	String get amber => 'Amber';

	/// en: 'Orange'
	String get orange => 'Orange';

	/// en: 'Blue grey'
	String get blueGrey => 'Blue grey';
}

// Path: notification.lessonStart
class TranslationsNotificationLessonStartEn {
	TranslationsNotificationLessonStartEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: '${time: jm} – $subject'
	String title({required DateTime time, required Object subject}) => '${DateFormat.jm('en').format(time)} – ${subject}';

	/// en: 'Room $room'
	String body({required Object room}) => 'Room ${room}';
}

// Path: notification.upcomingAssignments
class TranslationsNotificationUpcomingAssignmentsEn {
	TranslationsNotificationUpcomingAssignmentsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Upcoming assignments'
	String get title => 'Upcoming assignments';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.title' => 'Student Planner',
			'updateInfo.title' => 'What\'s new',
			'updateInfo.text.0' => '• Improved widget texts',
			'updateInfo.text.1' => '• Attendance mark input moved to a separate dialog',
			'authScreen.title' => 'Student Planner',
			'authScreen.buttonGoogle' => 'Sign in with Google',
			'authScreen.buttonLater' => 'Later',
			'homeScreen.schedule' => 'Diary',
			'homeScreen.assignments' => 'Assignments',
			'homeScreen.bells' => 'Bells',
			'homeScreen.grades' => 'Grades',
			'homeScreen.profile' => 'Profile',
			'homeScreen.migrationInProgress' => 'Updating data...',
			'homeScreen.migrationErrorTitle' => 'Error',
			'homeScreen.migrationErrorText' => 'Failed to update data. The application will now close.',
			'assignmentsScreen.title' => 'Assignments',
			'assignmentsScreen.noData' => 'No assignments\nAdd assignments in the diary',
			'noteDetailScreen.title' => 'Notes',
			'noteDetailScreen.textHint' => 'Text',
			'profileScreen.title' => 'Profile',
			'profileScreen.subjects' => 'Subjects',
			'profileScreen.teachers' => 'Teachers',
			'profileScreen.terms' => 'Terms',
			'profileScreen.labels' => 'Labels',
			'profileScreen.settings' => 'Settings',
			'profileScreen.about' => 'About',
			'profileScreen.welcomeText' => ({required Object name}) => 'Hello, ${name}!',
			'profileScreen.signInButton' => 'Sign In',
			'scheduleScreen.numberHeader' => '#',
			'scheduleScreen.lessonHeader' => 'Lesson',
			'scheduleScreen.gradeHeader' => '☆',
			'scheduleScreen.noteHint' => 'Notes',
			'bellsScreen.title' => 'Bells',
			'bellsScreen.period' => 'Period',
			'bellsScreen.start' => 'Start',
			'bellsScreen.end' => 'End',
			'bellsScreen.kBreak' => 'Break',
			'bellsScreen.breakText' => ({required Object minutes}) => '${minutes} min',
			'gradeBookScreen.title' => 'Book',
			'gradeBookScreen.yearTitle' => 'Year',
			'gradeBookScreen.termTitle' => 'Term',
			'gradeReportScreen.title' => 'Report',
			'gradeReportScreen.yearTitle' => 'Year',
			'gradeReportScreen.termTitle' => 'Term',
			'gradeBookView.subject' => 'Subject',
			'gradeBookView.average' => 'Average',
			'gradeBookView.noData' => 'No grades\nAdd grades in the diary',
			'gradeReportView.subject' => 'Subject',
			'gradeReportView.terms.0' => 'I',
			'gradeReportView.terms.1' => 'II',
			'gradeReportView.terms.2' => 'III',
			'gradeReportView.terms.3' => 'IV',
			'gradeReportView.year' => '∑',
			'gradeReportView.noData' => 'No terms\nAdd terms in the profile',
			'gradeReportView.noGrades' => 'No grades\nSelect another term',
			'gradesHistoryScreen.date' => 'Date',
			'gradesHistoryScreen.grade' => 'Grade',
			'gradesHistoryScreen.comment' => 'Comment',
			'gradesHistoryScreen.noData' => 'No grades',
			'helpScreen.title' => 'About',
			'helpScreen.versionText' => ({required Object version, required Object build}) => 'Version ${version} (${build})',
			'helpScreen.shareApp' => 'Share application',
			'helpScreen.rateApp' => 'Rate application',
			'helpScreen.contactDev' => 'Contact developer',
			'helpScreen.deleteProfile' => 'Delete profile',
			'assignmentDetailScreen.title' => 'Assignment',
			'assignmentDetailScreen.moveTitle' => 'Move assignment',
			'lessonDetailScreen.title' => ({required Object slot}) => 'Period ${slot}',
			'lessonDetailScreen.subjectHint' => 'Subject',
			'lessonDetailScreen.topicHint' => 'Topic',
			'lessonDetailScreen.roomHint' => 'Room',
			'lessonDetailScreen.roomPrefix' => 'Room',
			'settingsScreen.title' => 'Settings',
			'settingsScreen.general' => 'General',
			'settingsScreen.advanced' => 'Advanced',
			'settingsScreen.reminders' => 'Reminders',
			'settingsScreen.schedule' => 'Schedule',
			'settingsScreen.grades' => 'Grades',
			'settingsScreen.importantButton' => 'Important',
			'settingsScreen.importantTitle' => 'Important',
			'settingsScreen.importantText' => 'For the application to work correctly on Xiaomi, Huawei, Vivo and Oppo devices, adjust the system settings for the app:\n• Autostart – enabled\n• Background activity – enabled\n• Battery saver – disabled',
			'generalSettingsScreen.title' => 'General',
			'generalSettingsScreen.appLanguage' => 'App language',
			'generalSettingsScreen.themeMode' => 'Theme mode',
			'generalSettingsScreen.baseColor' => 'Base color',
			'generalSettingsScreen.backgroundImage' => 'Background image',
			'generalSettingsScreen.backgroundImageNone' => 'None',
			'generalSettingsScreen.appFont' => 'App font',
			'advancedSettingsScreen.title' => 'Advanced',
			'advancedSettingsScreen.lessonMode' => 'Lesson mode',
			'advancedSettingsScreen.lessonModeDisabled' => 'Disabled',
			'remindersSettingsScreen.title' => 'Reminders',
			'remindersSettingsScreen.lessonStart' => 'Lesson start',
			'remindersSettingsScreen.lessonStartText' => ({required Object time}) => '${time} before bell',
			'remindersSettingsScreen.lessonStartDisabled' => 'Disabled',
			'remindersSettingsScreen.upcomingAssignments' => 'Upcoming assignments',
			'remindersSettingsScreen.upcomingAssignmentsText' => ({required Object time}) => 'Daily at ${time}',
			'remindersSettingsScreen.upcomingAssignmentsDisabled' => 'Disabled',
			'scheduleSettingsScreen.title' => 'Schedule',
			'scheduleSettingsScreen.academicTerm' => 'Academic term',
			'scheduleSettingsScreen.classDays' => 'Class days',
			'scheduleSettingsScreen.periodCount' => 'Period count',
			'scheduleSettingsScreen.periodCountText' => ({required Object count}) => '${count} periods a day',
			'scheduleSettingsScreen.repeatSchedule' => 'Repeat schedule',
			'scheduleSettingsScreen.bellSchedule' => 'Bell schedule',
			'gradesSettingsScreen.title' => 'Grades',
			'gradesSettingsScreen.gradeScale' => 'Grading scale',
			'gradesSettingsScreen.signValues' => 'Sign values',
			'gradesSettingsScreen.signValuesText' => ({required Object plus, required Object minus}) => 'Plus: ${plus}, Minus: ${minus}',
			'gradesSettingsScreen.signValuesPlus' => 'Plus',
			'gradesSettingsScreen.signValuesMinus' => 'Minus',
			'gradesSettingsScreen.roundingRules' => 'Rounding rules',
			'gradesSettingsScreen.roundingRulesText' => ({required Object threshold, required Object precision}) => 'Threshold: ${threshold}, Precision: ${precision}',
			'gradesSettingsScreen.roundingRulesThreshold' => 'Threshold',
			'gradesSettingsScreen.roundingRulesPrecision' => 'Precision',
			'gradesSettingsScreen.gradeColors' => 'Grade colors',
			'gradesSettingsScreen.gradeColorsTitle' => 'Color',
			'gradesSettingsScreen.gradeColorsOther' => 'Other',
			'gradesSettingsScreen.attendanceMarks' => 'Attendance marks',
			'gradesSettingsScreen.attendanceMark' => 'New mark',
			'gradesSettingsScreen.attendanceName' => 'Name',
			'subjectDetailScreen.title' => 'Subject',
			'subjectDetailScreen.nameHint' => 'Name',
			'subjectDetailScreen.roomHint' => 'Room',
			'subjectsScreen.title' => 'Subjects',
			'subjectsScreen.noData' => 'No subjects',
			'teacherDetailScreen.title' => 'Teacher',
			'teacherDetailScreen.nameHint' => 'Name',
			'teacherDetailScreen.subjectHint' => 'Subject',
			'teacherDetailScreen.noteHint' => 'Note',
			'teachersScreen.title' => 'Teachers',
			'teachersScreen.noData' => 'No teachers',
			'termDetailScreen.title' => 'Term',
			'termDetailScreen.typeHint' => 'Type',
			'termDetailScreen.typeTitle' => 'Type',
			'termDetailScreen.yearHint' => 'Year',
			'termDetailScreen.yearTitle' => 'Year',
			'termDetailScreen.nameHint' => 'Name',
			'termDetailScreen.startHint' => 'Start',
			'termDetailScreen.endHint' => 'End',
			'termsScreen.title' => 'Terms',
			'termsScreen.noData' => 'No terms',
			'labelDetailScreen.title' => 'Label',
			'labelDetailScreen.nameHint' => 'Name',
			'labelDetailScreen.colorHint' => 'Color',
			'labelDetailScreen.dialogTitle' => 'Color',
			'labelsScreen.title' => 'Labels',
			'labelsScreen.noData' => 'No labels',
			'gradeInputDialog.gradeTitle' => 'Grade',
			'gradeInputDialog.attendanceTitle' => 'Attendance',
			'gradeInputDialog.valueHint' => 'Value',
			'gradeInputDialog.weightHint' => 'Weight',
			'gradeInputDialog.commentHint' => 'Comment',
			'gradeInputDialog.markHint' => 'Mark',
			'gradeInputDialog.gradeButton' => 'GRADE',
			'gradeInputDialog.attdendanceButton' => 'ATTENDANCE',
			'signInDialog.appleButton' => 'Sign in with Apple',
			'signInDialog.googleButton' => 'Sign in with Google',
			'assignmentField.hintText' => 'Assignment',
			'assignmentField.addText' => 'New item',
			'assignmentField.labelTitle' => 'Label',
			'assignmentField.actionTitle' => 'Add',
			'assignmentField.imageTitle' => 'Assignment',
			'assignmentField.imageError' => 'File not found',
			'notificationChannel.reminders' => 'Reminders',
			'button.ok' => 'OK',
			'button.cancel' => 'CANCEL',
			'button.save' => 'SAVE',
			'button.delete' => 'DELETE',
			'button.clear' => 'CLEAR',
			'message.assignmentCompleted' => 'Assignment completed',
			'message.dataUpdated' => 'Data updated',
			'message.profileDeleted' => 'Profile deleted',
			'message.errorOccurred' => 'Error occured',
			'message.noConnection' => 'No connection',
			'prompt.titleConfirmation' => 'Confirmation',
			'prompt.deleteGrade' => 'Delete this grade?',
			'prompt.deleteImage' => 'Delete this image?',
			'prompt.deleteAvatar' => 'Delete this avatar?',
			'prompt.deleteNote' => 'Delete these notes?',
			'prompt.deleteSubject' => 'Delete this subject?',
			'prompt.deleteTeacher' => 'Delete this teacher?',
			'prompt.deleteTerm' => 'Delete this term?',
			'prompt.deleteLabel' => 'Delete this label?',
			'prompt.deleteAssignment' => 'Delete this assignment?',
			'prompt.deleteLesson' => 'Delete this lesson?',
			'prompt.deleteProfile' => 'Delete the profile and all data?',
			'prompt.resetSubjects' => 'Set the default subjects?',
			'prompt.resetLabels' => 'Set the default labels?',
			'prompt.requirePermission' => 'Permission is required for the app to work properly. Open settings?',
			'prompt.signOut' => 'Sign out of this account?',
			'notification.lessonStart.title' => ({required DateTime time, required Object subject}) => '${DateFormat.jm('en').format(time)} – ${subject}',
			'notification.lessonStart.body' => ({required Object room}) => 'Room ${room}',
			'notification.upcomingAssignments.title' => 'Upcoming assignments',
			'dateFormat.range' => ({required Object from, required Object to}) => '${from} to ${to}',
			'dateFormat.today' => 'Today',
			'dateFormat.tomorrow' => 'Tomorrow',
			'themeMode.light' => 'Light',
			'themeMode.dark' => 'Dark',
			'themeMode.system' => 'System',
			'lessonMode.priority' => 'Priority only',
			'lessonMode.alarms' => 'Alarms only',
			'lessonMode.silent' => 'Do not disturb',
			'assignmentStatus.current' => 'Current',
			'assignmentStatus.missed' => 'Missed',
			'userAction.move' => 'Move',
			'userAction.share' => 'Share',
			'userAction.delete' => 'Delete',
			'userAction.addPhoto' => 'Photo',
			'userAction.addImage' => 'Image',
			'userAction.addLabel' => 'Label',
			'userAction.addText' => 'Text',
			'userAction.addList' => 'List',
			'repeatSchedule.weekly' => 'Every week',
			'repeatSchedule.biweekly' => 'Every 2 weeks',
			'repeatSchedule.never' => 'Never',
			'bellSchedule.common' => 'Common',
			'bellSchedule.daily' => 'Daily',
			'gradeScale.numeric5' => '5-point',
			'gradeScale.numeric10' => '10-point',
			'gradeScale.numeric12' => '12-point',
			'gradeScale.numeric20' => '20-point',
			'gradeScale.numeric100' => '100-point',
			'reminderTime.minutes5' => '5 minutes',
			'reminderTime.minutes10' => '10 minutes',
			'reminderTime.minutes15' => '15 minutes',
			'reminderTime.minutes20' => '20 minutes',
			'academicTerm.quarter' => 'Quarter',
			'academicTerm.trimester' => 'Trimester',
			'academicTerm.semester' => 'Semester',
			'termType.year' => 'Year',
			'termType.study' => 'Study',
			'termType.vacation' => 'Vacation',
			'termType.holiday' => 'Holiday',
			'color.red' => 'Red',
			'color.pink' => 'Pink',
			'color.purple' => 'Purple',
			'color.deepPurple' => 'Deep purple',
			'color.indigo' => 'Indigo',
			'color.blue' => 'Blue',
			'color.lightBlue' => 'Light blue',
			'color.cyan' => 'Cyan',
			'color.teal' => 'Teal',
			'color.green' => 'Green',
			'color.lightGreen' => 'Light green',
			'color.lime' => 'Lime',
			'color.yellow' => 'Yellow',
			'color.amber' => 'Amber',
			'color.orange' => 'Orange',
			'color.blueGrey' => 'Blue grey',
			_ => null,
		};
	}
}
