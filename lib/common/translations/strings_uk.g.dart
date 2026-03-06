///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsUk extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsUk({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.uk,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <uk>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsUk _root = this; // ignore: unused_field

	@override 
	TranslationsUk $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsUk(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAppUk app = _TranslationsAppUk._(_root);
	@override late final _TranslationsUpdateInfoUk updateInfo = _TranslationsUpdateInfoUk._(_root);
	@override late final _TranslationsAuthScreenUk authScreen = _TranslationsAuthScreenUk._(_root);
	@override late final _TranslationsHomeScreenUk homeScreen = _TranslationsHomeScreenUk._(_root);
	@override late final _TranslationsAssignmentsScreenUk assignmentsScreen = _TranslationsAssignmentsScreenUk._(_root);
	@override late final _TranslationsNoteDetailScreenUk noteDetailScreen = _TranslationsNoteDetailScreenUk._(_root);
	@override late final _TranslationsProfileScreenUk profileScreen = _TranslationsProfileScreenUk._(_root);
	@override late final _TranslationsScheduleScreenUk scheduleScreen = _TranslationsScheduleScreenUk._(_root);
	@override late final _TranslationsBellsScreenUk bellsScreen = _TranslationsBellsScreenUk._(_root);
	@override late final _TranslationsGradeBookScreenUk gradeBookScreen = _TranslationsGradeBookScreenUk._(_root);
	@override late final _TranslationsGradeReportScreenUk gradeReportScreen = _TranslationsGradeReportScreenUk._(_root);
	@override late final _TranslationsGradeBookViewUk gradeBookView = _TranslationsGradeBookViewUk._(_root);
	@override late final _TranslationsGradeReportViewUk gradeReportView = _TranslationsGradeReportViewUk._(_root);
	@override late final _TranslationsGradesHistoryScreenUk gradesHistoryScreen = _TranslationsGradesHistoryScreenUk._(_root);
	@override late final _TranslationsHelpScreenUk helpScreen = _TranslationsHelpScreenUk._(_root);
	@override late final _TranslationsAssignmentDetailScreenUk assignmentDetailScreen = _TranslationsAssignmentDetailScreenUk._(_root);
	@override late final _TranslationsLessonDetailScreenUk lessonDetailScreen = _TranslationsLessonDetailScreenUk._(_root);
	@override late final _TranslationsSettingsScreenUk settingsScreen = _TranslationsSettingsScreenUk._(_root);
	@override late final _TranslationsGeneralSettingsScreenUk generalSettingsScreen = _TranslationsGeneralSettingsScreenUk._(_root);
	@override late final _TranslationsAdvancedSettingsScreenUk advancedSettingsScreen = _TranslationsAdvancedSettingsScreenUk._(_root);
	@override late final _TranslationsRemindersSettingsScreenUk remindersSettingsScreen = _TranslationsRemindersSettingsScreenUk._(_root);
	@override late final _TranslationsScheduleSettingsScreenUk scheduleSettingsScreen = _TranslationsScheduleSettingsScreenUk._(_root);
	@override late final _TranslationsGradesSettingsScreenUk gradesSettingsScreen = _TranslationsGradesSettingsScreenUk._(_root);
	@override late final _TranslationsSubjectDetailScreenUk subjectDetailScreen = _TranslationsSubjectDetailScreenUk._(_root);
	@override late final _TranslationsSubjectsScreenUk subjectsScreen = _TranslationsSubjectsScreenUk._(_root);
	@override late final _TranslationsTeacherDetailScreenUk teacherDetailScreen = _TranslationsTeacherDetailScreenUk._(_root);
	@override late final _TranslationsTeachersScreenUk teachersScreen = _TranslationsTeachersScreenUk._(_root);
	@override late final _TranslationsTermDetailScreenUk termDetailScreen = _TranslationsTermDetailScreenUk._(_root);
	@override late final _TranslationsTermsScreenUk termsScreen = _TranslationsTermsScreenUk._(_root);
	@override late final _TranslationsLabelDetailScreenUk labelDetailScreen = _TranslationsLabelDetailScreenUk._(_root);
	@override late final _TranslationsLabelsScreenUk labelsScreen = _TranslationsLabelsScreenUk._(_root);
	@override late final _TranslationsGradeInputDialogUk gradeInputDialog = _TranslationsGradeInputDialogUk._(_root);
	@override late final _TranslationsSignInDialogUk signInDialog = _TranslationsSignInDialogUk._(_root);
	@override late final _TranslationsAssignmentFieldUk assignmentField = _TranslationsAssignmentFieldUk._(_root);
	@override late final _TranslationsNotificationChannelUk notificationChannel = _TranslationsNotificationChannelUk._(_root);
	@override late final _TranslationsButtonUk button = _TranslationsButtonUk._(_root);
	@override late final _TranslationsMessageUk message = _TranslationsMessageUk._(_root);
	@override late final _TranslationsPromptUk prompt = _TranslationsPromptUk._(_root);
	@override late final _TranslationsNotificationUk notification = _TranslationsNotificationUk._(_root);
	@override late final _TranslationsDateFormatUk dateFormat = _TranslationsDateFormatUk._(_root);
	@override late final _TranslationsThemeModeUk themeMode = _TranslationsThemeModeUk._(_root);
	@override late final _TranslationsLessonModeUk lessonMode = _TranslationsLessonModeUk._(_root);
	@override late final _TranslationsAssignmentStatusUk assignmentStatus = _TranslationsAssignmentStatusUk._(_root);
	@override late final _TranslationsUserActionUk userAction = _TranslationsUserActionUk._(_root);
	@override late final _TranslationsRepeatScheduleUk repeatSchedule = _TranslationsRepeatScheduleUk._(_root);
	@override late final _TranslationsBellScheduleUk bellSchedule = _TranslationsBellScheduleUk._(_root);
	@override late final _TranslationsGradeScaleUk gradeScale = _TranslationsGradeScaleUk._(_root);
	@override late final _TranslationsReminderTimeUk reminderTime = _TranslationsReminderTimeUk._(_root);
	@override late final _TranslationsAcademicTermUk academicTerm = _TranslationsAcademicTermUk._(_root);
	@override late final _TranslationsTermTypeUk termType = _TranslationsTermTypeUk._(_root);
	@override late final _TranslationsColorUk color = _TranslationsColorUk._(_root);
}

