import 'package:piramidgame/core/typedefs/types_defs.dart';
import 'package:piramidgame/data/repositories/student_repository_interface.dart';
import 'package:piramidgame/domain/models/student_entity.dart';
import 'package:piramidgame/domain/usecases/student_usecases_interface.dart';

final class SaveStudentUseCaseImpl implements ISaveStudentUseCase {
  final IStudentRepository _repository;

  SaveStudentUseCaseImpl({required IStudentRepository repository})
    : _repository = repository;

  @override
  Future<StudentResult> call(Student s) async {
    return _repository.saveStudent(s);
  }
}

final class GetStudentByIdUseCaseImpl implements IGetStudentByIdUseCase {
  final IStudentRepository _repository;

  GetStudentByIdUseCaseImpl({required IStudentRepository repository})
    : _repository = repository;

  @override
  Future<StudentResult> call(String id) async {
    return _repository.getStudentById(id);
  }
}

final class GetAllStudentsUseCaseImpl implements IGetAllStudentsUseCase {
  final IStudentRepository _repository;

  GetAllStudentsUseCaseImpl({required IStudentRepository repository})
    : _repository = repository;

  @override
  Future<ListStudentResult> call() async {
    return _repository.getAllStudents();
  }
}

final class UpdateStudentUseCaseImpl implements IUpdateStudentUseCase {
  final IStudentRepository _repository;

  UpdateStudentUseCaseImpl({required IStudentRepository repository})
    : _repository = repository;

  @override
  Future<StudentResult> call(Student s) async {
    return _repository.updateStudent(s);
  }
}

final class DeleteStudentUseCaseImpl implements IDeleteStudentUseCase {
  final IStudentRepository _repository;

  DeleteStudentUseCaseImpl({required IStudentRepository repostory})
    : _repository = repostory;

  @override
  Future<StudentResult> call(Student s) async {
    return _repository.deleteStudent(s);
  }
}

final class CalculateRankUseCaseImpl implements ICalculateRankUseCase {
  @override
  List<Student> call(List<Student> students) {
    final copy = [...students];
    copy.sort((a, b) => b.legendLevel.compareTo((a.legendLevel)));
    return copy;
  }
}
