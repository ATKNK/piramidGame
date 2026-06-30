import 'package:piramidgame/core/typedefs/types_defs.dart';
import 'package:piramidgame/data/services/student_interface.dart';
import 'package:piramidgame/domain/models/student_entity.dart';
import 'package:piramidgame/data/repositories/student_repository_interface.dart';

final class StudentRepositoryImpl implements IStudentRepository {
  final IStudentLocalStorage _service;

  StudentRepositoryImpl({required IStudentLocalStorage service})
    : _service = service;

  @override
  Future<StudentResult> saveStudent(Student s) {
    return _service.saveStudent(s);
  }

  @override
  Future<ListStudentResult> getAllStudents() {
    return _service.getAllStudents();
  }

  @override
  Future<StudentResult> getStudentById(String id) {
    return _service.getStudentById(id);
  }

  @override
  Future<StudentResult> updateStudent(Student s) {
    return _service.updateStudent(s);
  }

  @override
  Future<StudentResult> deleteStudent(Student s) {
    return _service.deleteStudent(s);
  }
}