// Path: app
class _TranslationsAppUk extends TranslationsAppEn {
	_TranslationsAppUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Щоденник школяра';
}

// Path: updateInfo
class _TranslationsUpdateInfoUk extends TranslationsUpdateInfoEn {
	_TranslationsUpdateInfoUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Що нового';
	@override List<String> get text => [
		'• Покращено тексти віджета',
		'• Введення позначки відвідуваності в окремому діалозі',
	];
}

// Path: authScreen
class _TranslationsAuthScreenUk extends TranslationsAuthScreenEn {
	_TranslationsAuthScreenUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Щоденник школяра';
	@override String get buttonGoogle => 'Увійти через Google';
	@override String get buttonLater => 'Пізніше';
}

// Path: homeScreen
class _TranslationsHomeScreenUk extends TranslationsHomeScreenEn {
	_TranslationsHomeScreenUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get schedule => 'Щоденник';
	@override String get assignments => 'Завдання';
	@override String get bells => 'Дзвінки';
	@override String get grades => 'Оцінки';
	@override String get profile => 'Профіль';
	@override String get migrationInProgress => 'Оновлення даних...';
	@override String get migrationErrorTitle => 'Помилка';
	@override String get migrationErrorText => 'Не вдалося оновити дані. Застосунок буде закрито.';
}

// Path: assignmentsScreen
class _TranslationsAssignmentsScreenUk extends TranslationsAssignmentsScreenEn {
	_TranslationsAssignmentsScreenUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Завдання';
	@override String get noData => 'Немає завдань\nДодайте завдання в щоденник';
}

// Path: noteDetailScreen
class _TranslationsNoteDetailScreenUk extends TranslationsNoteDetailScreenEn {
	_TranslationsNoteDetailScreenUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Нотатки';
	@override String get textHint => 'Текст';
}

// Path: profileScreen
class _TranslationsProfileScreenUk extends TranslationsProfileScreenEn {
	_TranslationsProfileScreenUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Профіль';
	@override String get subjects => 'Предмети';
	@override String get teachers => 'Вчителі';
	@override String get terms => 'Періоди';
	@override String get labels => 'Ярлики';
	@override String get settings => 'Налаштування';
	@override String get about => 'Про додаток';
	@override String welcomeText({required Object name}) => 'Привіт, ${name}!';
	@override String get signInButton => 'Увійти';
}

// Path: scheduleScreen
class _TranslationsScheduleScreenUk extends TranslationsScheduleScreenEn {
	_TranslationsScheduleScreenUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get numberHeader => '#';
	@override String get lessonHeader => 'Урок';
	@override String get gradeHeader => '☆';
	@override String get noteHint => 'Нотатки';
}

// Path: bellsScreen
class _TranslationsBellsScreenUk extends TranslationsBellsScreenEn {
	_TranslationsBellsScreenUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Дзвінки';
	@override String get period => 'Урок';
	@override String get start => 'Початок';
	@override String get end => 'Кінець';
	@override String get kBreak => 'Перерва';
	@override String breakText({required Object minutes}) => '${minutes} хв';
}

// Path: gradeBookScreen
class _TranslationsGradeBookScreenUk extends TranslationsGradeBookScreenEn {
	_TranslationsGradeBookScreenUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Журнал';
	@override String get yearTitle => 'Рік';
	@override String get termTitle => 'Період';
}

// Path: gradeReportScreen
class _TranslationsGradeReportScreenUk extends TranslationsGradeReportScreenEn {
	_TranslationsGradeReportScreenUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Табель';
	@override String get yearTitle => 'Рік';
	@override String get termTitle => 'Період';
}

// Path: gradeBookView
class _TranslationsGradeBookViewUk extends TranslationsGradeBookViewEn {
	_TranslationsGradeBookViewUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get subject => 'Предмет';
	@override String get average => 'Середня';
	@override String get noData => 'Немає оцінок\nДодайте оцінки в щоденник';
}

// Path: gradeReportView
class _TranslationsGradeReportViewUk extends TranslationsGradeReportViewEn {
	_TranslationsGradeReportViewUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get subject => 'Предмет';
	@override List<String> get terms => [
		'I',
		'II',
		'III',
		'IV',
	];
	@override String get year => '∑';
	@override String get noData => 'Немає періодів\nДодайте періоди у профілі';
	@override String get noGrades => 'Немає оцінок\nВиберіть інший період';
}

