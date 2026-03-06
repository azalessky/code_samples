// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'routes.dart';

/// generated route for
/// [AdvancedSettingsScreen]
class AdvancedSettingsRoute extends PageRouteInfo<void> {
  const AdvancedSettingsRoute({List<PageRouteInfo>? children})
    : super(AdvancedSettingsRoute.name, initialChildren: children);

  static const String name = 'AdvancedSettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AdvancedSettingsScreen();
    },
  );
}

/// generated route for
/// [AssignmentDetailScreen]
class AssignmentDetailRoute extends PageRouteInfo<AssignmentDetailRouteArgs> {
  AssignmentDetailRoute({
    Key? key,
    required Assignment assignment,
    List<PageRouteInfo>? children,
  }) : super(
         AssignmentDetailRoute.name,
         args: AssignmentDetailRouteArgs(key: key, assignment: assignment),
         initialChildren: children,
       );

  static const String name = 'AssignmentDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AssignmentDetailRouteArgs>();
      return AssignmentDetailScreen(key: args.key, assignment: args.assignment);
    },
  );
}

class AssignmentDetailRouteArgs {
  const AssignmentDetailRouteArgs({this.key, required this.assignment});

  final Key? key;

  final Assignment assignment;

  @override
  String toString() {
    return 'AssignmentDetailRouteArgs{key: $key, assignment: $assignment}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AssignmentDetailRouteArgs) return false;
    return key == other.key && assignment == other.assignment;
  }

  @override
  int get hashCode => key.hashCode ^ assignment.hashCode;
}

/// generated route for
/// [AssignmentsScreen]
class AssignmentsRoute extends PageRouteInfo<void> {
  const AssignmentsRoute({List<PageRouteInfo>? children})
    : super(AssignmentsRoute.name, initialChildren: children);

  static const String name = 'AssignmentsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AssignmentsScreen();
    },
  );
}

/// generated route for
/// [BellsScreen]
class BellsRoute extends PageRouteInfo<void> {
  const BellsRoute({List<PageRouteInfo>? children})
    : super(BellsRoute.name, initialChildren: children);

  static const String name = 'BellsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const BellsScreen();
    },
  );
}

/// generated route for
/// [DailyScheduleScreen]
class DailyScheduleRoute extends PageRouteInfo<DailyScheduleRouteArgs> {
  DailyScheduleRoute({
    Key? key,
    required DateTime initialDate,
    required PositionController controller,
    List<PageRouteInfo>? children,
  }) : super(
         DailyScheduleRoute.name,
         args: DailyScheduleRouteArgs(
           key: key,
           initialDate: initialDate,
           controller: controller,
         ),
         initialChildren: children,
       );

  static const String name = 'DailyScheduleRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DailyScheduleRouteArgs>();
      return DailyScheduleScreen(
        key: args.key,
        initialDate: args.initialDate,
        controller: args.controller,
      );
    },
  );
}

class DailyScheduleRouteArgs {
  const DailyScheduleRouteArgs({
    this.key,
    required this.initialDate,
    required this.controller,
  });

  final Key? key;

  final DateTime initialDate;

  final PositionController controller;

  @override
  String toString() {
    return 'DailyScheduleRouteArgs{key: $key, initialDate: $initialDate, controller: $controller}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DailyScheduleRouteArgs) return false;
    return key == other.key &&
        initialDate == other.initialDate &&
        controller == other.controller;
  }

  @override
  int get hashCode => key.hashCode ^ initialDate.hashCode ^ controller.hashCode;
}

/// generated route for
/// [GeneralSettingsScreen]
class GeneralSettingsRoute extends PageRouteInfo<void> {
  const GeneralSettingsRoute({List<PageRouteInfo>? children})
    : super(GeneralSettingsRoute.name, initialChildren: children);

  static const String name = 'GeneralSettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const GeneralSettingsScreen();
    },
  );
}

/// generated route for
/// [GradeBookScreen]
class GradeBookRoute extends PageRouteInfo<void> {
  const GradeBookRoute({List<PageRouteInfo>? children})
    : super(GradeBookRoute.name, initialChildren: children);

  static const String name = 'GradeBookRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const GradeBookScreen();
    },
  );
}

/// generated route for
/// [GradeReportScreen]
class GradeReportRoute extends PageRouteInfo<void> {
  const GradeReportRoute({List<PageRouteInfo>? children})
    : super(GradeReportRoute.name, initialChildren: children);

  static const String name = 'GradeReportRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const GradeReportScreen();
    },
  );
}

