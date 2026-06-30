import 'package:piramidgame/core/typedefs/types_defs.dart';
import 'package:piramidgame/domain/models/student_entity.dart';

abstract interface class IStudentFacadeUseCases {
  Future<StudentResult> saveStudent(Student s);
  Future<StudentResult> getStudentById(String id);
  Future<ListStudentResult> getAllStudents();
  Future<StudentResult> updateStudent(Student s);
  Future<StudentResult> deleteStudent(Student s);
  List<Student> calculateRank(List<Student> students);
}
