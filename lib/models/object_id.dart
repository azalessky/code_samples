import 'package:uuid/uuid.dart';

class ObjectId {
  final String value;

  ObjectId() : value = Uuid().v4().replaceAll('-', '');
}