/// generated route for
/// [GradesHistoryScreen]
class GradesHistoryRoute extends PageRouteInfo<GradesHistoryRouteArgs> {
  GradesHistoryRoute({
    required String subject,
    required Term? term,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         GradesHistoryRoute.name,
         args: GradesHistoryRouteArgs(subject: subject, term: term, key: key),
         initialChildren: children,
       );

  static const String name = 'GradesHistoryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<GradesHistoryRouteArgs>();
      return GradesHistoryScreen(
        subject: args.subject,
        term: args.term,
        key: args.key,
      );
    },
  );
}

class GradesHistoryRouteArgs {
  const GradesHistoryRouteArgs({
    required this.subject,
    required this.term,
    this.key,
  });

  final String subject;

  final Term? term;

  final Key? key;

  @override
  String toString() {
    return 'GradesHistoryRouteArgs{subject: $subject, term: $term, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! GradesHistoryRouteArgs) return false;
    return subject == other.subject && term == other.term && key == other.key;
  }

  @override
  int get hashCode => subject.hashCode ^ term.hashCode ^ key.hashCode;
}

/// generated route for
/// [GradesScreen]
class GradesRoute extends PageRouteInfo<void> {
  const GradesRoute({List<PageRouteInfo>? children})
    : super(GradesRoute.name, initialChildren: children);

  static const String name = 'GradesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const GradesScreen();
    },
  );
}

/// generated route for
/// [GradesSettingsScreen]
class GradesSettingsRoute extends PageRouteInfo<void> {
  const GradesSettingsRoute({List<PageRouteInfo>? children})
    : super(GradesSettingsRoute.name, initialChildren: children);

  static const String name = 'GradesSettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const GradesSettingsScreen();
    },
  );
}

/// generated route for
/// [HelpScreen]
class HelpRoute extends PageRouteInfo<void> {
  const HelpRoute({List<PageRouteInfo>? children})
    : super(HelpRoute.name, initialChildren: children);

  static const String name = 'HelpRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HelpScreen();
    },
  );
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [ImageScreen]
class ImageRoute extends PageRouteInfo<ImageRouteArgs> {
  ImageRoute({
    required String initialValue,
    required String title,
    required String subtitle,
    required String errorText,
    required List<String> images,
    VoidCallback? onDelete,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         ImageRoute.name,
         args: ImageRouteArgs(
           initialValue: initialValue,
           title: title,
           subtitle: subtitle,
           errorText: errorText,
           images: images,
           onDelete: onDelete,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'ImageRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ImageRouteArgs>();
      return ImageScreen(
        initialValue: args.initialValue,
        title: args.title,
        subtitle: args.subtitle,
        errorText: args.errorText,
        images: args.images,
        onDelete: args.onDelete,
        key: args.key,
      );
    },
  );
}

class ImageRouteArgs {
  const ImageRouteArgs({
    required this.initialValue,
    required this.title,
    required this.subtitle,
    required this.errorText,
    required this.images,
    this.onDelete,
    this.key,
  });

  final String initialValue;

  final String title;

  final String subtitle;

  final String errorText;

  final List<String> images;

  final VoidCallback? onDelete;

  final Key? key;

  @override
  String toString() {
    return 'ImageRouteArgs{initialValue: $initialValue, title: $title, subtitle: $subtitle, errorText: $errorText, images: $images, onDelete: $onDelete, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ImageRouteArgs) return false;
    return initialValue == other.initialValue &&
        title == other.title &&
        subtitle == other.subtitle &&
        errorText == other.errorText &&
        const ListEquality<String>().equals(images, other.images) &&
        onDelete == other.onDelete &&
        key == other.key;
  }

  @override
  int get hashCode =>
      initialValue.hashCode ^
      title.hashCode ^
      subtitle.hashCode ^
      errorText.hashCode ^
      const ListEquality<String>().hash(images) ^
      onDelete.hashCode ^
      key.hashCode;
}

/// generated route for
/// [LabelDetailScreen]
class LabelDetailRoute extends PageRouteInfo<LabelDetailRouteArgs> {
  LabelDetailRoute({
    required Label value,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         LabelDetailRoute.name,
         args: LabelDetailRouteArgs(value: value, key: key),
         initialChildren: children,
       );

  static const String name = 'LabelDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LabelDetailRouteArgs>();
      return LabelDetailScreen(value: args.value, key: args.key);
    },
  );
}

class LabelDetailRouteArgs {
  const LabelDetailRouteArgs({required this.value, this.key});

  final Label value;

  final Key? key;

