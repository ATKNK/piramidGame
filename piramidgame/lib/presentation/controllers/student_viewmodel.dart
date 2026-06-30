import 'package:piramidgame/domain/facades/student_facade_interface.dart';
import 'package:piramidgame/presentation/commands/student_commands.dart';
import 'package:piramidgame/presentation/controllers/student_command_viewmodel.dart';
import 'package:piramidgame/presentation/controllers/student_state_viewmodel.dart';

class StudentViewmodel {
  late final StudentStateViewModel _state;

  StudentStateViewModel get accountState => _state;

  late final StudentCommandsViewmodel commands;

  StudentViewmodel(IStudentFacadeUseCases facade) {
    _state = StudentStateViewModel();
    commands = StudentCommandsViewmodel(
      state: _state,
      saveStudentCommand: SaveStudentCommand(facade),
      getStudentByIdCommand: GetStudentByIdCommand(facade),
      getAllStudentsCommand: GetAllStudentsCommand(facade),
      updateStudentCommand: UpdateStudentCommand(facade),
      deleteStudentCommand: DeleteStudentCommand(facade),
      calculateRankCommand: CalculateRankCommand(facade),
    );
  }

  SaveStudentCommand get saveStudentCommand => commands.saveStudentCommand;
  GetStudentByIdCommand get getStudentByIdCommand =>
      commands.getStudentByIdCommand;
  GetAllStudentsCommand get getAllStudentsCommand =>
      commands.getAllStudentsCommand;
  UpdateStudentCommand get updateStudentCommand =>
      commands.updateStudentCommand;
  DeleteStudentCommand get deleteStudentCommand =>
      commands.deleteStudentCommand;
  CalculateRankCommand get calculateRankCommand =>
      commands.calculateRankCommand;
}
