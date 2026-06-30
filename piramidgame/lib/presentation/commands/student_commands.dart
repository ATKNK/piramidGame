import 'package:piramidgame/core/typedefs/types_defs.dart';

import '../../core/failure/failure.dart';
import '../../core/patterns/command.dart';
import '../../core/patterns/result.dart';
import '../../domain/facades/student_facade_interface.dart';
import '../../domain/models/student_entity.dart';

final class SaveStudentCommand
    extends ParameterizedCommand<Student, Failure, Student> {
  final IStudentFacadeUseCases _facade;
  SaveStudentCommand(this._facade);

  @override
  Future<Result<Student, Failure>> execute() {
    return _facade.saveStudent(parameter as Student);
  }
}

final class GetAllStudentsCommand extends Command<List<Student>, Failure> {
  final IStudentFacadeUseCases _facade;
  GetAllStudentsCommand(this._facade);

  @override
  Future<Result<List<Student>, Failure>> execute() {
    return _facade.getAllStudents();
  }
}

final class GetStudentByIdCommand
    extends ParameterizedCommand<Student, Failure, String> {
  final IStudentFacadeUseCases _facade;
  GetStudentByIdCommand(this._facade);

  @override
  Future<Result<Student, Failure>> execute() {
    return _facade.getStudentById(parameter as String);
  }
}

final class UpdateStudentCommand
    extends ParameterizedCommand<Student, Failure, Student> {
  final IStudentFacadeUseCases _facade;
  UpdateStudentCommand(this._facade);

  @override
  Future<Result<Student, Failure>> execute() {
    return _facade.updateStudent(parameter as Student);
  }
}

final class DeleteStudentCommand
    extends ParameterizedCommand<Student, Failure, Student> {
  final IStudentFacadeUseCases _facade;
  DeleteStudentCommand(this._facade);

  @override
  Future<Result<Student, Failure>> execute() {
    return _facade.deleteStudent(parameter as Student);
  }
}

final class CalculateRankCommand
    extends ParameterizedCommand<List<Student>, Failure, List<Student>> {
  final IStudentFacadeUseCases _facade;
  CalculateRankCommand(this._facade);

  @override
  Future<Result<List<Student>, Failure>> execute() {
    final rankedList = _facade.calculateRank(parameter as List<Student>);
    return Future.value(Success(rankedList));
  }
}