  @override
  String toString() {
    return 'LabelDetailRouteArgs{value: $value, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LabelDetailRouteArgs) return false;
    return value == other.value && key == other.key;
  }

  @override
  int get hashCode => value.hashCode ^ key.hashCode;
}

/// generated route for
/// [LabelsScreen]
class LabelsRoute extends PageRouteInfo<void> {
  const LabelsRoute({List<PageRouteInfo>? children})
    : super(LabelsRoute.name, initialChildren: children);

  static const String name = 'LabelsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LabelsScreen();
    },
  );
}

/// generated route for
/// [LessonDetailScreen]
class LessonDetailRoute extends PageRouteInfo<LessonDetailRouteArgs> {
  LessonDetailRoute({
    Key? key,
    required Period period,
    required Assignment assignment,
    List<PageRouteInfo>? children,
  }) : super(
         LessonDetailRoute.name,
         args: LessonDetailRouteArgs(
           key: key,
           period: period,
           assignment: assignment,
         ),
         initialChildren: children,
       );

  static const String name = 'LessonDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LessonDetailRouteArgs>();
      return LessonDetailScreen(
        key: args.key,
        period: args.period,
        assignment: args.assignment,
      );
    },
  );
}

class LessonDetailRouteArgs {
  const LessonDetailRouteArgs({
    this.key,
    required this.period,
    required this.assignment,
  });

  final Key? key;

  final Period period;

  final Assignment assignment;

  @override
  String toString() {
    return 'LessonDetailRouteArgs{key: $key, period: $period, assignment: $assignment}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LessonDetailRouteArgs) return false;
    return key == other.key &&
        period == other.period &&
        assignment == other.assignment;
  }

  @override
  int get hashCode => key.hashCode ^ period.hashCode ^ assignment.hashCode;
}

/// generated route for
/// [NoteDetailScreen]
class NoteDetailRoute extends PageRouteInfo<NoteDetailRouteArgs> {
  NoteDetailRoute({
    Note? note,
    DateTime? date,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         NoteDetailRoute.name,
         args: NoteDetailRouteArgs(note: note, date: date, key: key),
         initialChildren: children,
       );

  static const String name = 'NoteDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NoteDetailRouteArgs>(
        orElse: () => const NoteDetailRouteArgs(),
      );
      return NoteDetailScreen(note: args.note, date: args.date, key: args.key);
    },
  );
}

class NoteDetailRouteArgs {
  const NoteDetailRouteArgs({this.note, this.date, this.key});

  final Note? note;

  final DateTime? date;

  final Key? key;

  @override
  String toString() {
    return 'NoteDetailRouteArgs{note: $note, date: $date, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! NoteDetailRouteArgs) return false;
    return note == other.note && date == other.date && key == other.key;
  }

  @override
  int get hashCode => note.hashCode ^ date.hashCode ^ key.hashCode;
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfileScreen();
    },
  );
}

/// generated route for
/// [RemindersSettingsScreen]
class RemindersSettingsRoute extends PageRouteInfo<void> {
  const RemindersSettingsRoute({List<PageRouteInfo>? children})
    : super(RemindersSettingsRoute.name, initialChildren: children);

  static const String name = 'RemindersSettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RemindersSettingsScreen();
    },
  );
}

/// generated route for
/// [ScheduleScreen]
class ScheduleRoute extends PageRouteInfo<void> {
  const ScheduleRoute({List<PageRouteInfo>? children})
    : super(ScheduleRoute.name, initialChildren: children);

  static const String name = 'ScheduleRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ScheduleScreen();
    },
  );
}

/// generated route for
/// [ScheduleSettingsScreen]
class ScheduleSettingsRoute extends PageRouteInfo<void> {
  const ScheduleSettingsRoute({List<PageRouteInfo>? children})
    : super(ScheduleSettingsRoute.name, initialChildren: children);

  static const String name = 'ScheduleSettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ScheduleSettingsScreen();
    },
  );
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingsScreen();
    },
  );
}

/// generated route for
/// [SubjectDetailScreen]
class SubjectDetailRoute extends PageRouteInfo<SubjectDetailRouteArgs> {
  SubjectDetailRoute({
    required Subject value,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         SubjectDetailRoute.name,
         args: SubjectDetailRouteArgs(value: value, key: key),
         initialChildren: children,
       );

  static const String name = 'SubjectDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SubjectDetailRouteArgs>();
      return SubjectDetailScreen(value: args.value, key: args.key);
    },
  );
}