// Path: gradesHistoryScreen
class _TranslationsGradesHistoryScreenUk extends TranslationsGradesHistoryScreenEn {
	_TranslationsGradesHistoryScreenUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get date => 'Дата';
	@override String get grade => 'Оцінка';
	@override String get comment => 'Коментар';
	@override String get noData => 'Немає оцінок';
}

// Path: helpScreen
class _TranslationsHelpScreenUk extends TranslationsHelpScreenEn {
	_TranslationsHelpScreenUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Про додаток';
	@override String versionText({required Object version, required Object build}) => 'Версія ${version} (${build})';
	@override String get shareApp => 'Поділитися додатком';
	@override String get rateApp => 'Оцінити додаток';
	@override String get contactDev => 'Написати розробнику';
	@override String get deleteProfile => 'Видалити профіль';
}

// Path: assignmentDetailScreen
class _TranslationsAssignmentDetailScreenUk extends TranslationsAssignmentDetailScreenEn {
	_TranslationsAssignmentDetailScreenUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Завдання';
	@override String get moveTitle => 'Перенести завдання';
}

// Path: lessonDetailScreen
class _TranslationsLessonDetailScreenUk extends TranslationsLessonDetailScreenEn {
	_TranslationsLessonDetailScreenUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String title({required Object slot}) => 'Урок ${slot}';
	@override String get subjectHint => 'Предмет';
	@override String get topicHint => 'Тема';
	@override String get roomHint => 'Кабінет';
	@override String get roomPrefix => 'Кабінет';
}

// Path: settingsScreen
class _TranslationsSettingsScreenUk extends TranslationsSettingsScreenEn {
	_TranslationsSettingsScreenUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Налаштування';
	@override String get general => 'Загальні';
	@override String get advanced => 'Додаткові';
	@override String get reminders => 'Нагадування';
	@override String get schedule => 'Розклад';
	@override String get grades => 'Оцінки';
	@override String get importantButton => 'Важливо';
	@override String get importantTitle => 'Важливо';
	@override String get importantText => 'Для коректної роботи застосунку на пристроях Xiaomi, Huawei, Vivo та Oppo налаштуйте системні параметри для застосунку:\n• Автозапуск – увімкнено\n• Фонова робота – увімкнено\n• Економія батареї – вимкнено';
}

// Path: generalSettingsScreen
class _TranslationsGeneralSettingsScreenUk extends TranslationsGeneralSettingsScreenEn {
	_TranslationsGeneralSettingsScreenUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Загальні';
	@override String get appLanguage => 'Мова додатка';
	@override String get themeMode => 'Режим теми';
	@override String get baseColor => 'Базовий колір';
	@override String get backgroundImage => 'Фонове зображення';
	@override String get backgroundImageNone => 'Немає';
	@override String get appFont => 'Шрифт додатка';
}

// Path: advancedSettingsScreen
class _TranslationsAdvancedSettingsScreenUk extends TranslationsAdvancedSettingsScreenEn {
	_TranslationsAdvancedSettingsScreenUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Додаткові';
	@override String get lessonMode => 'Режим уроку';
	@override String get lessonModeDisabled => 'Вимкнено';
}

// Path: remindersSettingsScreen
class _TranslationsRemindersSettingsScreenUk extends TranslationsRemindersSettingsScreenEn {
	_TranslationsRemindersSettingsScreenUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Нагадування';
	@override String get lessonStart => 'Початок уроку';
	@override String lessonStartText({required Object time}) => 'За ${time} до дзвінка';
	@override String get lessonStartDisabled => 'Вимкнено';
	@override String get upcomingAssignments => 'Найближчі завдання';
	@override String upcomingAssignmentsText({required Object time}) => 'Щодня о ${time}';
	@override String get upcomingAssignmentsDisabled => 'Вимкнено';
}

// Path: scheduleSettingsScreen
class _TranslationsScheduleSettingsScreenUk extends TranslationsScheduleSettingsScreenEn {
	_TranslationsScheduleSettingsScreenUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Розклад';
	@override String get academicTerm => 'Навчальний період';
	@override String get classDays => 'Навчальні дні';
	@override String get periodCount => 'Кількість уроків';
	@override String periodCountText({required Object count}) => '${count} уроків на день';
	@override String get repeatSchedule => 'Повторення розкладу';
	@override String get bellSchedule => 'Розклад дзвінків';
}

// Path: gradesSettingsScreen
class _TranslationsGradesSettingsScreenUk extends TranslationsGradesSettingsScreenEn {
	_TranslationsGradesSettingsScreenUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Оцінки';
	@override String get gradeScale => 'Шкала оцінювання';
	@override String get signValues => 'Значення знаків';
	@override String signValuesText({required Object plus, required Object minus}) => 'Плюс: ${plus}, Мінус: ${minus}';
	@override String get signValuesPlus => 'Плюс';
	@override String get signValuesMinus => 'Мінус';
	@override String get roundingRules => 'Правила округлення';
	@override String roundingRulesText({required Object threshold, required Object precision}) => 'Поріг: ${threshold}, Точність: ${precision}';
	@override String get roundingRulesThreshold => 'Поріг';
	@override String get roundingRulesPrecision => 'Точність';
	@override String get gradeColors => 'Кольори оцінок';
	@override String get gradeColorsTitle => 'Колір';
	@override String get gradeColorsOther => 'Інші';
	@override String get attendanceMarks => 'Причини відвідування';
	@override String get attendanceMark => 'Нова відмітка';
	@override String get attendanceName => 'Назва';
}

