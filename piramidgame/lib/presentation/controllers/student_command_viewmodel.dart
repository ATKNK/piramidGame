import '../../core/failure/failure.dart';
import '../../core/patterns/command.dart';
import '../../domain/models/student_entity.dart';
import '../commands/student_commands.dart';
import 'student_state_viewmodel.dart';
import 'package:signals_flutter/signals_flutter.dart';

class StudentCommandsViewmodel {
  final StudentStateViewModel state;
  final SaveStudentCommand _saveStudentCommand;
  final GetAllStudentsCommand _getAllStudentsCommand;
  final GetStudentByIdCommand _getStudentByIdCommand;
  final UpdateStudentCommand _updateStudentCommand;
  final DeleteStudentCommand _deleteStudentCommand;
  final CalculateRankCommand _calculateRankCommand;

  StudentCommandsViewmodel({
    required this.state,
    required SaveStudentCommand saveStudentCommand,
    required GetAllStudentsCommand getAllStudentsCommand,
    required GetStudentByIdCommand getStudentByIdCommand,
    required UpdateStudentCommand updateStudentCommand,
    required DeleteStudentCommand deleteStudentCommand,
    required CalculateRankCommand calculateRankCommand,
  }) : _saveStudentCommand = saveStudentCommand,
       _getAllStudentsCommand = getAllStudentsCommand,
       _getStudentByIdCommand = getStudentByIdCommand,
       _updateStudentCommand = updateStudentCommand,
       _deleteStudentCommand = deleteStudentCommand,
       _calculateRankCommand = calculateRankCommand {
    _observeSaveStudent();
    _observeGetAllStudents();
    _observeGetStudentById();
    _observeUpdateStudent();
    _observeDeleteStudent();
    _observeCalculateRank();
  }

  SaveStudentCommand get saveStudentCommand => _saveStudentCommand;
  GetAllStudentsCommand get getAllStudentsCommand => _getAllStudentsCommand;
  GetStudentByIdCommand get getStudentByIdCommand => _getStudentByIdCommand;
  UpdateStudentCommand get updateStudentCommand => _updateStudentCommand;
  DeleteStudentCommand get deleteStudentCommand => _deleteStudentCommand;
  CalculateRankCommand get calculateRankCommand => _calculateRankCommand;

  void _observeCommand<T>(
    Command<T, Failure> command, {
    required void Function(T data) onSuccess,
    void Function(Failure err)? onFailure,
  }) {
    effect(() {
      if (command.isExecuting.value) return;

      final result = command.result.value;
      if (result == null) return;

      result.fold(
        onSuccess: (data) {
          state.clearMessage();
          onSuccess(data);
          command.clear();
        },
        onFailure: (err) {
          state.setMessage(err.msg);
          if (onFailure != null) onFailure(err);
          command.clear();
        },
      );
    });
  }

  void _observeSaveStudent() {
    _observeCommand<Student>(
      _saveStudentCommand,
      onSuccess: (student) {
        state.successEvent.value = StudentSuccessEvent.created;
        fetchAllStudents();
      },
    );
  }

  void _observeGetAllStudents() {
    _observeCommand<List<Student>>(
      _getAllStudentsCommand,
      onSuccess: (students) {
        state.setStudents(students);
      },
    );
  }

  void _observeGetStudentById() {
    _observeCommand<Student>(
      _getStudentByIdCommand,
      onSuccess: (student) {
        state.setSelectedStudent(student);
      },
    );
  }

  void _observeUpdateStudent() {
    _observeCommand<Student>(
      _updateStudentCommand,
      onSuccess: (student) {
        state.successEvent.value = StudentSuccessEvent.updated;
        fetchAllStudents();
      },
    );
  }

  void _observeDeleteStudent() {
    _observeCommand<Student>(
      _deleteStudentCommand,
      onSuccess: (student) {
        state.successEvent.value = StudentSuccessEvent.deleted;
        fetchAllStudents();
      },
    );
  }

  void _observeCalculateRank() {
    _observeCommand<List<Student>>(
      _calculateRankCommand,
      onSuccess: (rankedStudents) {
        state.setStudents(rankedStudents);
      },
    );
  }

  Future<void> fetchAllStudents() async {
    state.clearMessage();
    await _getAllStudentsCommand.call();
  }

  Future<void> getStudentById(String id) async {
    state.clearMessage();
    await _getStudentByIdCommand.executeWith(id);
  }

  Future<void> saveStudent(Student student) async {
    state.clearMessage();
    await _saveStudentCommand.executeWith(student);
  }

  Future<void> updateStudent(Student student) async {
    state.clearMessage();
    await _updateStudentCommand.executeWith(student);
  }

  Future<void> deleteStudent(Student student) async {
    state.clearMessage();
    await _deleteStudentCommand.executeWith(student);
  }

  Future<void> calculateRank() async {
    state.clearMessage();
    await _calculateRankCommand.executeWith(state.students.value);
  }
}
