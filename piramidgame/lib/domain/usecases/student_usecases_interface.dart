import 'package:piramidgame/core/patterns/result.dart';
import 'package:piramidgame/core/typedefs/types_defs.dart';
import 'package:piramidgame/domain/models/student_entity.dart';

abstract interface class ISaveStudentUseCase {
  Future<StudentResult> call(Student s);
}

abstract interface class IGetStudentByIdUseCase {
  Future<StudentResult> call(String id);
}

abstract interface class IGetAllStudentsUseCase {
  Future<ListStudentResult> call();
}

abstract interface class IUpdateStudentUseCase {
  Future<StudentResult> call(Student s);
}

abstract interface class IDeleteStudentUseCase {
  Future<StudentResult> call(Student s);
}