// Path: subjectDetailScreen
class _TranslationsSubjectDetailScreenUk extends TranslationsSubjectDetailScreenEn {
	_TranslationsSubjectDetailScreenUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Предмет';
	@override String get nameHint => 'Назва';
	@override String get roomHint => 'Кабінет';
}

// Path: subjectsScreen
class _TranslationsSubjectsScreenUk extends TranslationsSubjectsScreenEn {
	_TranslationsSubjectsScreenUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Предмети';
	@override String get noData => 'Немає предметів';
}

// Path: teacherDetailScreen
class _TranslationsTeacherDetailScreenUk extends TranslationsTeacherDetailScreenEn {
	_TranslationsTeacherDetailScreenUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Вчитель';
	@override String get nameHint => 'Ім\'я';
	@override String get subjectHint => 'Предмет';
	@override String get noteHint => 'Примітка';
}

// Path: teachersScreen
class _TranslationsTeachersScreenUk extends TranslationsTeachersScreenEn {
	_TranslationsTeachersScreenUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Вчителі';
	@override String get noData => 'Немає вчителів';
}

// Path: termDetailScreen
class _TranslationsTermDetailScreenUk extends TranslationsTermDetailScreenEn {
	_TranslationsTermDetailScreenUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Період';
	@override String get typeHint => 'Тип';
	@override String get typeTitle => 'Тип';
	@override String get yearHint => 'Рік';
	@override String get yearTitle => 'Рік';
	@override String get nameHint => 'Назва';
	@override String get startHint => 'Початок';
	@override String get endHint => 'Кінець';
}

// Path: termsScreen
class _TranslationsTermsScreenUk extends TranslationsTermsScreenEn {
	_TranslationsTermsScreenUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Періоди';
	@override String get noData => 'Немає періодів';
}

// Path: labelDetailScreen
class _TranslationsLabelDetailScreenUk extends TranslationsLabelDetailScreenEn {
	_TranslationsLabelDetailScreenUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ярлик';
	@override String get nameHint => 'Назва';
	@override String get colorHint => 'Колір';
	@override String get dialogTitle => 'Колір';
}

// Path: labelsScreen
class _TranslationsLabelsScreenUk extends TranslationsLabelsScreenEn {
	_TranslationsLabelsScreenUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ярлики';
	@override String get noData => 'Немає ярликів';
}

// Path: gradeInputDialog
class _TranslationsGradeInputDialogUk extends TranslationsGradeInputDialogEn {
	_TranslationsGradeInputDialogUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get gradeTitle => 'Оцінка';
	@override String get attendanceTitle => 'Відвідування';
	@override String get valueHint => 'Значення';
	@override String get weightHint => 'Вага';
	@override String get commentHint => 'Коментар';
	@override String get markHint => 'Відмітка';
	@override String get gradeButton => 'ОЦІНКА';
	@override String get attdendanceButton => 'ВІДВІДУВАННЯ';
}

// Path: signInDialog
class _TranslationsSignInDialogUk extends TranslationsSignInDialogEn {
	_TranslationsSignInDialogUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get appleButton => 'Вхід з Apple';
	@override String get googleButton => 'Вхід з Google';
}

// Path: assignmentField
class _TranslationsAssignmentFieldUk extends TranslationsAssignmentFieldEn {
	_TranslationsAssignmentFieldUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get hintText => 'Завдання';
	@override String get addText => 'Новий пункт';
	@override String get labelTitle => 'Ярлик';
	@override String get actionTitle => 'Додати';
	@override String get imageTitle => 'Завдання';
	@override String get imageError => 'Файл не знайдено';
}

// Path: notificationChannel
class _TranslationsNotificationChannelUk extends TranslationsNotificationChannelEn {
	_TranslationsNotificationChannelUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get reminders => 'Нагадування';
}

// Path: button
class _TranslationsButtonUk extends TranslationsButtonEn {
	_TranslationsButtonUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get ok => 'ОК';
	@override String get cancel => 'ВІДМІНА';
	@override String get save => 'ЗБЕРІГТИ';
	@override String get delete => 'ВИДАЛИТИ';
	@override String get clear => 'ОЧИСТИТИ';
}

// Path: message
class _TranslationsMessageUk extends TranslationsMessageEn {
	_TranslationsMessageUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get assignmentCompleted => 'Завдання виконано';
	@override String get dataUpdated => 'Дані оновлено';
	@override String get profileDeleted => 'Профіль видалено';
	@override String get errorOccurred => 'Сталася помилка';
	@override String get noConnection => 'Немає підключення';
}

// Path: prompt
class _TranslationsPromptUk extends TranslationsPromptEn {
	_TranslationsPromptUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get titleConfirmation => 'Підтвердження';
	@override String get deleteGrade => 'Видалити цю оцінку?';
	@override String get deleteImage => 'Видалити це зображення?';
	@override String get deleteAvatar => 'Видалити цей аватар?';
	@override String get deleteNote => 'Видалити ці нотатки?';
	@override String get deleteSubject => 'Видалити цей предмет?';
	@override String get deleteTeacher => 'Видалити цього вчителя?';
	@override String get deleteTerm => 'Видалити цей період?';
	@override String get deleteLabel => 'Видалити цей ярлик?';
	@override String get deleteAssignment => 'Видалити це завдання?';
	@override String get deleteLesson => 'Видалити цей урок?';
	@override String get deleteProfile => 'Видалити профіль та всі дані?';
	@override String get resetSubjects => 'Встановити предмети за замовчуванням?';
	@override String get resetLabels => 'Встановити ярлики за замовчуванням?';
	@override String get requirePermission => 'Для коректної роботи застосунку потрібен дозвіл. Відкрити налаштування?';
	@override String get signOut => 'Вийти з облікового запису?';
}