class SubjectDetailRouteArgs {
  const SubjectDetailRouteArgs({required this.value, this.key});

  final Subject value;

  final Key? key;

  @override
  String toString() {
    return 'SubjectDetailRouteArgs{value: $value, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SubjectDetailRouteArgs) return false;
    return value == other.value && key == other.key;
  }

  @override
  int get hashCode => value.hashCode ^ key.hashCode;
}

/// generated route for
/// [SubjectsScreen]
class SubjectsRoute extends PageRouteInfo<void> {
  const SubjectsRoute({List<PageRouteInfo>? children})
    : super(SubjectsRoute.name, initialChildren: children);

  static const String name = 'SubjectsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SubjectsScreen();
    },
  );
}

/// generated route for
/// [TeacherDetailScreen]
class TeacherDetailRoute extends PageRouteInfo<TeacherDetailRouteArgs> {
  TeacherDetailRoute({
    required Teacher value,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         TeacherDetailRoute.name,
         args: TeacherDetailRouteArgs(value: value, key: key),
         initialChildren: children,
       );

  static const String name = 'TeacherDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TeacherDetailRouteArgs>();
      return TeacherDetailScreen(value: args.value, key: args.key);
    },
  );
}

class TeacherDetailRouteArgs {
  const TeacherDetailRouteArgs({required this.value, this.key});

  final Teacher value;

  final Key? key;

  @override
  String toString() {
    return 'TeacherDetailRouteArgs{value: $value, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TeacherDetailRouteArgs) return false;
    return value == other.value && key == other.key;
  }

  @override
  int get hashCode => value.hashCode ^ key.hashCode;
}

/// generated route for
/// [TeachersScreen]
class TeachersRoute extends PageRouteInfo<void> {
  const TeachersRoute({List<PageRouteInfo>? children})
    : super(TeachersRoute.name, initialChildren: children);

  static const String name = 'TeachersRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TeachersScreen();
    },
  );
}

/// generated route for
/// [TermDetailScreen]
class TermDetailRoute extends PageRouteInfo<TermDetailRouteArgs> {
  TermDetailRoute({
    Key? key,
    required Term value,
    List<PageRouteInfo>? children,
  }) : super(
         TermDetailRoute.name,
         args: TermDetailRouteArgs(key: key, value: value),
         initialChildren: children,
       );

  static const String name = 'TermDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TermDetailRouteArgs>();
      return TermDetailScreen(key: args.key, value: args.value);
    },
  );
}

class TermDetailRouteArgs {
  const TermDetailRouteArgs({this.key, required this.value});

  final Key? key;

  final Term value;

  @override
  String toString() {
    return 'TermDetailRouteArgs{key: $key, value: $value}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TermDetailRouteArgs) return false;
    return key == other.key && value == other.value;
  }

  @override
  int get hashCode => key.hashCode ^ value.hashCode;
}

/// generated route for
/// [TermsScreen]
class TermsRoute extends PageRouteInfo<void> {
  const TermsRoute({List<PageRouteInfo>? children})
    : super(TermsRoute.name, initialChildren: children);

  static const String name = 'TermsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TermsScreen();
    },
  );
}

/// generated route for
/// [WeeklyScheduleScreen]
class WeeklyScheduleRoute extends PageRouteInfo<WeeklyScheduleRouteArgs> {
  WeeklyScheduleRoute({
    Key? key,
    required DateTime initialDate,
    required PositionController controller,
    List<PageRouteInfo>? children,
  }) : super(
         WeeklyScheduleRoute.name,
         args: WeeklyScheduleRouteArgs(
           key: key,
           initialDate: initialDate,
           controller: controller,
         ),
         initialChildren: children,
       );

  static const String name = 'WeeklyScheduleRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WeeklyScheduleRouteArgs>();
      return WeeklyScheduleScreen(
        key: args.key,
        initialDate: args.initialDate,
        controller: args.controller,
      );
    },
  );
}

class WeeklyScheduleRouteArgs {
  const WeeklyScheduleRouteArgs({
    this.key,
    required this.initialDate,
    required this.controller,
  });

  final Key? key;

  final DateTime initialDate;

  final PositionController controller;

  @override
  String toString() {
    return 'WeeklyScheduleRouteArgs{key: $key, initialDate: $initialDate, controller: $controller}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! WeeklyScheduleRouteArgs) return false;
    return key == other.key &&
        initialDate == other.initialDate &&
        controller == other.controller;
  }

  @override
  int get hashCode => key.hashCode ^ initialDate.hashCode ^ controller.hashCode;
}
