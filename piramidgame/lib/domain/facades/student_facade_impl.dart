import 'package:piramidgame/core/typedefs/types_defs.dart';
import 'package:piramidgame/domain/facades/student_facade_interface.dart';
import 'package:piramidgame/domain/models/student_entity.dart';
import 'package:piramidgame/domain/usecases/student_usecases_interface.dart';

final class StudentFacadeImpl implements IStudentFacadeUseCases {
  final ISaveStudentUseCase _saveUseCase;
  final IGetStudentByIdUseCase _getByIdUseCase;
  final IGetAllStudentsUseCase _getAllUseCase;
  final IUpdateStudentUseCase _updateUseCase;
  final IDeleteStudentUseCase _deleteUseCase;
  final ICalculateRankUseCase _calculateRankUseCase;

  StudentFacadeImpl({
    required ISaveStudentUseCase saveUseCase,
    required IGetStudentByIdUseCase getByIdUseCase,
    required IGetAllStudentsUseCase getAllUseCase,
    required IUpdateStudentUseCase updateUseCase,
    required IDeleteStudentUseCase deleteUseCase,
    required ICalculateRankUseCase calculateRankUseCase,
  }) : _saveUseCase = saveUseCase,
       _getByIdUseCase = getByIdUseCase,
       _getAllUseCase = getAllUseCase,
       _updateUseCase = updateUseCase,
       _deleteUseCase = deleteUseCase,
       _calculateRankUseCase = calculateRankUseCase;

  @override
  Future<StudentResult> saveStudent(Student s) {
    return _saveUseCase(s);
  }

  @override
  Future<StudentResult> getStudentById(String id) {
    return _getByIdUseCase(id);
  }

  @override
  Future<ListStudentResult> getAllStudents() {
    return _getAllUseCase();
  }

  @override
  Future<StudentResult> updateStudent(Student s) {
    return _updateUseCase(s);
  }

  @override
  Future<StudentResult> deleteStudent(Student s) {
    return _deleteUseCase(s);
  }

  @override
  List<Student> calculateRank(List<Student> students) {
    return _calculateRankUseCase(students);
  }
}
