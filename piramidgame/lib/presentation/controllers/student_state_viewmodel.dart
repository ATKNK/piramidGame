import '../../domain/models/student_entity.dart';
import 'package:signals_flutter/signals_flutter.dart';

enum StudentSuccessEvent { created, updated, deleted }

class StudentStateViewModel {
  final students = signal<List<Student>>([]);
  final selectedStudent = signal<Student?>(null);
  final message = signal<String?>(null);
  final successEvent = signal<StudentSuccessEvent?>(null);

  late final hasStudents = computed(() => students.value.isNotEmpty);

  void setStudents(List<Student> list) => students.value = list;
  void setSelectedStudent(Student? student) => selectedStudent.value = student;
  void clearMessage() => message.value = null;
  void setMessage(String msg) => message.value = msg;
  void clearSuccessEvent() => successEvent.value = null;
}