// Path: notification
class _TranslationsNotificationUk extends TranslationsNotificationEn {
	_TranslationsNotificationUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsNotificationLessonStartUk lessonStart = _TranslationsNotificationLessonStartUk._(_root);
	@override late final _TranslationsNotificationUpcomingAssignmentsUk upcomingAssignments = _TranslationsNotificationUpcomingAssignmentsUk._(_root);
}

// Path: dateFormat
class _TranslationsDateFormatUk extends TranslationsDateFormatEn {
	_TranslationsDateFormatUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String range({required Object from, required Object to}) => 'з ${from} до ${to}';
	@override String get today => 'Сьогодні';
	@override String get tomorrow => 'Завтра';
}

// Path: themeMode
class _TranslationsThemeModeUk extends TranslationsThemeModeEn {
	_TranslationsThemeModeUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get light => 'Світлий';
	@override String get dark => 'Темний';
	@override String get system => 'Системний';
}

// Path: lessonMode
class _TranslationsLessonModeUk extends TranslationsLessonModeEn {
	_TranslationsLessonModeUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get priority => 'Тільки важливе';
	@override String get alarms => 'Тільки будильники';
	@override String get silent => 'Не турбувати';
}

// Path: assignmentStatus
class _TranslationsAssignmentStatusUk extends TranslationsAssignmentStatusEn {
	_TranslationsAssignmentStatusUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get current => 'Поточні';
	@override String get missed => 'Пропущені';
}

// Path: userAction
class _TranslationsUserActionUk extends TranslationsUserActionEn {
	_TranslationsUserActionUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get move => 'Перемістити';
	@override String get share => 'Поділитися';
	@override String get delete => 'Видалити';
	@override String get addPhoto => 'Фото';
	@override String get addImage => 'Зображення';
	@override String get addLabel => 'Ярлик';
	@override String get addText => 'Текст';
	@override String get addList => 'Список';
}

// Path: repeatSchedule
class _TranslationsRepeatScheduleUk extends TranslationsRepeatScheduleEn {
	_TranslationsRepeatScheduleUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get weekly => 'Щотижня';
	@override String get biweekly => 'Кожні 2 тижні';
	@override String get never => 'Ніколи';
}

// Path: bellSchedule
class _TranslationsBellScheduleUk extends TranslationsBellScheduleEn {
	_TranslationsBellScheduleUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get common => 'Загальне';
	@override String get daily => 'За днями';
}

// Path: gradeScale
class _TranslationsGradeScaleUk extends TranslationsGradeScaleEn {
	_TranslationsGradeScaleUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get numeric5 => '5-бальна';
	@override String get numeric10 => '10-бальна';
	@override String get numeric12 => '12-бальна';
	@override String get numeric20 => '20-бальна';
	@override String get numeric100 => '100-бальна';
}

// Path: reminderTime
class _TranslationsReminderTimeUk extends TranslationsReminderTimeEn {
	_TranslationsReminderTimeUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get minutes5 => '5 хвилин';
	@override String get minutes10 => '10 хвилин';
	@override String get minutes15 => '15 хвилин';
	@override String get minutes20 => '20 хвилин';
}

// Path: academicTerm
class _TranslationsAcademicTermUk extends TranslationsAcademicTermEn {
	_TranslationsAcademicTermUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get quarter => 'Чверть';
	@override String get trimester => 'Триместр';
	@override String get semester => 'Семестр';
}

// Path: termType
class _TranslationsTermTypeUk extends TranslationsTermTypeEn {
	_TranslationsTermTypeUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get year => 'Рік';
	@override String get study => 'Навчання';
	@override String get vacation => 'Канікули';
	@override String get holiday => 'Свято';
}

// Path: color
class _TranslationsColorUk extends TranslationsColorEn {
	_TranslationsColorUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get red => 'Червоний';
	@override String get pink => 'Рожевий';
	@override String get purple => 'Фіолетовий';
	@override String get deepPurple => 'Темно-фіолетовий';
	@override String get indigo => 'Синьо-фіолетовий';
	@override String get blue => 'Синій';
	@override String get lightBlue => 'Світло-синій';
	@override String get cyan => 'Блакитний';
	@override String get teal => 'Бірюзовий';
	@override String get green => 'Зелений';
	@override String get lightGreen => 'Світло-зелений';
	@override String get lime => 'Лаймовий';
	@override String get yellow => 'Жовтий';
	@override String get amber => 'Бурштиновий';
	@override String get orange => 'Помаранчевий';
	@override String get blueGrey => 'Сіро-блакитний';
}

// Path: notification.lessonStart
class _TranslationsNotificationLessonStartUk extends TranslationsNotificationLessonStartEn {
	_TranslationsNotificationLessonStartUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String title({required DateTime time, required Object subject}) => '${DateFormat.jm('uk').format(time)} - ${subject}';
	@override String body({required Object room}) => 'Кабінет ${room}';
}

// Path: notification.upcomingAssignments
class _TranslationsNotificationUpcomingAssignmentsUk extends TranslationsNotificationUpcomingAssignmentsEn {
	_TranslationsNotificationUpcomingAssignmentsUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Найближчі завдання';
}

