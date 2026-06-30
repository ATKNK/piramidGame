import 'package:auto_injector/auto_injector.dart';
import 'package:piramidgame/data/repositories/student_repository_impl.dart';
import 'package:piramidgame/data/repositories/student_repository_interface.dart';
import 'package:piramidgame/data/services/student_interface.dart';
import 'package:piramidgame/data/services/student_shared_preferences_impl.dart';
import 'package:piramidgame/domain/facades/student_facade_impl.dart';
import 'package:piramidgame/domain/facades/student_facade_interface.dart';
import 'package:piramidgame/domain/usecases/student_usecases_impl.dart';
import 'package:piramidgame/domain/usecases/student_usecases_interface.dart';
import 'package:piramidgame/presentation/controllers/student_viewmodel.dart';

final injector = AutoInjector();

void setupInjector() {
  injector.addSingleton<IStudentLocalStorage>(StudentSharedPreferencesImpl.new);
  injector.addSingleton<IStudentRepository>(StudentRepositoryImpl.new);
  injector.addSingleton<ISaveStudentUseCase>(SaveStudentUseCaseImpl.new);
  injector.addSingleton<IGetStudentByIdUseCase>(GetStudentByIdUseCaseImpl.new);
  injector.addSingleton<IGetAllStudentsUseCase>(GetAllStudentsUseCaseImpl.new);
  injector.addSingleton<IUpdateStudentUseCase>(UpdateStudentUseCaseImpl.new);
  injector.addSingleton<IDeleteStudentUseCase>(DeleteStudentUseCaseImpl.new);
  injector.addSingleton<ICalculateRankUseCase>(CalculateRankUseCaseImpl.new);
  injector.addSingleton<IStudentFacadeUseCases>(StudentFacadeImpl.new);
  injector.addSingleton<StudentViewmodel>(StudentViewmodel.new);

  injector.commit();
}
