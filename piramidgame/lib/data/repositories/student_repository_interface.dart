import 'package:piramidgame/core/typedefs/types_defs.dart';
import 'package:piramidgame/domain/models/student_entity.dart';

abstract interface class IStudentRepository {
  Future<StudentResult> saveStudent(Student s);
  Future<ListStudentResult> getAllStudents();
  Future<StudentResult> getStudentById(String id);
  Future<StudentResult> updateStudent(Student s);
  Future<StudentResult> deleteStudent(Student s);
}
