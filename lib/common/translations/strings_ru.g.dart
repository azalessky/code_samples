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
class TranslationsRu extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsRu({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsRu _root = this; // ignore: unused_field

	@override 
	TranslationsRu $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsRu(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAppRu app = _TranslationsAppRu._(_root);
	@override late final _TranslationsUpdateInfoRu updateInfo = _TranslationsUpdateInfoRu._(_root);
	@override late final _TranslationsAuthScreenRu authScreen = _TranslationsAuthScreenRu._(_root);
	@override late final _TranslationsHomeScreenRu homeScreen = _TranslationsHomeScreenRu._(_root);
	@override late final _TranslationsAssignmentsScreenRu assignmentsScreen = _TranslationsAssignmentsScreenRu._(_root);
	@override late final _TranslationsNoteDetailScreenRu noteDetailScreen = _TranslationsNoteDetailScreenRu._(_root);
	@override late final _TranslationsProfileScreenRu profileScreen = _TranslationsProfileScreenRu._(_root);
	@override late final _TranslationsScheduleScreenRu scheduleScreen = _TranslationsScheduleScreenRu._(_root);
	@override late final _TranslationsBellsScreenRu bellsScreen = _TranslationsBellsScreenRu._(_root);
	@override late final _TranslationsGradeBookScreenRu gradeBookScreen = _TranslationsGradeBookScreenRu._(_root);
	@override late final _TranslationsGradeReportScreenRu gradeReportScreen = _TranslationsGradeReportScreenRu._(_root);
	@override late final _TranslationsGradeBookViewRu gradeBookView = _TranslationsGradeBookViewRu._(_root);
	@override late final _TranslationsGradeReportViewRu gradeReportView = _TranslationsGradeReportViewRu._(_root);
	@override late final _TranslationsGradesHistoryScreenRu gradesHistoryScreen = _TranslationsGradesHistoryScreenRu._(_root);
	@override late final _TranslationsHelpScreenRu helpScreen = _TranslationsHelpScreenRu._(_root);
	@override late final _TranslationsAssignmentDetailScreenRu assignmentDetailScreen = _TranslationsAssignmentDetailScreenRu._(_root);
	@override late final _TranslationsLessonDetailScreenRu lessonDetailScreen = _TranslationsLessonDetailScreenRu._(_root);
	@override late final _TranslationsSettingsScreenRu settingsScreen = _TranslationsSettingsScreenRu._(_root);
	@override late final _TranslationsGeneralSettingsScreenRu generalSettingsScreen = _TranslationsGeneralSettingsScreenRu._(_root);
	@override late final _TranslationsAdvancedSettingsScreenRu advancedSettingsScreen = _TranslationsAdvancedSettingsScreenRu._(_root);
	@override late final _TranslationsRemindersSettingsScreenRu remindersSettingsScreen = _TranslationsRemindersSettingsScreenRu._(_root);
	@override late final _TranslationsScheduleSettingsScreenRu scheduleSettingsScreen = _TranslationsScheduleSettingsScreenRu._(_root);
	@override late final _TranslationsGradesSettingsScreenRu gradesSettingsScreen = _TranslationsGradesSettingsScreenRu._(_root);
	@override late final _TranslationsSubjectDetailScreenRu subjectDetailScreen = _TranslationsSubjectDetailScreenRu._(_root);
	@override late final _TranslationsSubjectsScreenRu subjectsScreen = _TranslationsSubjectsScreenRu._(_root);
	@override late final _TranslationsTeacherDetailScreenRu teacherDetailScreen = _TranslationsTeacherDetailScreenRu._(_root);
	@override late final _TranslationsTeachersScreenRu teachersScreen = _TranslationsTeachersScreenRu._(_root);
	@override late final _TranslationsTermDetailScreenRu termDetailScreen = _TranslationsTermDetailScreenRu._(_root);
	@override late final _TranslationsTermsScreenRu termsScreen = _TranslationsTermsScreenRu._(_root);
	@override late final _TranslationsLabelDetailScreenRu labelDetailScreen = _TranslationsLabelDetailScreenRu._(_root);
	@override late final _TranslationsLabelsScreenRu labelsScreen = _TranslationsLabelsScreenRu._(_root);
	@override late final _TranslationsGradeInputDialogRu gradeInputDialog = _TranslationsGradeInputDialogRu._(_root);
	@override late final _TranslationsSignInDialogRu signInDialog = _TranslationsSignInDialogRu._(_root);
	@override late final _TranslationsAssignmentFieldRu assignmentField = _TranslationsAssignmentFieldRu._(_root);
	@override late final _TranslationsNotificationChannelRu notificationChannel = _TranslationsNotificationChannelRu._(_root);
	@override late final _TranslationsButtonRu button = _TranslationsButtonRu._(_root);
	@override late final _TranslationsMessageRu message = _TranslationsMessageRu._(_root);
	@override late final _TranslationsPromptRu prompt = _TranslationsPromptRu._(_root);
	@override late final _TranslationsNotificationRu notification = _TranslationsNotificationRu._(_root);
	@override late final _TranslationsDateFormatRu dateFormat = _TranslationsDateFormatRu._(_root);
	@override late final _TranslationsThemeModeRu themeMode = _TranslationsThemeModeRu._(_root);
	@override late final _TranslationsLessonModeRu lessonMode = _TranslationsLessonModeRu._(_root);
	@override late final _TranslationsAssignmentStatusRu assignmentStatus = _TranslationsAssignmentStatusRu._(_root);
	@override late final _TranslationsUserActionRu userAction = _TranslationsUserActionRu._(_root);
	@override late final _TranslationsRepeatScheduleRu repeatSchedule = _TranslationsRepeatScheduleRu._(_root);
	@override late final _TranslationsBellScheduleRu bellSchedule = _TranslationsBellScheduleRu._(_root);
	@override late final _TranslationsGradeScaleRu gradeScale = _TranslationsGradeScaleRu._(_root);
	@override late final _TranslationsReminderTimeRu reminderTime = _TranslationsReminderTimeRu._(_root);
	@override late final _TranslationsAcademicTermRu academicTerm = _TranslationsAcademicTermRu._(_root);
	@override late final _TranslationsTermTypeRu termType = _TranslationsTermTypeRu._(_root);
	@override late final _TranslationsColorRu color = _TranslationsColorRu._(_root);
}

// Path: app
class _TranslationsAppRu extends TranslationsAppEn {
	_TranslationsAppRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Дневник школьника';
}

// Path: updateInfo
class _TranslationsUpdateInfoRu extends TranslationsUpdateInfoEn {
	_TranslationsUpdateInfoRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Что нового';
	@override List<String> get text => [
		'• Улучшены тексты виджета',
		'• Ввод отметки посещения в отдельном диалоге',
	];
}

// Path: authScreen
class _TranslationsAuthScreenRu extends TranslationsAuthScreenEn {
	_TranslationsAuthScreenRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Дневник школьника';
	@override String get buttonGoogle => 'Войти через Google';
	@override String get buttonLater => 'Позже';
}

// Path: homeScreen
class _TranslationsHomeScreenRu extends TranslationsHomeScreenEn {
	_TranslationsHomeScreenRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get schedule => 'Дневник';
	@override String get assignments => 'Задания';
	@override String get bells => 'Звонки';
	@override String get grades => 'Оценки';
	@override String get profile => 'Профиль';
	@override String get migrationInProgress => 'Обновление данных...';
	@override String get migrationErrorTitle => 'Ошибка';
	@override String get migrationErrorText => 'Не удалось обновить данные. Приложение будет закрыто.';
}

// Path: assignmentsScreen
class _TranslationsAssignmentsScreenRu extends TranslationsAssignmentsScreenEn {
	_TranslationsAssignmentsScreenRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Задания';
	@override String get noData => 'Нет заданий\nДобавьте задания в дневник';
}

// Path: noteDetailScreen
class _TranslationsNoteDetailScreenRu extends TranslationsNoteDetailScreenEn {
	_TranslationsNoteDetailScreenRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Заметки';
	@override String get textHint => 'Текст';
}

// Path: profileScreen
class _TranslationsProfileScreenRu extends TranslationsProfileScreenEn {
	_TranslationsProfileScreenRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Профиль';
	@override String get subjects => 'Предметы';
	@override String get teachers => 'Учителя';
	@override String get terms => 'Периоды';
	@override String get labels => 'Ярлыки';
	@override String get settings => 'Настройки';
	@override String get about => 'О приложении';
	@override String welcomeText({required Object name}) => 'Привет, ${name}!';
	@override String get signInButton => 'Войти';
}

// Path: scheduleScreen
class _TranslationsScheduleScreenRu extends TranslationsScheduleScreenEn {
	_TranslationsScheduleScreenRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get numberHeader => '#';
	@override String get lessonHeader => 'Урок';
	@override String get gradeHeader => '☆';
	@override String get noteHint => 'Заметки';
}

// Path: bellsScreen
class _TranslationsBellsScreenRu extends TranslationsBellsScreenEn {
	_TranslationsBellsScreenRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Звонки';
	@override String get period => 'Урок';
	@override String get start => 'Начало';
	@override String get end => 'Конец';
	@override String get kBreak => 'Перерыв';
	@override String breakText({required Object minutes}) => '${minutes} мин';
}

// Path: gradeBookScreen
class _TranslationsGradeBookScreenRu extends TranslationsGradeBookScreenEn {
	_TranslationsGradeBookScreenRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Журнал';
	@override String get yearTitle => 'Год';
	@override String get termTitle => 'Период';
}

// Path: gradeReportScreen
class _TranslationsGradeReportScreenRu extends TranslationsGradeReportScreenEn {
	_TranslationsGradeReportScreenRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Табель';
	@override String get yearTitle => 'Год';
	@override String get termTitle => 'Период';
}

// Path: gradeBookView
class _TranslationsGradeBookViewRu extends TranslationsGradeBookViewEn {
	_TranslationsGradeBookViewRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get subject => 'Предмет';
	@override String get average => 'Средняя';
	@override String get noData => 'Нет оценок\nДобавьте оценки в дневник';
}

// Path: gradeReportView
class _TranslationsGradeReportViewRu extends TranslationsGradeReportViewEn {
	_TranslationsGradeReportViewRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get subject => 'Предмет';
	@override List<String> get terms => [
		'I',
		'II',
		'III',
		'IV',
	];
	@override String get year => '∑';
	@override String get noData => 'Нет периодов\nДобавьте периоды в профиль';
	@override String get noGrades => 'Нет оценок\nВыберите другой период';
}

// Path: gradesHistoryScreen
class _TranslationsGradesHistoryScreenRu extends TranslationsGradesHistoryScreenEn {
	_TranslationsGradesHistoryScreenRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get date => 'Дата';
	@override String get grade => 'Оценка';
	@override String get comment => 'Комментарий';
	@override String get noData => 'Нет оценок';
}

// Path: helpScreen
class _TranslationsHelpScreenRu extends TranslationsHelpScreenEn {
	_TranslationsHelpScreenRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'О приложении';
	@override String versionText({required Object version, required Object build}) => 'Версия ${version} (${build})';
	@override String get shareApp => 'Поделиться приложением';
	@override String get rateApp => 'Оценить приложение';
	@override String get contactDev => 'Написать разработчику';
	@override String get deleteProfile => 'Удалить профиль';
}

// Path: assignmentDetailScreen
class _TranslationsAssignmentDetailScreenRu extends TranslationsAssignmentDetailScreenEn {
	_TranslationsAssignmentDetailScreenRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Задание';
	@override String get moveTitle => 'Перенести задание';
}

// Path: lessonDetailScreen
class _TranslationsLessonDetailScreenRu extends TranslationsLessonDetailScreenEn {
	_TranslationsLessonDetailScreenRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String title({required Object slot}) => 'Урок ${slot}';
	@override String get subjectHint => 'Предмет';
	@override String get topicHint => 'Тема';
	@override String get roomHint => 'Кабинет';
	@override String get roomPrefix => 'Кабинет';
}

// Path: settingsScreen
class _TranslationsSettingsScreenRu extends TranslationsSettingsScreenEn {
	_TranslationsSettingsScreenRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Настройки';
	@override String get general => 'Общие';
	@override String get advanced => 'Дополнительные';
	@override String get reminders => 'Напоминания';
	@override String get schedule => 'Расписание';
	@override String get grades => 'Оценки';
	@override String get importantButton => 'Важно';
	@override String get importantTitle => 'Важно';
	@override String get importantText => 'Для корректной работы приложения на устройствах Xiaomi, Huawei, Vivo и Oppo настройте системные параметры для приложения:\n• Автозапуск – включено\n• Фоновая работа – включено\n• Экономия батареи – отключено';
}

// Path: generalSettingsScreen
class _TranslationsGeneralSettingsScreenRu extends TranslationsGeneralSettingsScreenEn {
	_TranslationsGeneralSettingsScreenRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Общие';
	@override String get appLanguage => 'Язык приложения';
	@override String get themeMode => 'Режим темы';
	@override String get baseColor => 'Базовый цвет';
	@override String get backgroundImage => 'Изображение фона';
	@override String get backgroundImageNone => 'Нет';
	@override String get appFont => 'Шрифт приложения';
}

// Path: advancedSettingsScreen
class _TranslationsAdvancedSettingsScreenRu extends TranslationsAdvancedSettingsScreenEn {
	_TranslationsAdvancedSettingsScreenRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Дополнительные';
	@override String get lessonMode => 'Режим урока';
	@override String get lessonModeDisabled => 'Отключено';
}

// Path: remindersSettingsScreen
class _TranslationsRemindersSettingsScreenRu extends TranslationsRemindersSettingsScreenEn {
	_TranslationsRemindersSettingsScreenRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Напоминания';
	@override String get lessonStart => 'Начало урока';
	@override String lessonStartText({required Object time}) => 'За ${time} до звонка';
	@override String get lessonStartDisabled => 'Отключено';
	@override String get upcomingAssignments => 'Ближайшие задания';
	@override String upcomingAssignmentsText({required Object time}) => 'Ежедневно в ${time}';
	@override String get upcomingAssignmentsDisabled => 'Отключено';
}

// Path: scheduleSettingsScreen
class _TranslationsScheduleSettingsScreenRu extends TranslationsScheduleSettingsScreenEn {
	_TranslationsScheduleSettingsScreenRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Расписание';
	@override String get academicTerm => 'Учебный период';
	@override String get classDays => 'Учебные дни';
	@override String get periodCount => 'Количество уроков';
	@override String periodCountText({required Object count}) => '${count} уроков в день';
	@override String get repeatSchedule => 'Повтор расписания';
	@override String get bellSchedule => 'Расписание звонков';
}

// Path: gradesSettingsScreen
class _TranslationsGradesSettingsScreenRu extends TranslationsGradesSettingsScreenEn {
	_TranslationsGradesSettingsScreenRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Оценки';
	@override String get gradeScale => 'Шкала оценок';
	@override String get signValues => 'Значения знаков';
	@override String signValuesText({required Object plus, required Object minus}) => 'Плюс: ${plus}, Минус: ${minus}';
	@override String get signValuesPlus => 'Плюс';
	@override String get signValuesMinus => 'Минус';
	@override String get roundingRules => 'Правила округления';
	@override String roundingRulesText({required Object threshold, required Object precision}) => 'Порог: ${threshold}, Точность: ${precision}';
	@override String get roundingRulesThreshold => 'Порог';
	@override String get roundingRulesPrecision => 'Точность';
	@override String get gradeColors => 'Цвета оценок';
	@override String get gradeColorsTitle => 'Цвет';
	@override String get gradeColorsOther => 'Другие';
	@override String get attendanceMarks => 'Отметки посещений';
	@override String get attendanceMark => 'Новая отметка';
	@override String get attendanceName => 'Название';
}

// Path: subjectDetailScreen
class _TranslationsSubjectDetailScreenRu extends TranslationsSubjectDetailScreenEn {
	_TranslationsSubjectDetailScreenRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Предмет';
	@override String get nameHint => 'Название';
	@override String get roomHint => 'Кабинет';
}

// Path: subjectsScreen
class _TranslationsSubjectsScreenRu extends TranslationsSubjectsScreenEn {
	_TranslationsSubjectsScreenRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Предметы';
	@override String get noData => 'Нет предметов';
}

// Path: teacherDetailScreen
class _TranslationsTeacherDetailScreenRu extends TranslationsTeacherDetailScreenEn {
	_TranslationsTeacherDetailScreenRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Учитель';
	@override String get nameHint => 'Имя';
	@override String get subjectHint => 'Предмет';
	@override String get noteHint => 'Примечание';
}

// Path: teachersScreen
class _TranslationsTeachersScreenRu extends TranslationsTeachersScreenEn {
	_TranslationsTeachersScreenRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Учителя';
	@override String get noData => 'Нет учителей';
}

// Path: termDetailScreen
class _TranslationsTermDetailScreenRu extends TranslationsTermDetailScreenEn {
	_TranslationsTermDetailScreenRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Период';
	@override String get typeHint => 'Тип';
	@override String get typeTitle => 'Тип';
	@override String get yearHint => 'Год';
	@override String get yearTitle => 'Год';
	@override String get nameHint => 'Название';
	@override String get startHint => 'Начало';
	@override String get endHint => 'Конец';
}

// Path: termsScreen
class _TranslationsTermsScreenRu extends TranslationsTermsScreenEn {
	_TranslationsTermsScreenRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Периоды';
	@override String get noData => 'Нет периодов';
}

// Path: labelDetailScreen
class _TranslationsLabelDetailScreenRu extends TranslationsLabelDetailScreenEn {
	_TranslationsLabelDetailScreenRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ярлык';
	@override String get nameHint => 'Название';
	@override String get colorHint => 'Цвет';
	@override String get dialogTitle => 'Цвет';
}

// Path: labelsScreen
class _TranslationsLabelsScreenRu extends TranslationsLabelsScreenEn {
	_TranslationsLabelsScreenRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ярлыки';
	@override String get noData => 'Нет ярлыков';
}

// Path: gradeInputDialog
class _TranslationsGradeInputDialogRu extends TranslationsGradeInputDialogEn {
	_TranslationsGradeInputDialogRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get gradeTitle => 'Оценка';
	@override String get attendanceTitle => 'Посещение';
	@override String get valueHint => 'Значение';
	@override String get weightHint => 'Вес';
	@override String get commentHint => 'Комментарий';
	@override String get markHint => 'Отметка';
	@override String get gradeButton => 'ОЦЕНКА';
	@override String get attdendanceButton => 'ПОСЕЩЕНИЕ';
}

// Path: signInDialog
class _TranslationsSignInDialogRu extends TranslationsSignInDialogEn {
	_TranslationsSignInDialogRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get appleButton => 'Вход с Apple';
	@override String get googleButton => 'Вход с Google';
}

// Path: assignmentField
class _TranslationsAssignmentFieldRu extends TranslationsAssignmentFieldEn {
	_TranslationsAssignmentFieldRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get hintText => 'Задание';
	@override String get addText => 'Новый пункт';
	@override String get labelTitle => 'Ярлык';
	@override String get actionTitle => 'Добавить';
	@override String get imageTitle => 'Задание';
	@override String get imageError => 'Файл не найден';
}

// Path: notificationChannel
class _TranslationsNotificationChannelRu extends TranslationsNotificationChannelEn {
	_TranslationsNotificationChannelRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get reminders => 'Напоминания';
}

// Path: button
class _TranslationsButtonRu extends TranslationsButtonEn {
	_TranslationsButtonRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get ok => 'ОК';
	@override String get cancel => 'ОТМЕНА';
	@override String get save => 'СОХРАНИТЬ';
	@override String get delete => 'УДАЛИТЬ';
	@override String get clear => 'ОЧИСТИТЬ';
}

// Path: message
class _TranslationsMessageRu extends TranslationsMessageEn {
	_TranslationsMessageRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get assignmentCompleted => 'Задание выполнено';
	@override String get dataUpdated => 'Данные обновлены';
	@override String get profileDeleted => 'Профиль удален';
	@override String get errorOccurred => 'Произошла ошибка';
	@override String get noConnection => 'Нет подключения';
}

// Path: prompt
class _TranslationsPromptRu extends TranslationsPromptEn {
	_TranslationsPromptRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get titleConfirmation => 'Подтверждение';
	@override String get deleteGrade => 'Удалить эту оценку?';
	@override String get deleteImage => 'Удалить это изображение?';
	@override String get deleteAvatar => 'Удалить этот аватар?';
	@override String get deleteNote => 'Удалить эти заметки?';
	@override String get deleteSubject => 'Удалить этот предмет?';
	@override String get deleteTeacher => 'Удалить этого учителя?';
	@override String get deleteTerm => 'Удалить этот период?';
	@override String get deleteLabel => 'Удалить этот ярлык?';
	@override String get deleteAssignment => 'Удалить это задание?';
	@override String get deleteLesson => 'Удалить этот урок?';
	@override String get deleteProfile => 'Удалить профиль и все данные?';
	@override String get resetSubjects => 'Установить предметы по умолчанию?';
	@override String get resetLabels => 'Установить ярлыки по умолчанию?';
	@override String get requirePermission => 'Для корректной работы приложения требуется разрешение. Открыть настройки?';
	@override String get signOut => 'Выйти из учётной записи?';
}

// Path: notification
class _TranslationsNotificationRu extends TranslationsNotificationEn {
	_TranslationsNotificationRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsNotificationLessonStartRu lessonStart = _TranslationsNotificationLessonStartRu._(_root);
	@override late final _TranslationsNotificationUpcomingAssignmentsRu upcomingAssignments = _TranslationsNotificationUpcomingAssignmentsRu._(_root);
}

// Path: dateFormat
class _TranslationsDateFormatRu extends TranslationsDateFormatEn {
	_TranslationsDateFormatRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String range({required Object from, required Object to}) => 'с ${from} по ${to}';
	@override String get today => 'Сегодня';
	@override String get tomorrow => 'Завтра';
}

// Path: themeMode
class _TranslationsThemeModeRu extends TranslationsThemeModeEn {
	_TranslationsThemeModeRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get light => 'Светлый';
	@override String get dark => 'Темный';
	@override String get system => 'Системный';
}

// Path: lessonMode
class _TranslationsLessonModeRu extends TranslationsLessonModeEn {
	_TranslationsLessonModeRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get priority => 'Только важное';
	@override String get alarms => 'Только будильники';
	@override String get silent => 'Не беспокоить';
}

// Path: assignmentStatus
class _TranslationsAssignmentStatusRu extends TranslationsAssignmentStatusEn {
	_TranslationsAssignmentStatusRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get current => 'Текущие';
	@override String get missed => 'Пропущенные';
}

// Path: userAction
class _TranslationsUserActionRu extends TranslationsUserActionEn {
	_TranslationsUserActionRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get move => 'Перенести';
	@override String get share => 'Поделиться';
	@override String get delete => 'Удалить';
	@override String get addPhoto => 'Фото';
	@override String get addImage => 'Изображение';
	@override String get addLabel => 'Ярлык';
	@override String get addText => 'Текст';
	@override String get addList => 'Список';
}

// Path: repeatSchedule
class _TranslationsRepeatScheduleRu extends TranslationsRepeatScheduleEn {
	_TranslationsRepeatScheduleRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get weekly => 'Каждую неделю';
	@override String get biweekly => 'Каждые 2 недели';
	@override String get never => 'Никогда';
}

// Path: bellSchedule
class _TranslationsBellScheduleRu extends TranslationsBellScheduleEn {
	_TranslationsBellScheduleRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get common => 'Общее';
	@override String get daily => 'По дням';
}

// Path: gradeScale
class _TranslationsGradeScaleRu extends TranslationsGradeScaleEn {
	_TranslationsGradeScaleRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get numeric5 => '5-бальная';
	@override String get numeric10 => '10-бальная';
	@override String get numeric12 => '12-бальная';
	@override String get numeric20 => '20-бальная';
	@override String get numeric100 => '100-бальная';
}

// Path: reminderTime
class _TranslationsReminderTimeRu extends TranslationsReminderTimeEn {
	_TranslationsReminderTimeRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get minutes5 => '5 минут';
	@override String get minutes10 => '10 минут';
	@override String get minutes15 => '15 минут';
	@override String get minutes20 => '20 минут';
}

// Path: academicTerm
class _TranslationsAcademicTermRu extends TranslationsAcademicTermEn {
	_TranslationsAcademicTermRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get quarter => 'Четверть';
	@override String get trimester => 'Триместер';
	@override String get semester => 'Семестр';
}

// Path: termType
class _TranslationsTermTypeRu extends TranslationsTermTypeEn {
	_TranslationsTermTypeRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get year => 'Год';
	@override String get study => 'Учёба';
	@override String get vacation => 'Каникулы';
	@override String get holiday => 'Праздник';
}

// Path: color
class _TranslationsColorRu extends TranslationsColorEn {
	_TranslationsColorRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get red => 'Красный';
	@override String get pink => 'Розовый';
	@override String get purple => 'Фиолетовый';
	@override String get deepPurple => 'Темно-фиолетовый';
	@override String get indigo => 'Сине-фиолетовый';
	@override String get blue => 'Синий';
	@override String get lightBlue => 'Светло-синий';
	@override String get cyan => 'Голубой';
	@override String get teal => 'Бирюзовый';
	@override String get green => 'Зелёный';
	@override String get lightGreen => 'Светло-зелёный';
	@override String get lime => 'Лаймовый';
	@override String get yellow => 'Жёлтый';
	@override String get amber => 'Янтарный';
	@override String get orange => 'Оранжевый';
	@override String get blueGrey => 'Серо-голубой';
}

// Path: notification.lessonStart
class _TranslationsNotificationLessonStartRu extends TranslationsNotificationLessonStartEn {
	_TranslationsNotificationLessonStartRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String title({required DateTime time, required Object subject}) => '${DateFormat.jm('ru').format(time)} – ${subject}';
	@override String body({required Object room}) => 'Кабинет ${room}';
}

// Path: notification.upcomingAssignments
class _TranslationsNotificationUpcomingAssignmentsRu extends TranslationsNotificationUpcomingAssignmentsEn {
	_TranslationsNotificationUpcomingAssignmentsRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ближайшие задания';
}

/// The flat map containing all translations for locale <ru>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsRu {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.title' => 'Дневник школьника',
			'updateInfo.title' => 'Что нового',
			'updateInfo.text.0' => '• Улучшены тексты виджета',
			'updateInfo.text.1' => '• Ввод отметки посещения в отдельном диалоге',
			'authScreen.title' => 'Дневник школьника',
			'authScreen.buttonGoogle' => 'Войти через Google',
			'authScreen.buttonLater' => 'Позже',
			'homeScreen.schedule' => 'Дневник',
			'homeScreen.assignments' => 'Задания',
			'homeScreen.bells' => 'Звонки',
			'homeScreen.grades' => 'Оценки',
			'homeScreen.profile' => 'Профиль',
			'homeScreen.migrationInProgress' => 'Обновление данных...',
			'homeScreen.migrationErrorTitle' => 'Ошибка',
			'homeScreen.migrationErrorText' => 'Не удалось обновить данные. Приложение будет закрыто.',
			'assignmentsScreen.title' => 'Задания',
			'assignmentsScreen.noData' => 'Нет заданий\nДобавьте задания в дневник',
			'noteDetailScreen.title' => 'Заметки',
			'noteDetailScreen.textHint' => 'Текст',
			'profileScreen.title' => 'Профиль',
			'profileScreen.subjects' => 'Предметы',
			'profileScreen.teachers' => 'Учителя',
			'profileScreen.terms' => 'Периоды',
			'profileScreen.labels' => 'Ярлыки',
			'profileScreen.settings' => 'Настройки',
			'profileScreen.about' => 'О приложении',
			'profileScreen.welcomeText' => ({required Object name}) => 'Привет, ${name}!',
			'profileScreen.signInButton' => 'Войти',
			'scheduleScreen.numberHeader' => '#',
			'scheduleScreen.lessonHeader' => 'Урок',
			'scheduleScreen.gradeHeader' => '☆',
			'scheduleScreen.noteHint' => 'Заметки',
			'bellsScreen.title' => 'Звонки',
			'bellsScreen.period' => 'Урок',
			'bellsScreen.start' => 'Начало',
			'bellsScreen.end' => 'Конец',
			'bellsScreen.kBreak' => 'Перерыв',
			'bellsScreen.breakText' => ({required Object minutes}) => '${minutes} мин',
			'gradeBookScreen.title' => 'Журнал',
			'gradeBookScreen.yearTitle' => 'Год',
			'gradeBookScreen.termTitle' => 'Период',
			'gradeReportScreen.title' => 'Табель',
			'gradeReportScreen.yearTitle' => 'Год',
			'gradeReportScreen.termTitle' => 'Период',
			'gradeBookView.subject' => 'Предмет',
			'gradeBookView.average' => 'Средняя',
			'gradeBookView.noData' => 'Нет оценок\nДобавьте оценки в дневник',
			'gradeReportView.subject' => 'Предмет',
			'gradeReportView.terms.0' => 'I',
			'gradeReportView.terms.1' => 'II',
			'gradeReportView.terms.2' => 'III',
			'gradeReportView.terms.3' => 'IV',
			'gradeReportView.year' => '∑',
			'gradeReportView.noData' => 'Нет периодов\nДобавьте периоды в профиль',
			'gradeReportView.noGrades' => 'Нет оценок\nВыберите другой период',
			'gradesHistoryScreen.date' => 'Дата',
			'gradesHistoryScreen.grade' => 'Оценка',
			'gradesHistoryScreen.comment' => 'Комментарий',
			'gradesHistoryScreen.noData' => 'Нет оценок',
			'helpScreen.title' => 'О приложении',
			'helpScreen.versionText' => ({required Object version, required Object build}) => 'Версия ${version} (${build})',
			'helpScreen.shareApp' => 'Поделиться приложением',
			'helpScreen.rateApp' => 'Оценить приложение',
			'helpScreen.contactDev' => 'Написать разработчику',
			'helpScreen.deleteProfile' => 'Удалить профиль',
			'assignmentDetailScreen.title' => 'Задание',
			'assignmentDetailScreen.moveTitle' => 'Перенести задание',
			'lessonDetailScreen.title' => ({required Object slot}) => 'Урок ${slot}',
			'lessonDetailScreen.subjectHint' => 'Предмет',
			'lessonDetailScreen.topicHint' => 'Тема',
			'lessonDetailScreen.roomHint' => 'Кабинет',
			'lessonDetailScreen.roomPrefix' => 'Кабинет',
			'settingsScreen.title' => 'Настройки',
			'settingsScreen.general' => 'Общие',
			'settingsScreen.advanced' => 'Дополнительные',
			'settingsScreen.reminders' => 'Напоминания',
			'settingsScreen.schedule' => 'Расписание',
			'settingsScreen.grades' => 'Оценки',
			'settingsScreen.importantButton' => 'Важно',
			'settingsScreen.importantTitle' => 'Важно',
			'settingsScreen.importantText' => 'Для корректной работы приложения на устройствах Xiaomi, Huawei, Vivo и Oppo настройте системные параметры для приложения:\n• Автозапуск – включено\n• Фоновая работа – включено\n• Экономия батареи – отключено',
			'generalSettingsScreen.title' => 'Общие',
			'generalSettingsScreen.appLanguage' => 'Язык приложения',
			'generalSettingsScreen.themeMode' => 'Режим темы',
			'generalSettingsScreen.baseColor' => 'Базовый цвет',
			'generalSettingsScreen.backgroundImage' => 'Изображение фона',
			'generalSettingsScreen.backgroundImageNone' => 'Нет',
			'generalSettingsScreen.appFont' => 'Шрифт приложения',
			'advancedSettingsScreen.title' => 'Дополнительные',
			'advancedSettingsScreen.lessonMode' => 'Режим урока',
			'advancedSettingsScreen.lessonModeDisabled' => 'Отключено',
			'remindersSettingsScreen.title' => 'Напоминания',
			'remindersSettingsScreen.lessonStart' => 'Начало урока',
			'remindersSettingsScreen.lessonStartText' => ({required Object time}) => 'За ${time} до звонка',
			'remindersSettingsScreen.lessonStartDisabled' => 'Отключено',
			'remindersSettingsScreen.upcomingAssignments' => 'Ближайшие задания',
			'remindersSettingsScreen.upcomingAssignmentsText' => ({required Object time}) => 'Ежедневно в ${time}',
			'remindersSettingsScreen.upcomingAssignmentsDisabled' => 'Отключено',
			'scheduleSettingsScreen.title' => 'Расписание',
			'scheduleSettingsScreen.academicTerm' => 'Учебный период',
			'scheduleSettingsScreen.classDays' => 'Учебные дни',
			'scheduleSettingsScreen.periodCount' => 'Количество уроков',
			'scheduleSettingsScreen.periodCountText' => ({required Object count}) => '${count} уроков в день',
			'scheduleSettingsScreen.repeatSchedule' => 'Повтор расписания',
			'scheduleSettingsScreen.bellSchedule' => 'Расписание звонков',
			'gradesSettingsScreen.title' => 'Оценки',
			'gradesSettingsScreen.gradeScale' => 'Шкала оценок',
			'gradesSettingsScreen.signValues' => 'Значения знаков',
			'gradesSettingsScreen.signValuesText' => ({required Object plus, required Object minus}) => 'Плюс: ${plus}, Минус: ${minus}',
			'gradesSettingsScreen.signValuesPlus' => 'Плюс',
			'gradesSettingsScreen.signValuesMinus' => 'Минус',
			'gradesSettingsScreen.roundingRules' => 'Правила округления',
			'gradesSettingsScreen.roundingRulesText' => ({required Object threshold, required Object precision}) => 'Порог: ${threshold}, Точность: ${precision}',
			'gradesSettingsScreen.roundingRulesThreshold' => 'Порог',
			'gradesSettingsScreen.roundingRulesPrecision' => 'Точность',
			'gradesSettingsScreen.gradeColors' => 'Цвета оценок',
			'gradesSettingsScreen.gradeColorsTitle' => 'Цвет',
			'gradesSettingsScreen.gradeColorsOther' => 'Другие',
			'gradesSettingsScreen.attendanceMarks' => 'Отметки посещений',
			'gradesSettingsScreen.attendanceMark' => 'Новая отметка',
			'gradesSettingsScreen.attendanceName' => 'Название',
			'subjectDetailScreen.title' => 'Предмет',
			'subjectDetailScreen.nameHint' => 'Название',
			'subjectDetailScreen.roomHint' => 'Кабинет',
			'subjectsScreen.title' => 'Предметы',
			'subjectsScreen.noData' => 'Нет предметов',
			'teacherDetailScreen.title' => 'Учитель',
			'teacherDetailScreen.nameHint' => 'Имя',
			'teacherDetailScreen.subjectHint' => 'Предмет',
			'teacherDetailScreen.noteHint' => 'Примечание',
			'teachersScreen.title' => 'Учителя',
			'teachersScreen.noData' => 'Нет учителей',
			'termDetailScreen.title' => 'Период',
			'termDetailScreen.typeHint' => 'Тип',
			'termDetailScreen.typeTitle' => 'Тип',
			'termDetailScreen.yearHint' => 'Год',
			'termDetailScreen.yearTitle' => 'Год',
			'termDetailScreen.nameHint' => 'Название',
			'termDetailScreen.startHint' => 'Начало',
			'termDetailScreen.endHint' => 'Конец',
			'termsScreen.title' => 'Периоды',
			'termsScreen.noData' => 'Нет периодов',
			'labelDetailScreen.title' => 'Ярлык',
			'labelDetailScreen.nameHint' => 'Название',
			'labelDetailScreen.colorHint' => 'Цвет',
			'labelDetailScreen.dialogTitle' => 'Цвет',
			'labelsScreen.title' => 'Ярлыки',
			'labelsScreen.noData' => 'Нет ярлыков',
			'gradeInputDialog.gradeTitle' => 'Оценка',
			'gradeInputDialog.attendanceTitle' => 'Посещение',
			'gradeInputDialog.valueHint' => 'Значение',
			'gradeInputDialog.weightHint' => 'Вес',
			'gradeInputDialog.commentHint' => 'Комментарий',
			'gradeInputDialog.markHint' => 'Отметка',
			'gradeInputDialog.gradeButton' => 'ОЦЕНКА',
			'gradeInputDialog.attdendanceButton' => 'ПОСЕЩЕНИЕ',
			'signInDialog.appleButton' => 'Вход с Apple',
			'signInDialog.googleButton' => 'Вход с Google',
			'assignmentField.hintText' => 'Задание',
			'assignmentField.addText' => 'Новый пункт',
			'assignmentField.labelTitle' => 'Ярлык',
			'assignmentField.actionTitle' => 'Добавить',
			'assignmentField.imageTitle' => 'Задание',
			'assignmentField.imageError' => 'Файл не найден',
			'notificationChannel.reminders' => 'Напоминания',
			'button.ok' => 'ОК',
			'button.cancel' => 'ОТМЕНА',
			'button.save' => 'СОХРАНИТЬ',
			'button.delete' => 'УДАЛИТЬ',
			'button.clear' => 'ОЧИСТИТЬ',
			'message.assignmentCompleted' => 'Задание выполнено',
			'message.dataUpdated' => 'Данные обновлены',
			'message.profileDeleted' => 'Профиль удален',
			'message.errorOccurred' => 'Произошла ошибка',
			'message.noConnection' => 'Нет подключения',
			'prompt.titleConfirmation' => 'Подтверждение',
			'prompt.deleteGrade' => 'Удалить эту оценку?',
			'prompt.deleteImage' => 'Удалить это изображение?',
			'prompt.deleteAvatar' => 'Удалить этот аватар?',
			'prompt.deleteNote' => 'Удалить эти заметки?',
			'prompt.deleteSubject' => 'Удалить этот предмет?',
			'prompt.deleteTeacher' => 'Удалить этого учителя?',
			'prompt.deleteTerm' => 'Удалить этот период?',
			'prompt.deleteLabel' => 'Удалить этот ярлык?',
			'prompt.deleteAssignment' => 'Удалить это задание?',
			'prompt.deleteLesson' => 'Удалить этот урок?',
			'prompt.deleteProfile' => 'Удалить профиль и все данные?',
			'prompt.resetSubjects' => 'Установить предметы по умолчанию?',
			'prompt.resetLabels' => 'Установить ярлыки по умолчанию?',
			'prompt.requirePermission' => 'Для корректной работы приложения требуется разрешение. Открыть настройки?',
			'prompt.signOut' => 'Выйти из учётной записи?',
			'notification.lessonStart.title' => ({required DateTime time, required Object subject}) => '${DateFormat.jm('ru').format(time)} – ${subject}',
			'notification.lessonStart.body' => ({required Object room}) => 'Кабинет ${room}',
			'notification.upcomingAssignments.title' => 'Ближайшие задания',
			'dateFormat.range' => ({required Object from, required Object to}) => 'с ${from} по ${to}',
			'dateFormat.today' => 'Сегодня',
			'dateFormat.tomorrow' => 'Завтра',
			'themeMode.light' => 'Светлый',
			'themeMode.dark' => 'Темный',
			'themeMode.system' => 'Системный',
			'lessonMode.priority' => 'Только важное',
			'lessonMode.alarms' => 'Только будильники',
			'lessonMode.silent' => 'Не беспокоить',
			'assignmentStatus.current' => 'Текущие',
			'assignmentStatus.missed' => 'Пропущенные',
			'userAction.move' => 'Перенести',
			'userAction.share' => 'Поделиться',
			'userAction.delete' => 'Удалить',
			'userAction.addPhoto' => 'Фото',
			'userAction.addImage' => 'Изображение',
			'userAction.addLabel' => 'Ярлык',
			'userAction.addText' => 'Текст',
			'userAction.addList' => 'Список',
			'repeatSchedule.weekly' => 'Каждую неделю',
			'repeatSchedule.biweekly' => 'Каждые 2 недели',
			'repeatSchedule.never' => 'Никогда',
			'bellSchedule.common' => 'Общее',
			'bellSchedule.daily' => 'По дням',
			'gradeScale.numeric5' => '5-бальная',
			'gradeScale.numeric10' => '10-бальная',
			'gradeScale.numeric12' => '12-бальная',
			'gradeScale.numeric20' => '20-бальная',
			'gradeScale.numeric100' => '100-бальная',
			'reminderTime.minutes5' => '5 минут',
			'reminderTime.minutes10' => '10 минут',
			'reminderTime.minutes15' => '15 минут',
			'reminderTime.minutes20' => '20 минут',
			'academicTerm.quarter' => 'Четверть',
			'academicTerm.trimester' => 'Триместер',
			'academicTerm.semester' => 'Семестр',
			'termType.year' => 'Год',
			'termType.study' => 'Учёба',
			'termType.vacation' => 'Каникулы',
			'termType.holiday' => 'Праздник',
			'color.red' => 'Красный',
			'color.pink' => 'Розовый',
			'color.purple' => 'Фиолетовый',
			'color.deepPurple' => 'Темно-фиолетовый',
			'color.indigo' => 'Сине-фиолетовый',
			'color.blue' => 'Синий',
			'color.lightBlue' => 'Светло-синий',
			'color.cyan' => 'Голубой',
			'color.teal' => 'Бирюзовый',
			'color.green' => 'Зелёный',
			'color.lightGreen' => 'Светло-зелёный',
			'color.lime' => 'Лаймовый',
			'color.yellow' => 'Жёлтый',
			'color.amber' => 'Янтарный',
			'color.orange' => 'Оранжевый',
			'color.blueGrey' => 'Серо-голубой',
			_ => null,
		};
	}
}
