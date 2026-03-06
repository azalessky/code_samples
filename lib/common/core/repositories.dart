import 'package:student_planner/models/models.dart';
import 'package:student_planner/repositories/repositories.dart';

final assignmentsRepository = ListRepository<Assignment>('data/assignments', Assignment.fromJson);
final bellsRepository = ListRepository<Bell>('data/bells', Bell.fromJson);
final gradesRepository = ListRepository<Grade>('data/grades', Grade.fromJson);
final labelsRepository = ListRepository<Label>('data/labels', Label.fromJson);
final notesRepository = ListRepository<Note>('data/notes', Note.fromJson);
final periodsRepository = ListRepository<Period>('data/periods', Period.fromJson);
final settingsRepository = ObjectRepository<Config>('data/settings', Config.fromJson);
final subjectsRepository = ListRepository<Subject>('data/subjects', Subject.fromJson);
final teachersRepository = ListRepository<Teacher>('data/teachers', Teacher.fromJson);
final termsRepository = ListRepository<Term>('data/terms', Term.fromJson);