/// The flat map containing all translations for locale <uk>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsUk {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.title' => 'Щоденник школяра',
			'updateInfo.title' => 'Що нового',
			'updateInfo.text.0' => '• Покращено тексти віджета',
			'updateInfo.text.1' => '• Введення позначки відвідуваності в окремому діалозі',
			'authScreen.title' => 'Щоденник школяра',
			'authScreen.buttonGoogle' => 'Увійти через Google',
			'authScreen.buttonLater' => 'Пізніше',
			'homeScreen.schedule' => 'Щоденник',
			'homeScreen.assignments' => 'Завдання',
			'homeScreen.bells' => 'Дзвінки',
			'homeScreen.grades' => 'Оцінки',
			'homeScreen.profile' => 'Профіль',
			'homeScreen.migrationInProgress' => 'Оновлення даних...',
			'homeScreen.migrationErrorTitle' => 'Помилка',
			'homeScreen.migrationErrorText' => 'Не вдалося оновити дані. Застосунок буде закрито.',
			'assignmentsScreen.title' => 'Завдання',
			'assignmentsScreen.noData' => 'Немає завдань\nДодайте завдання в щоденник',
			'noteDetailScreen.title' => 'Нотатки',
			'noteDetailScreen.textHint' => 'Текст',
			'profileScreen.title' => 'Профіль',
			'profileScreen.subjects' => 'Предмети',
			'profileScreen.teachers' => 'Вчителі',
			'profileScreen.terms' => 'Періоди',
			'profileScreen.labels' => 'Ярлики',
			'profileScreen.settings' => 'Налаштування',
			'profileScreen.about' => 'Про додаток',
			'profileScreen.welcomeText' => ({required Object name}) => 'Привіт, ${name}!',
			'profileScreen.signInButton' => 'Увійти',
			'scheduleScreen.numberHeader' => '#',
			'scheduleScreen.lessonHeader' => 'Урок',
			'scheduleScreen.gradeHeader' => '☆',
			'scheduleScreen.noteHint' => 'Нотатки',
			'bellsScreen.title' => 'Дзвінки',
			'bellsScreen.period' => 'Урок',
			'bellsScreen.start' => 'Початок',
			'bellsScreen.end' => 'Кінець',
			'bellsScreen.kBreak' => 'Перерва',
			'bellsScreen.breakText' => ({required Object minutes}) => '${minutes} хв',
			'gradeBookScreen.title' => 'Журнал',
			'gradeBookScreen.yearTitle' => 'Рік',
			'gradeBookScreen.termTitle' => 'Період',
			'gradeReportScreen.title' => 'Табель',
			'gradeReportScreen.yearTitle' => 'Рік',
			'gradeReportScreen.termTitle' => 'Період',
			'gradeBookView.subject' => 'Предмет',
			'gradeBookView.average' => 'Середня',
			'gradeBookView.noData' => 'Немає оцінок\nДодайте оцінки в щоденник',
			'gradeReportView.subject' => 'Предмет',
			'gradeReportView.terms.0' => 'I',
			'gradeReportView.terms.1' => 'II',
			'gradeReportView.terms.2' => 'III',
			'gradeReportView.terms.3' => 'IV',
			'gradeReportView.year' => '∑',
			'gradeReportView.noData' => 'Немає періодів\nДодайте періоди у профілі',
			'gradeReportView.noGrades' => 'Немає оцінок\nВиберіть інший період',
			'gradesHistoryScreen.date' => 'Дата',
			'gradesHistoryScreen.grade' => 'Оцінка',
			'gradesHistoryScreen.comment' => 'Коментар',
			'gradesHistoryScreen.noData' => 'Немає оцінок',
			'helpScreen.title' => 'Про додаток',
			'helpScreen.versionText' => ({required Object version, required Object build}) => 'Версія ${version} (${build})',
			'helpScreen.shareApp' => 'Поділитися додатком',
			'helpScreen.rateApp' => 'Оцінити додаток',
			'helpScreen.contactDev' => 'Написати розробнику',
			'helpScreen.deleteProfile' => 'Видалити профіль',
			'assignmentDetailScreen.title' => 'Завдання',
			'assignmentDetailScreen.moveTitle' => 'Перенести завдання',
			'lessonDetailScreen.title' => ({required Object slot}) => 'Урок ${slot}',
			'lessonDetailScreen.subjectHint' => 'Предмет',
			'lessonDetailScreen.topicHint' => 'Тема',
			'lessonDetailScreen.roomHint' => 'Кабінет',
			'lessonDetailScreen.roomPrefix' => 'Кабінет',
			'settingsScreen.title' => 'Налаштування',
			'settingsScreen.general' => 'Загальні',
			'settingsScreen.advanced' => 'Додаткові',
			'settingsScreen.reminders' => 'Нагадування',
			'settingsScreen.schedule' => 'Розклад',
			'settingsScreen.grades' => 'Оцінки',
			'settingsScreen.importantButton' => 'Важливо',
			'settingsScreen.importantTitle' => 'Важливо',
			'settingsScreen.importantText' => 'Для коректної роботи застосунку на пристроях Xiaomi, Huawei, Vivo та Oppo налаштуйте системні параметри для застосунку:\n• Автозапуск – увімкнено\n• Фонова робота – увімкнено\n• Економія батареї – вимкнено',
			'generalSettingsScreen.title' => 'Загальні',
			'generalSettingsScreen.appLanguage' => 'Мова додатка',
			'generalSettingsScreen.themeMode' => 'Режим теми',
			'generalSettingsScreen.baseColor' => 'Базовий колір',
			'generalSettingsScreen.backgroundImage' => 'Фонове зображення',
			'generalSettingsScreen.backgroundImageNone' => 'Немає',
			'generalSettingsScreen.appFont' => 'Шрифт додатка',
			'advancedSettingsScreen.title' => 'Додаткові',
			'advancedSettingsScreen.lessonMode' => 'Режим уроку',
			'advancedSettingsScreen.lessonModeDisabled' => 'Вимкнено',
			'remindersSettingsScreen.title' => 'Нагадування',
			'remindersSettingsScreen.lessonStart' => 'Початок уроку',
			'remindersSettingsScreen.lessonStartText' => ({required Object time}) => 'За ${time} до дзвінка',
			'remindersSettingsScreen.lessonStartDisabled' => 'Вимкнено',
			'remindersSettingsScreen.upcomingAssignments' => 'Найближчі завдання',
			'remindersSettingsScreen.upcomingAssignmentsText' => ({required Object time}) => 'Щодня о ${time}',
			'remindersSettingsScreen.upcomingAssignmentsDisabled' => 'Вимкнено',
			'scheduleSettingsScreen.title' => 'Розклад',
			'scheduleSettingsScreen.academicTerm' => 'Навчальний період',
			'scheduleSettingsScreen.classDays' => 'Навчальні дні',
			'scheduleSettingsScreen.periodCount' => 'Кількість уроків',
			'scheduleSettingsScreen.periodCountText' => ({required Object count}) => '${count} уроків на день',
			'scheduleSettingsScreen.repeatSchedule' => 'Повторення розкладу',
			'scheduleSettingsScreen.bellSchedule' => 'Розклад дзвінків',
			'gradesSettingsScreen.title' => 'Оцінки',
			'gradesSettingsScreen.gradeScale' => 'Шкала оцінювання',
			'gradesSettingsScreen.signValues' => 'Значення знаків',
			'gradesSettingsScreen.signValuesText' => ({required Object plus, required Object minus}) => 'Плюс: ${plus}, Мінус: ${minus}',
			'gradesSettingsScreen.signValuesPlus' => 'Плюс',
			'gradesSettingsScreen.signValuesMinus' => 'Мінус',
			'gradesSettingsScreen.roundingRules' => 'Правила округлення',
			'gradesSettingsScreen.roundingRulesText' => ({required Object threshold, required Object precision}) => 'Поріг: ${threshold}, Точність: ${precision}',
			'gradesSettingsScreen.roundingRulesThreshold' => 'Поріг',
			'gradesSettingsScreen.roundingRulesPrecision' => 'Точність',
			'gradesSettingsScreen.gradeColors' => 'Кольори оцінок',
			'gradesSettingsScreen.gradeColorsTitle' => 'Колір',
			'gradesSettingsScreen.gradeColorsOther' => 'Інші',
			'gradesSettingsScreen.attendanceMarks' => 'Причини відвідування',
			'gradesSettingsScreen.attendanceMark' => 'Нова відмітка',
			'gradesSettingsScreen.attendanceName' => 'Назва',
			'subjectDetailScreen.title' => 'Предмет',
			'subjectDetailScreen.nameHint' => 'Назва',
			'subjectDetailScreen.roomHint' => 'Кабінет',
			'subjectsScreen.title' => 'Предмети',
			'subjectsScreen.noData' => 'Немає предметів',
			'teacherDetailScreen.title' => 'Вчитель',
			'teacherDetailScreen.nameHint' => 'Ім\'я',
			'teacherDetailScreen.subjectHint' => 'Предмет',
			'teacherDetailScreen.noteHint' => 'Примітка',
			'teachersScreen.title' => 'Вчителі',
			'teachersScreen.noData' => 'Немає вчителів',
			'termDetailScreen.title' => 'Період',
			'termDetailScreen.typeHint' => 'Тип',
			'termDetailScreen.typeTitle' => 'Тип',
			'termDetailScreen.yearHint' => 'Рік',
			'termDetailScreen.yearTitle' => 'Рік',
			'termDetailScreen.nameHint' => 'Назва',
			'termDetailScreen.startHint' => 'Початок',
			'termDetailScreen.endHint' => 'Кінець',
			'termsScreen.title' => 'Періоди',
			'termsScreen.noData' => 'Немає періодів',
			'labelDetailScreen.title' => 'Ярлик',
			'labelDetailScreen.nameHint' => 'Назва',
			'labelDetailScreen.colorHint' => 'Колір',
			'labelDetailScreen.dialogTitle' => 'Колір',
			'labelsScreen.title' => 'Ярлики',
			'labelsScreen.noData' => 'Немає ярликів',
			'gradeInputDialog.gradeTitle' => 'Оцінка',
			'gradeInputDialog.attendanceTitle' => 'Відвідування',
			'gradeInputDialog.valueHint' => 'Значення',
			'gradeInputDialog.weightHint' => 'Вага',
			'gradeInputDialog.commentHint' => 'Коментар',
			'gradeInputDialog.markHint' => 'Відмітка',
			'gradeInputDialog.gradeButton' => 'ОЦІНКА',
			'gradeInputDialog.attdendanceButton' => 'ВІДВІДУВАННЯ',
			'signInDialog.appleButton' => 'Вхід з Apple',
			'signInDialog.googleButton' => 'Вхід з Google',
			'assignmentField.hintText' => 'Завдання',
			'assignmentField.addText' => 'Новий пункт',
			'assignmentField.labelTitle' => 'Ярлик',
			'assignmentField.actionTitle' => 'Додати',
			'assignmentField.imageTitle' => 'Завдання',
			'assignmentField.imageError' => 'Файл не знайдено',
			'notificationChannel.reminders' => 'Нагадування',
			'button.ok' => 'ОК',
			'button.cancel' => 'ВІДМІНА',
			'button.save' => 'ЗБЕРІГТИ',
			'button.delete' => 'ВИДАЛИТИ',
			'button.clear' => 'ОЧИСТИТИ',
			'message.assignmentCompleted' => 'Завдання виконано',
			'message.dataUpdated' => 'Дані оновлено',
			'message.profileDeleted' => 'Профіль видалено',
			'message.errorOccurred' => 'Сталася помилка',
			'message.noConnection' => 'Немає підключення',
			'prompt.titleConfirmation' => 'Підтвердження',
			'prompt.deleteGrade' => 'Видалити цю оцінку?',
			'prompt.deleteImage' => 'Видалити це зображення?',
			'prompt.deleteAvatar' => 'Видалити цей аватар?',
			'prompt.deleteNote' => 'Видалити ці нотатки?',
			'prompt.deleteSubject' => 'Видалити цей предмет?',
			'prompt.deleteTeacher' => 'Видалити цього вчителя?',
			'prompt.deleteTerm' => 'Видалити цей період?',
			'prompt.deleteLabel' => 'Видалити цей ярлик?',
			'prompt.deleteAssignment' => 'Видалити це завдання?',
			'prompt.deleteLesson' => 'Видалити цей урок?',
			'prompt.deleteProfile' => 'Видалити профіль та всі дані?',
			'prompt.resetSubjects' => 'Встановити предмети за замовчуванням?',
			'prompt.resetLabels' => 'Встановити ярлики за замовчуванням?',
			'prompt.requirePermission' => 'Для коректної роботи застосунку потрібен дозвіл. Відкрити налаштування?',
			'prompt.signOut' => 'Вийти з облікового запису?',
			'notification.lessonStart.title' => ({required DateTime time, required Object subject}) => '${DateFormat.jm('uk').format(time)} - ${subject}',
			'notification.lessonStart.body' => ({required Object room}) => 'Кабінет ${room}',
			'notification.upcomingAssignments.title' => 'Найближчі завдання',
			'dateFormat.range' => ({required Object from, required Object to}) => 'з ${from} до ${to}',
			'dateFormat.today' => 'Сьогодні',
			'dateFormat.tomorrow' => 'Завтра',
			'themeMode.light' => 'Світлий',
			'themeMode.dark' => 'Темний',
			'themeMode.system' => 'Системний',
			'lessonMode.priority' => 'Тільки важливе',
			'lessonMode.alarms' => 'Тільки будильники',
			'lessonMode.silent' => 'Не турбувати',
			'assignmentStatus.current' => 'Поточні',
			'assignmentStatus.missed' => 'Пропущені',
			'userAction.move' => 'Перемістити',
			'userAction.share' => 'Поділитися',
			'userAction.delete' => 'Видалити',
			'userAction.addPhoto' => 'Фото',
			'userAction.addImage' => 'Зображення',
			'userAction.addLabel' => 'Ярлик',
			'userAction.addText' => 'Текст',
			'userAction.addList' => 'Список',
			'repeatSchedule.weekly' => 'Щотижня',
			'repeatSchedule.biweekly' => 'Кожні 2 тижні',
			'repeatSchedule.never' => 'Ніколи',
			'bellSchedule.common' => 'Загальне',
			'bellSchedule.daily' => 'За днями',
			'gradeScale.numeric5' => '5-бальна',
			'gradeScale.numeric10' => '10-бальна',
			'gradeScale.numeric12' => '12-бальна',
			'gradeScale.numeric20' => '20-бальна',
			'gradeScale.numeric100' => '100-бальна',
			'reminderTime.minutes5' => '5 хвилин',
			'reminderTime.minutes10' => '10 хвилин',
			'reminderTime.minutes15' => '15 хвилин',
			'reminderTime.minutes20' => '20 хвилин',
			'academicTerm.quarter' => 'Чверть',
			'academicTerm.trimester' => 'Триместр',
			'academicTerm.semester' => 'Семестр',
			'termType.year' => 'Рік',
			'termType.study' => 'Навчання',
			'termType.vacation' => 'Канікули',
			'termType.holiday' => 'Свято',
			'color.red' => 'Червоний',
			'color.pink' => 'Рожевий',
			'color.purple' => 'Фіолетовий',
			'color.deepPurple' => 'Темно-фіолетовий',
			'color.indigo' => 'Синьо-фіолетовий',
			'color.blue' => 'Синій',
			'color.lightBlue' => 'Світло-синій',
			'color.cyan' => 'Блакитний',
			'color.teal' => 'Бірюзовий',
			'color.green' => 'Зелений',
			'color.lightGreen' => 'Світло-зелений',
			'color.lime' => 'Лаймовий',
			'color.yellow' => 'Жовтий',
			'color.amber' => 'Бурштиновий',
			'color.orange' => 'Помаранчевий',
			'color.blueGrey' => 'Сіро-блакитний',
			_ => null,
		};
	}
}
