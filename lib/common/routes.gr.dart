// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'routes.dart';

/// generated route for
/// [AssignmentDetailScreen]
class AssignmentDetailRoute extends PageRouteInfo<AssignmentDetailRouteArgs> {
  AssignmentDetailRoute({
    Assignment? assignment,
    Period? period,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         AssignmentDetailRoute.name,
         args: AssignmentDetailRouteArgs(
           assignment: assignment,
           period: period,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'AssignmentDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AssignmentDetailRouteArgs>(
        orElse: () => const AssignmentDetailRouteArgs(),
      );
      return AssignmentDetailScreen(
        assignment: args.assignment,
        period: args.period,
        key: args.key,
      );
    },
  );
}

class AssignmentDetailRouteArgs {
  const AssignmentDetailRouteArgs({this.assignment, this.period, this.key});

  final Assignment? assignment;

  final Period? period;

  final Key? key;

  @override
  String toString() {
    return 'AssignmentDetailRouteArgs{assignment: $assignment, period: $period, key: $key}';
  }
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
/// [GradeHistoryScreen]
class GradeHistoryRoute extends PageRouteInfo<GradeHistoryRouteArgs> {
  GradeHistoryRoute({
    required String subject,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         GradeHistoryRoute.name,
         args: GradeHistoryRouteArgs(subject: subject, key: key),
         initialChildren: children,
       );

  static const String name = 'GradeHistoryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<GradeHistoryRouteArgs>();
      return GradeHistoryScreen(subject: args.subject, key: args.key);
    },
  );
}

class GradeHistoryRouteArgs {
  const GradeHistoryRouteArgs({required this.subject, this.key});

  final String subject;

  final Key? key;

  @override
  String toString() {
    return 'GradeHistoryRouteArgs{subject: $subject, key: $key}';
  }
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
    required List<String> images,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         ImageRoute.name,
         args: ImageRouteArgs(
           initialValue: initialValue,
           title: title,
           images: images,
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
        images: args.images,
        key: args.key,
      );
    },
  );
}

class ImageRouteArgs {
  const ImageRouteArgs({
    required this.initialValue,
    required this.title,
    required this.images,
    this.key,
  });

  final String initialValue;

  final String title;

  final List<String> images;

  final Key? key;

  @override
  String toString() {
    return 'ImageRouteArgs{initialValue: $initialValue, title: $title, images: $images, key: $key}';
  }
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
    Subject? subject,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         SubjectDetailRoute.name,
         args: SubjectDetailRouteArgs(subject: subject, key: key),
         initialChildren: children,
       );

  static const String name = 'SubjectDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SubjectDetailRouteArgs>(
        orElse: () => const SubjectDetailRouteArgs(),
      );
      return SubjectDetailScreen(subject: args.subject, key: args.key);
    },
  );
}

class SubjectDetailRouteArgs {
  const SubjectDetailRouteArgs({this.subject, this.key});

  final Subject? subject;

  final Key? key;

  @override
  String toString() {
    return 'SubjectDetailRouteArgs{subject: $subject, key: $key}';
  }
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
/// [SubscriptionsScreen]
class SubscriptionsRoute extends PageRouteInfo<void> {
  const SubscriptionsRoute({List<PageRouteInfo>? children})
    : super(SubscriptionsRoute.name, initialChildren: children);

  static const String name = 'SubscriptionsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SubscriptionsScreen();
    },
  );
}

/// generated route for
/// [TeacherDetailScreen]
class TeacherDetailRoute extends PageRouteInfo<TeacherDetailRouteArgs> {
  TeacherDetailRoute({
    Teacher? teacher,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         TeacherDetailRoute.name,
         args: TeacherDetailRouteArgs(teacher: teacher, key: key),
         initialChildren: children,
       );

  static const String name = 'TeacherDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TeacherDetailRouteArgs>(
        orElse: () => const TeacherDetailRouteArgs(),
      );
      return TeacherDetailScreen(teacher: args.teacher, key: args.key);
    },
  );
}

class TeacherDetailRouteArgs {
  const TeacherDetailRouteArgs({this.teacher, this.key});

  final Teacher? teacher;

  final Key? key;

  @override
  String toString() {
    return 'TeacherDetailRouteArgs{teacher: $teacher, key: $key}';
  }
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
  TermDetailRoute({Term? term, Key? key, List<PageRouteInfo>? children})
    : super(
        TermDetailRoute.name,
        args: TermDetailRouteArgs(term: term, key: key),
        initialChildren: children,
      );

  static const String name = 'TermDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TermDetailRouteArgs>(
        orElse: () => const TermDetailRouteArgs(),
      );
      return TermDetailScreen(term: args.term, key: args.key);
    },
  );
}

class TermDetailRouteArgs {
  const TermDetailRouteArgs({this.term, this.key});

  final Term? term;

  final Key? key;

  @override
  String toString() {
    return 'TermDetailRouteArgs{term: $term, key: $key}';
  }
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
